package com.funsoft.hmm.netty.common.handler;

import java.nio.ByteOrder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.funsoft.hmm.netty.common.msg.OutgoingMessage;
import com.funsoft.hmm.web.common.PrintUtil;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

public abstract class AbstractServerEncoder extends MessageToByteEncoder<OutgoingMessage<?>> {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	protected void encode(ChannelHandlerContext ctx, OutgoingMessage<?> msg, ByteBuf out) throws Exception {
		logger.info("[Outgoing] {} => {}", ctx.channel(), msg);
		encode(msg, out.order(ByteOrder.LITTLE_ENDIAN));

		logger.debug("{} {}", ctx.channel(), PrintUtil.printReceivedChannelBuffer("out", out));
	}

	/**
	 * 1. 데이터 전송에 필요한 ChannelBuffer를 생성한다. 2. 생성한 buffer에 데이터를 담고, 반환한다.
	 * 
	 * @param message
	 * @param out
	 * @return
	 */
	public abstract void encode(OutgoingMessage<?> message, ByteBuf out);

}
