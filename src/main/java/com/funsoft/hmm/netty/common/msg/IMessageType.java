package com.funsoft.hmm.netty.common.msg;

public interface IMessageType {
	
	int getId();

	int getRequireBodySize();
	
	Class<? extends IncomingMessage<?>> getIncomingClass();

}
