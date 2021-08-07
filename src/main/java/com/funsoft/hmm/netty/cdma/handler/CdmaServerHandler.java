package com.funsoft.hmm.netty.cdma.handler;

import io.netty.channel.ChannelHandlerContext;
import com.funsoft.hmm.netty.annotation.Cdma;
import com.funsoft.hmm.netty.cdma.msg.Ack;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaIncomingMessage;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageHeader;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageType;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaOutgoingMessage;
import com.funsoft.hmm.netty.common.handler.AbstractServerHandler;
import com.funsoft.hmm.netty.listener.MessageListener;

import org.springframework.beans.factory.annotation.Autowired;

public class CdmaServerHandler extends AbstractServerHandler<CdmaIncomingMessage, CdmaOutgoingMessage> {

	public CdmaServerHandler() {
		setAckWaitTimeout(1500);
		setMaxRetryCount(1);
	}
	
	@Autowired
	@Cdma
	@Override
	public void setListener(MessageListener<CdmaIncomingMessage> listener) {
		super.listener = listener;
	}
	
	/**
	 * 1. 게이트웨이로 부터 연결 요청 메시지를 수신하였을 경우 채널 정보를 {@link UsnMessageSenderGroup} 에 등록한다.
	 * 2. 장치 상태 보고 메시지 수신시, 게이트웨이 주소를 등록한다.
	 */
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, CdmaIncomingMessage packet) throws Exception {
		if (packet instanceof Ack) {
		}
		super.channelRead0(ctx, packet);
	}

	/**
	 * IncomingPacket 이면서 suffix가 Ack 인 클래스의 경우
	 * sendSyncMessage() 에서 보낸 메시지의 Ack로 인식할 수 있도록 함
	 * 
	 * 예) EnemyHitResult -> EnemyHitResultAck
	 * 
	 * @param packet
	 * @return
	 */
	@Override
	protected boolean isAckMessage(CdmaIncomingMessage in)  {
		return in.getMessageType() == CdmaMessageType.ACK;
	}

	@Override
	protected boolean checkAckMessage(CdmaOutgoingMessage out, CdmaIncomingMessage in) {
		return outKey(out) == inKey(in);
	}

	@Override
	protected Integer syncQueueKeyByAckMessage(CdmaIncomingMessage in) {
		return inKey(in);
	}

	private Integer inKey(CdmaIncomingMessage in) {
		CdmaMessageHeader inHeader = (CdmaMessageHeader) in.getHeader();
		return inHeader.getSeq();
	}

	@Override
	protected Integer makeSyncQueueKey(CdmaOutgoingMessage out) {
		return outKey(out);
	}

	private Integer outKey(CdmaOutgoingMessage out) {
		CdmaMessageHeader outHeader = (CdmaMessageHeader) out.getHeader();
		return outHeader.getSeq();
	}
	
}
