package com.funsoft.hmm.netty.common.msg;

import io.netty.buffer.ByteBuf;


public interface MessageHeader<T extends IMessageType> {

	T getMessageType();

	int getRequiredBodySize();
	
	void encode(ByteBuf buffer);
	
	int checksum();
	
}