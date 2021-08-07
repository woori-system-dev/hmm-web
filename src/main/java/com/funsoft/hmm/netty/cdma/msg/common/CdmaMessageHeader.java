package com.funsoft.hmm.netty.cdma.msg.common;

import io.netty.buffer.ByteBuf;
import lombok.Getter;
import lombok.Setter;
import com.funsoft.hmm.netty.common.msg.MessageHeader;

/**
 * 1. 해더에 포함되는 필드를 선언한다.
 * 2. getRequiredHeaderSize() 와 getRequiredBodySize() 를 구현한다.
 * 3. 해더의 필드에서 계산되는 checksum() 을 구현한다.
 * 
 * @author taeyo
 *
 */
@Getter
public class CdmaMessageHeader implements MessageHeader<CdmaMessageType> {
	
	public static final int STX = 0x02;
	public static final int SOH = 0x01;
	//계측시각(22) + 순시유량(2) + 압력(2) + 적산유량(4) + RESERVED(2) + TAIL(1)
	public static final int MESSAGE_DATE_LENGTH = 22 + 2 + 2 + 4 + 2 + 1;
	
	@Setter private int deviceId;
	@Setter private int seq;
	@Setter private int payloadLength;
	
	private CdmaMessageType messageType;
	
	public CdmaMessageHeader(CdmaMessageType messageType) {
		this.messageType = messageType;
	}
	
	/**
	 * Body를 생성하기 위해 필요한 사이즈
	 * for decoding
	 * 
	 * @return
	 */
	@Override
	public int getRequiredBodySize() {
		return payloadLength;
	}

	/**
	 * Header에서 checksum에 포함되는 값을 계산
	 * 
	 * @return
	 */
	@Override
	public int checksum() {
		return 0;
	}

	@Override
	public void encode(ByteBuf buffer) {
		
	}

	@Override
	public String toString() {
		return "CdmaMessageHeader [deviceMacId=" + String.format("%04X", deviceId)
				+", payloadLength="	+ payloadLength + ", messageType=" + messageType + "]";
	}

}
