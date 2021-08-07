package com.funsoft.hmm.netty.group;

import com.funsoft.hmm.netty.listener.MessageSender;

/**
 * Netty를 통해서 접속된 {@link MessageSender}의 리스트를
 * 관리하고, 메시지를 전송할 때 사용한다.
 * 
 * @author tykim
 */
public interface MessageSenderGroup<T> {

    void addMessageSender(String key, MessageSender<T> messageSender);

    void removeMesssageSender(String key);
    
    void removeAllMessageSenders();

    int getMessageSenderSize();

	void write(String key, T msg);
	
	void writeAsync(String key, T msg);

    void writeToAll(T msg);
}
