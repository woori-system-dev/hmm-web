package com.funsoft.hmm.netty.group;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.funsoft.hmm.netty.listener.MessageSender;

public class DefaultMessageSenderGroup<T> implements MessageSenderGroup<T> {
	
    private final Logger logger = LoggerFactory.getLogger(getClass());
    
    protected ConcurrentMap<String, MessageSender<T>> allMessageSenders = new ConcurrentHashMap<String, MessageSender<T>>();
    
	@Override
	public void addMessageSender(String key, MessageSender<T> messageSender) {
		if (key == null) {
			return;
		}
		allMessageSenders.put(key, messageSender);
        logger.info("addChannel {}", allMessageSenders);
	}

	@Override
	public void removeMesssageSender(String key) {
		if (key == null) {
			return;
		}
		allMessageSenders.remove(key);
        logger.info("removeChannel {}", allMessageSenders);
	}

	@Override
	public void removeAllMessageSenders() {
		allMessageSenders.values().forEach(MessageSender::forceClose);
		allMessageSenders.clear();
	}

	@Override
	public int getMessageSenderSize() {
		return allMessageSenders.size();
	}

	@Override
	public void write(String key, T msg) {
		MessageSender<T> messageSender = allMessageSenders.get(key);
        if (messageSender != null) {
            logger.debug("{} Send Message : {}", key, msg);
            messageSender.sendSyncMessage(msg);
        }
	}

	@Override
	public void writeAsync(String key, T msg) {
		MessageSender<T> messageSender = allMessageSenders.get(key);
        if (messageSender != null) {
            logger.debug("{} Send Message : {}", key, msg);
            messageSender.sendAsyncMessage(msg);
        } else {
        	logger.warn("Not Exist ID : {}", key);
        }
	}
	
	@Override
	public void writeToAll(T msg) {
		allMessageSenders.entrySet().forEach(entry -> {
			logger.debug("{} Send Message : {}", entry.getKey(), entry.getValue());
			entry.getValue().sendSyncMessage(msg);
		});
	}

}
