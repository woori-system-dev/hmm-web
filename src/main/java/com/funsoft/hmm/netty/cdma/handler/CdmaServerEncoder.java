package com.funsoft.hmm.netty.cdma.handler;

import io.netty.buffer.ByteBuf;

import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageHeader;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaOutgoingMessage;
import com.funsoft.hmm.netty.common.handler.AbstractServerEncoder;
import com.funsoft.hmm.netty.common.msg.OutgoingMessage;

//추상 서버 인코더 상속관계 
public class CdmaServerEncoder extends AbstractServerEncoder {

	@Override
	public void encode(OutgoingMessage<?> message, ByteBuf out) {
		CdmaOutgoingMessage outMessage = (CdmaOutgoingMessage) message;
		CdmaMessageHeader header = (CdmaMessageHeader) outMessage.getHeader();
		
		out.writeByte(CdmaMessageHeader.STX);
		out.writeByte(CdmaMessageHeader.SOH);
		out.writeShort(header.getDeviceId());
		out.writeByte(header.getMessageType().getId());
		out.writeByte(outMessage.getRequireBodySize()); // payloadLength
		message.encode(out);
	}

}
