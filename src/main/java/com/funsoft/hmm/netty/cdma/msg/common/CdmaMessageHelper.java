package com.funsoft.hmm.netty.cdma.msg.common;

/**
 * 송신 메시지를 만들어 주는 헬퍼 클래스
 * 
 * @author taeyo
 *
 */
public class CdmaMessageHelper {

	public static CdmaMessageHeader makeHeader(CdmaMessageType type, String macId) {
		int deviceId = Integer.parseInt(macId, 16);
		
		CdmaMessageHeader header = new CdmaMessageHeader(type);
		header.setDeviceId(deviceId);
		return header;
	}
	
}
