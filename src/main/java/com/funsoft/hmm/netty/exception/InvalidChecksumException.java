package com.funsoft.hmm.netty.exception;

public class InvalidChecksumException extends RuntimeException {

	public InvalidChecksumException(int checksum) {
		super("checksum : " + checksum);
	}
}
