package com.funsoft.hmm.web.service.info;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.SummaryInfo;
import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.AlarmPressure;
import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.service.AlarmDeviceService;
import com.funsoft.hmm.web.service.AlarmLeakageService;
import com.funsoft.hmm.web.service.AlarmPressureService;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;

/**
 * 종합 요약 정보 서비스
 * 
 * @author hgko
 *
 */
@Service
public class SummaryInfoService {
	
	@Autowired
	private BlockSmallService blockSmallService;

	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;
	
	@Autowired
	private AlarmPressureService alarmPressureService;
	
	@Autowired
	private AlarmDeviceService alarmDeviceService;
	
	@Autowired
	private AlarmLeakageService alarmLeakageService;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	public SummaryInfo getSummaryInfo() {
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.HOUR, -1);
		
		String startDate = dateFormat.format(new Date()) + " 00:00:00";
		String hour1PreDate = dateTimeFormat.format(calendar.getTime());
		String endDate = dateTimeFormat.format(new Date());
		startDate = "2018-06-07 00:00:00";
		endDate = "2018-06-07 15:00:00";
		hour1PreDate = "2018-06-07 14:00:00";
		
		List<BlockSmall> blockSmalls = blockSmallService.getList();
		
		SummaryInfo summaryInfo = new SummaryInfo();
		summaryInfo.setSmallBlockNum(blockSmalls.size());
		summaryInfo.setManageBlockNum(2);
		summaryInfo.setBkWspPopCo(blockSmalls.stream().mapToInt(data -> data.getBkWspPopCo()).sum());
		summaryInfo.setBkPipeEx(blockSmalls.stream().mapToInt(data -> Integer.parseInt(data.getBkPipeEx() == null ? "0" : data.getBkPipeEx())).sum());
		
		List<RealTimeMeasurement> todayDatas = realTimeMeasurementService.getList(startDate, endDate);
		List<RealTimeMeasurement> hourDatas = realTimeMeasurementService.getList(hour1PreDate, endDate);
		
		NumberFormat numberFormat = NumberFormat.getInstance();
		summaryInfo.setTodaySumFlow(numberFormat.format(todayDatas.stream().mapToDouble(data -> data.getSumFlow()).sum()));
		summaryInfo.setHourSumFlow(numberFormat.format(hourDatas.stream().mapToDouble(data -> data.getSumFlow()).sum()));
		
		return summaryInfo;
	}
	
	public SummaryInfo getAlarmInfo() {
		
		String startDate = dateFormat.format(new Date()) + " 00:00:00";
		String endDate = dateTimeFormat.format(new Date());
		startDate = "2015-03-06 00:00:00";
		endDate = "2015-03-06 23:00:00";
		
		SummaryInfo summaryInfo = new SummaryInfo(); 
		
		List<AlarmPressure> alarmPressures = alarmPressureService.getList(startDate, endDate);
		Map<Long, List<AlarmPressure>> alarmPressureMap = alarmPressures.stream().collect(Collectors.groupingBy(AlarmPressure::getBkFlctcFm));
		
		List<AlarmDevice> alarmDevices = alarmDeviceService.getList(startDate, endDate);
		Map<Long, List<AlarmDevice>> alarmDeviceMap = alarmDevices.stream().collect(Collectors.groupingBy(AlarmDevice::getBkFlctcFm));
		
		List<AlarmLeakage> alarmLeakages = alarmLeakageService.getList(startDate, endDate);
		Map<Long, List<AlarmLeakage>> alarmLeakageMap = alarmLeakages.stream().collect(Collectors.groupingBy(AlarmLeakage::getBkFlctcFm));
		
		summaryInfo.setPressureAlarm(alarmPressureMap.keySet().stream().map(data -> blockSmallService.get(data).getBkNm()).collect(Collectors.toList()));
		summaryInfo.setDeviceAlarm(alarmDeviceMap.keySet().stream().map(data -> blockSmallService.get(data).getBkNm()).collect(Collectors.toList()));
		summaryInfo.setLeakageAlarm(alarmLeakageMap.keySet().stream().map(data -> blockSmallService.get(data).getBkNm()).collect(Collectors.toList()));
		
		return summaryInfo;
	}
}
