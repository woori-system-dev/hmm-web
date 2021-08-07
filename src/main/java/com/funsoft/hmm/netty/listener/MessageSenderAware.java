package com.funsoft.hmm.netty.listener;

public interface MessageSenderAware<T> {
	
	void setMessageSender(MessageSender<T> messageSender);
	
}
