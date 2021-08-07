package com.funsoft.hmm.netty.common.msg;

import io.netty.buffer.ByteBuf;

public interface OutgoingMessage<T extends IMessageType> {

	void encode(ByteBuf buffer);

	int checksum();
	
	T getMessageType();
	
	MessageHeader<?> getHeader();

}
