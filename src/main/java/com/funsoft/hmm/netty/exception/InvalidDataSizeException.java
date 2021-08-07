package com.funsoft.hmm.netty.exception;

import com.funsoft.hmm.netty.common.msg.IMessageType;

public class InvalidDataSizeException extends RuntimeException {

	public InvalidDataSizeException(IMessageType msg, int size) {
		super("Size of " + msg + " is " + msg.getRequireBodySize());
	}
}
