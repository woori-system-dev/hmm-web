package com.funsoft.hmm.netty.cdma.msg;

import com.funsoft.hmm.netty.cdma.msg.common.AbstractCdmaMessage;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaIncomingMessage;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageHeader;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaOutgoingMessage;

import io.netty.buffer.ByteBuf;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString(callSuper = true)
public class Ack extends AbstractCdmaMessage implements CdmaOutgoingMessage, CdmaIncomingMessage {

	private int result;
	
	public Ack(CdmaMessageHeader header) {
		super(header);
	}

	public Ack(CdmaMessageHeader header, int result) {
		super(header);
		this.result = result;
	}

	@Override
	public void decode(ByteBuf buffer) {
		result = buffer.readUnsignedByte();
	}

	@Override
	public void encode(ByteBuf buffer) {
		buffer.writeByte(result);
	}
}
