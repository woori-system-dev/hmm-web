package com.funsoft.hmm.netty.cdma.msg;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.funsoft.hmm.netty.cdma.msg.common.AbstractCdmaMessage;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaIncomingMessage;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaMessageHeader;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;

import io.netty.buffer.ByteBuf;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString(callSuper = true)
public class FlowReport extends AbstractCdmaMessage implements CdmaIncomingMessage {

	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	
	private int flow;
	private int pressure;
	private int sumFlow;
	private int reserve;
	private int tail;
	
	private RealTimeMeasurement measurement;
	
	public FlowReport(CdmaMessageHeader header) {
		super(header);
		this.measurement = new RealTimeMeasurement();
		this.measurement.setBkFlctcCde("BK03");
		this.measurement.setBkFlctcFm(101006000);
	}
	
	/**
	 * Date, flow, pressur, Accum flow, reserved 확인
	 */
	@Override
	public void decode(ByteBuf buffer) {
		String date = "";
	
		for (int i = 0; i < 22; i++) {
			date += Character.toString(
					(char) (Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16
							+ Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())))));
		}

		System.err.println("Date : " + date);
		try {
			measurement.setDatetime(dateFormat.parse(date.substring(0, 18)));
			measurement.setInDatetime(dateFormat.parse(date.substring(0, 18)));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		flow = Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) << 8 ;
		flow += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())));
		System.err.println("Flow : " + flow);
		
		measurement.setFlow(flow);
		
		pressure = Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) << 8 ;
		pressure += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())));
		System.err.println("pressur : " + pressure);
		
		measurement.setPressure(pressure);		
		
		sumFlow = Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) << 24 ;
		sumFlow += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) << 16;
		sumFlow += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) << 8;
		sumFlow += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())));
		System.err.println("Accum Flow : " + sumFlow);
		
		measurement.setSumFlow(sumFlow);
		
		reserve = Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())));
		reserve += Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte()))) * 16 + Integer.parseInt(makeHexInteger(Character.toString((char) buffer.readUnsignedByte())));
		System.err.println("Reserved : " + reserve);
		
		String etx = Character.toString((char) buffer.readUnsignedByte()); //ETX(0x03)
		
		System.err.println("HERE TEST :");
	}
	
	public String makeHexInteger(String value) {
		String result = null;

		if (value.equals("A") || value == "A") {
			result = "10";
		} else if (value.equals("B") || value == "B") {
			result = "11";
		} else if (value.equals("C") || value == "C") {
			result = "12";
		} else if (value.equals("D") || value == "D") {
			result = "13";
		} else if (value.equals("E") || value == "E") {
			result = "14";
		} else if (value.equals("F") || value == "F") {
			result = "15";
		} else {
			result = value;
		}
		return result;
	}
}
