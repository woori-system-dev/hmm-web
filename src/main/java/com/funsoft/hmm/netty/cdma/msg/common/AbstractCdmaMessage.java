package com.funsoft.hmm.netty.cdma.msg.common;

import com.funsoft.hmm.netty.common.msg.AbstractMessage;

public abstract class AbstractCdmaMessage extends AbstractMessage<CdmaMessageHeader, CdmaMessageType> {

	public AbstractCdmaMessage(CdmaMessageHeader header) {
		super(header);
	}

	public String getMacId() {
		return String.format("%04X", getHeader().getDeviceId());
	}

	@Override
	protected int bodyDataSum() {
		return 0;
	}
	
	/**
	 * UsnOutgoingMessage 에서 메시지의 크기는 MessageType에 정의 되며, 
	 * 가변적인 경우 해당 메시지에서 오버라이딩 한다.
	 */
	public int getRequireBodySize() {
		return getHeader().getMessageType().getRequireBodySize();
	}
}
