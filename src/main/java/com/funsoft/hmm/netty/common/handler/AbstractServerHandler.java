package com.funsoft.hmm.netty.common.handler;

import io.netty.channel.Channel;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandler.Sharable;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

import java.io.IOException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.Future;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

import lombok.Setter;

import com.funsoft.hmm.netty.cdma.handler.CdmaServerHandler;
import com.funsoft.hmm.netty.exception.InvalidDataSizeException;
import com.funsoft.hmm.netty.exception.NotSupprtedMessageIdException;
import com.funsoft.hmm.netty.listener.MessageListener;
import com.funsoft.hmm.netty.listener.MessageSender;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.AsyncResult;

/**
 * USN 과 연결되는 Channel을 통해서 데이터의 read, write 를 처리한다.
 * {@link MessageSender}<MessagePacket> 은 본 채널을 통해서 전송하기 위해서 사용하는 인터페이스.
 * 
 * {@link MessageSender} 를 구현한 핸들러는 {@link GuiServerHandler}, {@link CdmaServerHandler} 총 2개가 되며,
 * {@link Autowired}를 사용하기 위해 {@link Qualifier} 사용한다.
 * 
 * @author taeyo
 *
 */
@Sharable
public abstract class AbstractServerHandler<I, O> extends SimpleChannelInboundHandler<I> implements MessageSender<O> {

	private static final int SYNC_MESSAGE_TIMEOUT_SEC = 2000;
	private static final int RETRY_COUNT = 3;

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private TaskExecutor executor;

	private ConcurrentMap<Integer, BlockingQueue<I>> syncQueueMap = new ConcurrentHashMap<>();
	private Channel channel;

	protected MessageListener<I> listener;

	@Setter
	private int ackWaitTimeout = SYNC_MESSAGE_TIMEOUT_SEC;
	
	@Setter
	private int maxRetryCount = RETRY_COUNT;
	
	public abstract void setListener(MessageListener<I> listener);

	private String getChannelName() {
		return channel.remoteAddress().toString();
	}

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		channel = ctx.channel();
		logger.warn("{} is connected", getChannelName());
		if (listener != null) {
			listener.connectionStateChanged(true);
		}
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		logger.warn("{} was disconnected", getChannelName());
		if (listener != null) {
			listener.connectionStateChanged(false);
		}
	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, I packet) throws Exception {
		
		logger.info("[Incoming] {} {}", getChannelName(), packet);

		if (isAckMessage(packet)) {
			BlockingQueue<I> syncQueue = syncQueueMap.remove(syncQueueKeyByAckMessage(packet));
			if (syncQueue != null) {
				syncQueue.offer(packet);
			}
		} else {
			if (listener != null) {
				listener.messageReceived(packet);
			}
		}
	}

	protected abstract boolean isAckMessage(I in);

	/**
	 * 수신 메시지가 ACK 메시지인 경우 동기 메시지를 위한 blockingQueue의 키를 구한다.
	 */
	protected abstract Integer syncQueueKeyByAckMessage(I in);

	/**
	 * 송신 메시지로 부터 응답을 기다리기 위한 blockingQueue 의 키를 구한다. 
	 */
	protected abstract Integer makeSyncQueueKey(O out);
	
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause)
			throws Exception {
		
		if (cause instanceof IOException) {
			logger.warn("{} => {}", getChannelName(), cause.getMessage());
			return;
		}

		logger.error("{}", getChannelName(), cause);
		
		if (cause instanceof NotSupprtedMessageIdException
				|| cause instanceof InvalidDataSizeException) {
			ctx.channel().close();
		}
	}

    /**
     * 응답이 요구 되는 메시지의 경우 BlockingQueue를 사용하여, 
     * 응답메시지가 오기를 기다린후 응답시간 10000 msec 이 초과했을때 실패로 간주한다.
     * - 응답 메시지는 요청 메시지와 메시지 아이디가 같다.
     * - ACK가 오지 않을 경우 3회 재전송
     */
    @Override
    public boolean sendSyncMessage(O packet) {
    	if (channel == null || !channel.isActive()) return false;
    	
    	int retryCount = 0;

    	// 3회 재전송
    	while(retryCount <= maxRetryCount) {
    		if (send(packet)) {
    			return true;
    		}
    		retryCount++;
    	}
    	return false;
    }

	private boolean send(O packet) {
		channel.writeAndFlush(packet).addListener(ChannelFutureListener.FIRE_EXCEPTION_ON_FAILURE);

		I recvMessage;
		
		Integer key = makeSyncQueueKey(packet);
		try {
			BlockingQueue<I> queue = new SynchronousQueue<I>();
			syncQueueMap.put(key, queue);
			recvMessage = queue.poll(ackWaitTimeout, TimeUnit.MILLISECONDS);

			if (recvMessage != null) {
				if (checkAckMessage(packet, recvMessage)) {
					return true;
				}
			}
		} catch (InterruptedException e) {
			logger.warn("{}", e.getMessage());
		} finally {
			syncQueueMap.remove(key);
		}
    	
    	return false;
	}

	protected abstract boolean checkAckMessage(O out, I in);

    /**
     * 비동기로 메시지 전송 (executor의 ThreadPool 이용) 
     * Ack 메시지 사용
     * 
     */
	@Override
	public Future<Boolean> sendAsyncMessage(final O packet) {
		if (channel == null) return new AsyncResult<Boolean>(false);

		executor.execute(() -> {
			try {
				channel.writeAndFlush(packet).addListener(ChannelFutureListener.FIRE_EXCEPTION_ON_FAILURE);
			} catch (RuntimeException e) {
				logger.error("{}", e);
			}
		});
    	
    	return new AsyncResult<Boolean>(true);
	}

	@Override
	public boolean isConnected() {
		if (channel != null) {
			return channel.isActive();
		} else {
			return false;
		}
	}
	
	@Override
	public void forceClose() {
		if (channel != null) {
			channel.close();
		}
	}
}
