package com.funsoft.hmm.web.common;

import io.netty.buffer.ByteBuf;

public class PrintUtil {

	public static String printReceivedChannelBuffer(String msg, ByteBuf buffer) {
		
		StringBuilder sb = new StringBuilder();
		sb.append(msg + " : ");
		
		int startIndex = buffer.readerIndex();
		
		for (int i = 0; i < buffer.readableBytes(); i++) {
			sb.append(String.format("%02X ", buffer.getUnsignedByte(startIndex + i)));
		}

		return sb.toString();
	}
}
