package com.funsoft.hmm.netty.exception;

public class NotSupprtedMessageIdException extends RuntimeException {
	
	public NotSupprtedMessageIdException(int messageId) {
		super(messageId + " is invalid.");
	}
}
