package com.funsoft.hmm.web.service.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.netty.annotation.Cdma;
import com.funsoft.hmm.netty.cdma.msg.FlowReport;
import com.funsoft.hmm.netty.cdma.msg.common.CdmaIncomingMessage;
import com.funsoft.hmm.netty.listener.MessageListener;
import com.funsoft.hmm.web.common.DateUtil;
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
		Holiday holiday = holidayService.get(DateUtil.toSmallDateString(measurement.getDatetime()));
//		measurement.setHoliday(holiday.isHoliday());
		realTimeMeasurementService.regist(measurement);

		int hour = Integer.parseInt(DateUtil.toHourString(measurement.getDatetime()));
		if (hour >= 22 && hour <= 5) {
			NightMinFlow nightMinFlow = new NightMinFlow(measurement);
			nightMinFlow.setHoliday(holiday.isHoliday());
			nightMinFlow.setAllowFlow(alarmThresholdService.get(measurement.getBkFlctcFm()).getAllowFlow());
			nightMinFlowService.regist(nightMinFlow);
		}

		System.err.println("TEST REPORT : " + report.toString());
	}

}
