package com.funsoft.hmm.web.service.info;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.netty.annotation.Cdma;
import com.funsoft.hmm.netty.cdma.msg.FlowReport;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaIncomingMessage;
import com.funsoft.hmm.netty.listener.MessageListener;
import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.Holiday;
import com.funsoft.hmm.web.domain.db.NightMinFlow;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.service.AlarmThresholdService;
import com.funsoft.hmm.web.service.HolidayService;
import com.funsoft.hmm.web.service.NightMinFlowService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;

/**
 * This class parse messages received by cdma network.
 * 
 * @Usn for MessageListener
 * 
 * @author jhlee
 *
 */
@Transactional
@Service
@Cdma
public class CdmaMessageProcessor implements MessageListener<CdmaIncomingMessage> {

	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;

	@Autowired
	private HolidayService holidayService;

	@Autowired
	private NightMinFlowService nightMinFlowService;

	@Autowired
	private AlarmThresholdService alarmThresholdService;

	@Override
	public void connectionStateChanged(boolean isConnected) {
	}

	@Override
	public void messageReceived(CdmaIncomingMessage in) {
		switch (in.getMessageType()) {
		case FLOW_REPORT:
			processDeviceReport(in);
			break;

		default:
			break;
		}
	}

	private void processDeviceReport(CdmaIncomingMessage in) {
		
		FlowReport report = (FlowReport) in;

		RealTimeMeasurement measurement = report.getMeasurement();
		
		/*
		 * TODO
		 * 1. 수압 알람을 위해 직전 값을 가져온다.
		 * 2. 쓰레드로 등록 해야될것 같음
		 * 3. 사용자가 수압의 격차 범위를 설정할 수 있도록 해야 함
		 * 4. 웹소켓에 연결된 클라이언트에게 알람 내용을 전송해야 함
		 */
		RealTimeMeasurement oldRtm= realTimeMeasurementService.getRecentData(measurement.getBkFlctcFm());
				
		
		Holiday holiday = holidayService.get(DateUtil.toSmallDateString(measurement.getDatetime()));
		measurement.setHoliday(holiday.isHoliday());
		realTimeMeasurementService.regist(measurement);

		int hour = Integer.parseInt(DateUtil.toHourString(measurement.getDatetime()));
		if (hour >= 22 && hour <= 5) {
			NightMinFlow nightMinFlow = new NightMinFlow(measurement);
			nightMinFlow.setHoliday(holiday.isHoliday());
			nightMinFlow.setAllowFlow(alarmThresholdService.get(measurement.getBkFlctcFm()).getAllowFlow());
			nightMinFlowService.regist(nightMinFlow);
		}
		
		//쓰레드로 등록하여 웹접속자가 알람을 받을 수 있어야 한다.
		//50을 사용자가 설정한 값으로 변경해야함, 적용될려면 DB에 저장된 내용을 항상 가져와야 함
		if(Math.abs(oldRtm.getPressure() - measurement.getPressure()) > 50) {
			
			
		}
	}
	
	


}
