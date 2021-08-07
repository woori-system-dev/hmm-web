package com.funsoft.hmm.netty.cdma.handler;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;

import javax.inject.Provider;

import org.springframework.beans.factory.annotation.Autowired;

public class CdmaServerChannelInitializer extends ChannelInitializer<SocketChannel> {

	@Autowired
	Provider<CdmaServerHandler> cdmaServerHandlerProvider;

	@Override
	protected void initChannel(SocketChannel ch) throws Exception {
		ChannelPipeline pipeline = ch.pipeline();

		pipeline.addLast("encoder", new CdmaServerEncoder());
		pipeline.addLast("decoder", new CdmaServerDecoder());

		// business logic
		pipeline.addLast("hanlder", cdmaServerHandlerProvider.get());
	}

}
