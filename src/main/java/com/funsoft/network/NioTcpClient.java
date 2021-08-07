package com.funsoft.network;

import java.net.InetSocketAddress;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.serialization.ClassResolvers;
import io.netty.handler.codec.serialization.ObjectDecoder;
import io.netty.handler.codec.serialization.ObjectEncoder;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Taeyoung, Kim
 */
@Setter
@Getter
public class NioTcpClient {

	private static final int RETRY_DELAY_TIME = 10;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private String localIP;
	private int localPort;
	private String serverIP;
	private int serverPort;
	
	private ChannelInitializer<SocketChannel> channelInitializer;

	private EventLoopGroup workerGroup;
	
	private final Bootstrap bootstrap = new Bootstrap();

	private final Runnable retryConnect = () -> connect();

	private String serviceName;

	public void init() {
		if (workerGroup == null) {
			workerGroup = new NioEventLoopGroup();
		}

		bootstrap.group(workerGroup).channel(NioSocketChannel.class).option(ChannelOption.TCP_NODELAY, true)
				.option(ChannelOption.SO_KEEPALIVE, true).handler(channelInitializer);
	}

	public void connect() {
		logger.info("Attempts a new connection to {} TCP Server.", serviceName);
		ChannelFuture future = null;

		if (localPort == 0) {
			future = bootstrap.connect(new InetSocketAddress(serverIP, serverPort));
		} else {
			if (localIP == null || localIP.isEmpty()) {
				future = bootstrap.connect(new InetSocketAddress(serverIP, serverPort),
						new InetSocketAddress(localPort));
			} else {
				future = bootstrap.connect(new InetSocketAddress(serverIP, serverPort),
						new InetSocketAddress(localIP, localPort));
			}
		}
		future.addListener((ChannelFuture channelFuture) -> {
			if (channelFuture.isSuccess()) {
				logger.info("Success!!!");

				channelFuture.channel().closeFuture().addListener((ChannelFuture cf) -> {
					logger.info("Channel Close!!!");
					cf.channel().eventLoop().schedule(retryConnect, RETRY_DELAY_TIME, TimeUnit.SECONDS);
				});

			} else {
				logger.info("Failre!!! Retry to connect");
				channelFuture.channel().eventLoop().schedule(retryConnect, RETRY_DELAY_TIME, TimeUnit.SECONDS);
			}
		});
	}

	public static void main(String[] args) {
		NioTcpClient tcpClient = new NioTcpClient();
		tcpClient.setServerIP("127.0.0.1");
		tcpClient.setServerPort(9001);
		tcpClient.setChannelInitializer(new ChannelInitializer<SocketChannel>() {

			@Override
			protected void initChannel(SocketChannel ch) throws Exception {
				ch.pipeline().addLast(new ObjectEncoder(), new ObjectDecoder(ClassResolvers.softCachingResolver(null)),
						new SimpleChannelInboundHandler<String>() {

							@Override
							public void channelActive(ChannelHandlerContext ctx) throws Exception {
								ctx.channel().writeAndFlush("xxx")
										.addListener(ChannelFutureListener.FIRE_EXCEPTION_ON_FAILURE);
							}

							@Override
							public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
								cause.printStackTrace();
								ctx.close();
							}

							@Override
							protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
								System.out.println(msg);
							}
						});
			}
		});
		tcpClient.init();
	}
}
