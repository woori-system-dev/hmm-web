package com.funsoft.hmm.netty.cdma.handler;

import io.netty.buffer.ByteBuf;

import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageHeader;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageType;
import com.funsoft.hmm.netty.common.handler.AbstractServerDecoder;
import com.funsoft.hmm.netty.common.msg.IncomingMessage;
import com.funsoft.hmm.netty.common.msg.MessageHeader;

public class CdmaServerDecoder extends AbstractServerDecoder {

	@Override
	public int requireHeaderSize() {
		return CdmaMessageHeader.MESSAGE_DATE_LENGTH;
	}
	
	@Override
	public MessageHeader<?> makeMessageHeader(ByteBuf buffer) {
		int stx = buffer.readUnsignedByte(); //패킷의 시작
		int soh = buffer.readUnsignedByte(); //프로토콜 버전 
		if (stx != CdmaMessageHeader.STX && soh != CdmaMessageHeader.SOH) {
			throw new UnsupportedOperationException("Invalid STX, SOH");
		}
//		deviceId += Character.toString((char) buffer.readUnsignedByte());

		String deviceId = Character.toString((char) buffer.readUnsignedByte()); //device ID high
		deviceId += Character.toString((char) buffer.readUnsignedByte()); //device ID low
		deviceId += Character.toString((char) buffer.readUnsignedByte()); //device ID low
		deviceId += Character.toString((char) buffer.readUnsignedByte()); //device ID low
		
		System.err.println("DEVICE ID : "+deviceId);
		
		CdmaMessageHeader header = new CdmaMessageHeader(CdmaMessageType.FLOW_REPORT);
		header.setDeviceId(Integer.parseInt(deviceId));
		header.setPayloadLength(CdmaMessageHeader.MESSAGE_DATE_LENGTH);
		
		return header;
	}

	@Override
	public void discardBufferByFailHeader(ByteBuf buffer) {
		buffer.readBytes(buffer.readableBytes());
	}

	@Override
	public void discardBufferByFailBody(ByteBuf buffer, MessageHeader<?> header) {
		buffer.readBytes(header.getRequiredBodySize());
	}

	@Override
	public boolean processChecksum(ByteBuf buffer, IncomingMessage<?> incomingMessage) {
		return true;
	}
	
}
