package com.funsoft.hmm.netty.cdma.msg.common;

import com.funsoft.hmm.netty.cdma.msg.FlowReport;
import com.funsoft.hmm.netty.common.msg.IMessageType;
import com.funsoft.hmm.netty.exception.NotSupprtedMessageIdException;

import lombok.Getter;

@Getter
public enum CdmaMessageType implements IMessageType {
	ACK(0X01, 1),
	FLOW_REPORT(0X05, FlowReport.class);
	
	@Getter private Class<? extends CdmaIncomingMessage> incomingClass;
	@Getter	private int id;
	@Getter	private int requireBodySize;
	private String desc;

	private CdmaMessageType(int id, int size) {
		this(id, size, null);
	}
	
	private CdmaMessageType(int id, Class<? extends CdmaIncomingMessage> incomingClass) {
		this(id, 0, incomingClass);
	}
	
	private CdmaMessageType(int id, int size, Class<? extends CdmaIncomingMessage> incomingClass) {
		this.id = id;
		this.requireBodySize = size;
		this.incomingClass = incomingClass;
		
		desc = name() + String.format("{ id:%02X, size:%d, class:%s }", id, size, (incomingClass == null ? null : incomingClass.getSimpleName()));
	}
	
	@Override
	public String toString() {
		return desc;
	}

	public static CdmaMessageType valueOf(int id) throws NotSupprtedMessageIdException {
		for (CdmaMessageType msg : CdmaMessageType.values()) {
			if (msg.id == id && msg.incomingClass != null) {
				return msg;
			}
		}
		throw new NotSupprtedMessageIdException(id);
	}
	
}
