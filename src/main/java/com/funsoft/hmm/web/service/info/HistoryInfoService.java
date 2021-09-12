package com.funsoft.hmm.web.service.info;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.AlarmHistory;
import com.funsoft.hmm.web.domain.AlarmHistoryDetail;
import com.funsoft.hmm.web.domain.AlarmHistoryTable;
import com.funsoft.hmm.web.domain.BlockInfo;
import com.funsoft.hmm.web.domain.MeasuringHistory;
import com.funsoft.hmm.web.domain.MeasuringHistoryDetail;
import com.funsoft.hmm.web.domain.RealTimeMonitoring;
import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.AlarmLeakage;
import com.funsoft.hmm.web.domain.db.AlarmPressure;
import com.funsoft.hmm.web.domain.db.AlarmPressure.AlarmPreesureType;
import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.domain.param.AlarmSearchParam;
import com.funsoft.hmm.web.domain.param.MeasurementSearchParam;
import com.funsoft.hmm.web.service.AlarmDeviceService;
import com.funsoft.hmm.web.service.AlarmLeakageService;
import com.funsoft.hmm.web.service.AlarmPressureService;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.FlowDeviceService;
import com.funsoft.hmm.web.service.PressureDeviceService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.funsoft.hmm.web.service.chart.AmChartService;
import com.funsoft.hmm.web.service.chart.HighChartService;

/**
 * 계측 및 알람 이력 구현 서비스 클래스
 * 
 * @author hgko
 *
 */
@Service
public class HistoryInfoService {
	
	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;
	
	@Autowired
	private BlockSmallService blockSmallService;
	
	@Autowired
	private HighChartService highChartService;
	
	@Autowired
	private AmChartService amChartService;
	
	@Autowired
	private FlowDeviceService flowDeviceService;
	
	@Autowired
	private PressureDeviceService pressureDeviceService;
	
	@Autowired
	private AlarmPressureService alarmPressureService;
	
	@Autowired
	private AlarmDeviceService alarmDeviceService;
	
	@Autowired
	private AlarmLeakageService alarmLeakageService;

	/**
	 * 계측 이력 정보 불러오기
	 * @param dateTime
	 * @return
	 */
	public List<MeasuringHistory> createMeasuringHistory(String dateTime) {
		List<MeasuringHistory> histories = new ArrayList<>();

		for (BlockSmall blockInfo : blockSmallService.getList()) {
			RealTimeMeasurement measurement = realTimeMeasurementService.getRecentData(blockInfo.getFlctcFm(), dateTime);
			if (measurement != null)
				histories.add(new MeasuringHistory(blockInfo.getBkNm(), measurement));
		}

		return histories;
	}
	
	/**
	 * 계측 이력 선택되었을 때 블록 정보 가져오기
	 * @param history
	 * @return
	 */
	public BlockInfo getBlockInfo(MeasuringHistory history) {
		BlockInfo blockInfo = new BlockInfo();
		BlockSmall blockSmall = blockSmallService.get(history.getBlockId());
		blockInfo.setFlctcFm(blockSmall.getFlctcFm());
		blockInfo.setBkNm(blockSmall.getBkNm());
		blockInfo.setFmtIdn(blockSmall.getFmtIdn());
		blockInfo.setPmtIdn(blockSmall.getPmtIdn());
		
		blockInfo.setFlowDate(DateUtil.toString(flowDeviceService.get((long)blockInfo.getFmtIdn()).getIstYmd()));
		blockInfo.setPressureDate(DateUtil.toString(pressureDeviceService.get((long)blockInfo.getPmtIdn()).getIstYmd()));
		
		return blockInfo;
	}
	
	/**
	 * 계측 이력 상세 정보 가져오기
	 * @param param
	 * @return
	 */
	public MeasuringHistoryDetail createMeasuringHistoryDetail(MeasurementSearchParam param) {
		
		MeasuringHistoryDetail detail = new MeasuringHistoryDetail();
		BlockSmall blockSmall = blockSmallService.get(param.getBlockId());
		detail.setBlockInfo(new BlockInfo(blockSmall.getBkNm()));
		detail.setRealTimeMonitoring(new RealTimeMonitoring(detail.getBlockInfo().getBkNm(), 
				realTimeMeasurementService.getRecentData(param.getBlockId())));
		
		List<MeasuringHistory> results = getMeasuringHistoryList(param);
		if (results.size() > 0) {
			double minSumFlow = results.stream().mapToDouble(data -> data.getSumFlow()).min().getAsDouble();
			double maxSumFlow = results.stream().mapToDouble(data -> data.getSumFlow()).max().getAsDouble();
			detail.setSumFlow((float) (maxSumFlow - minSumFlow));
			
			detail.setMinPressure((float) results.stream().mapToDouble(data -> data.getPressure()).min().getAsDouble());
			detail.setMaxPressure((float) results.stream().mapToDouble(data -> data.getPressure()).max().getAsDouble());
			detail.setAvgPressure(round(results.stream().mapToDouble(data -> data.getPressure()).average().getAsDouble()));
			
			detail.setMinFlow((float) results.stream().mapToDouble(data -> data.getFlow()).min().getAsDouble());
			detail.setMaxFlow((float) results.stream().mapToDouble(data -> data.getFlow()).max().getAsDouble());
			detail.setAvgFlow(round(results.stream().mapToDouble(data -> data.getFlow()).average().getAsDouble()));
		}
		
		detail.setAmChartInfo(amChartService.createMeasurementChart(results));
		detail.setHighChartInfo(highChartService.createMeasurementChartInfo(results));
		
		return detail;
	}
	
	/**
	 * 계측 이력 검색 조건 결과
	 * @param param
	 * @return
	 */
	public List<MeasuringHistory> getMeasuringHistoryList(MeasurementSearchParam param) {
		List<RealTimeMeasurement> results;
		if (param.getEndDate() == null) {
			results = realTimeMeasurementService.getList(param.getBlockId(), param.getStartDate());
		} else {
			results = realTimeMeasurementService.getList(param.getBlockId(), param.getStartDate(), param.getEndDate());
		}
		
		return results.stream().map(data -> {return new MeasuringHistory(data);}).collect(Collectors.toList());
	}
	
	/**
	 * 알람 이력 정보 불러오기
	 * @param date
	 * @return
	 */
	public List<AlarmHistory> createAlarmHistory(String date) {
		List<AlarmHistory> histories = new ArrayList<>();
		
		for (BlockSmall blockSmall : blockSmallService.getList()) {
			List<AlarmPressure> alarmPressures = alarmPressureService.getList(blockSmall.getFlctcFm(), date);
			long highPressure = alarmPressures.stream()
					.filter(data -> data.getPrsAbnm() == AlarmPreesureType.고수압경보 || data.getPrsAbnm() == AlarmPreesureType.고수압주의).count();
			long lowPressure = alarmPressures.stream()
					.filter(data -> data.getPrsAbnm() == AlarmPreesureType.저수압경보 || data.getPrsAbnm() == AlarmPreesureType.저수압주의).count();
			
			List<AlarmDevice> alarmDevices = alarmDeviceService.getList(blockSmall.getFlctcFm(), date);
			long doorOpen = alarmDevices.stream().filter(data -> data.isOpnDr()).count();
			long deviceError = alarmDevices.stream().filter(data -> data.isDeviceErr()).count();
			
			AlarmHistory alarmHistory = new AlarmHistory(blockSmall, highPressure, lowPressure, doorOpen, deviceError);
			histories.add(alarmHistory);
		}
		
		return histories;
	}
	
	/**
	 * 알람 이력 선택되었을 때 블록 정보 가져오기
	 * @param history
	 * @return
	 */
	public BlockInfo getBlockInfo(AlarmHistory history) {
		BlockInfo blockInfo = new BlockInfo();
		BlockSmall blockSmall = blockSmallService.get(history.getBlockId());
		blockInfo.setFlctcFm(blockSmall.getFlctcFm());
		blockInfo.setBkNm(blockSmall.getBkNm());
		
		return blockInfo;
	}
	
	/**
	 * 블록별 알람 이력 조회
	 * 
	 * @param param
	 * @return
	 */
	public List<AlarmHistoryTable> getAlarmHistoryList(AlarmSearchParam param) {
		
		String startDate = param.getStartDate();
		String endDate = param.getEndDate();
		
		List<AlarmHistoryTable> results = new ArrayList<>();

		if (param.getEndDate() == null) {
			
		} else {
			
		}
		
		List<AlarmPressure> alarmPressures = alarmPressureService.getList(param.getBlockId(), startDate, endDate);
		Map<Long, List<AlarmPressure>> alarmPressureMap = alarmPressures.stream().collect(Collectors.groupingBy(AlarmPressure::getBkFlctcFm));
		
		List<AlarmDevice> alarmDevices = alarmDeviceService.getList(param.getBlockId(), startDate, endDate);
		Map<Long, List<AlarmDevice>> alarmDeviceMap = alarmDevices.stream().collect(Collectors.groupingBy(AlarmDevice::getBkFlctcFm));
		
		List<AlarmLeakage> alarmLeakages = alarmLeakageService.getList(param.getBlockId(), startDate, endDate);
		Map<Long, List<AlarmLeakage>> alarmLeakageMap = alarmLeakages.stream().collect(Collectors.groupingBy(AlarmLeakage::getBkFlctcFm));

//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:13", "2018년 4월 26일 15:14", "고수압", "주의", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:12", "2018년 4월 26일 15:13", "고수압", "경고", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:11", "2018년 4월 26일 15:12", "고수압", "주의", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:10", "2018년 4월 26일 15:11", "고수압", "경고", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:09", "2018년 4월 26일 15:10", "고수압", "주의", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:08", "2018년 4월 26일 15:09", "고수압", "경고", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:07", "2018년 4월 26일 15:08", "고수압", "주의", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:06", "2018년 4월 26일 15:07", "고수압", "경고", "1분"));
//		results.add(new AlarmHistoryTable("2018년 4월 26일 15:05", "2018년 4월 26일 15:06", "고수압", "주의", "1분"));
		return results;
	}
	
	/**
	 * 알람 이력 상세 정보
	 * 
	 * @param param
	 * @return
	 */
	public AlarmHistoryDetail createAlarmHistoryDetail(AlarmSearchParam param) {
		AlarmHistoryDetail detail = new AlarmHistoryDetail();
		
		BlockSmall blockSmall = blockSmallService.get(param.getBlockId());
		detail.setBlockInfo(new BlockInfo(blockSmall.getBkNm()));
		detail.setRealTimeMonitoring(new RealTimeMonitoring(detail.getBlockInfo().getBkNm(), 
				realTimeMeasurementService.getRecentData(param.getBlockId())));
		
		if (param.isPressure()) {
			detail.setHighPressureWarning(19);
			detail.setHighPressureCaution(35);
			detail.setLowPressureWarning(0);
			detail.setLowPressureCaution(0);
		}
		
		if (param.isOpenDoor()) {
			detail.setOpenDoor(0);
		}
		
		if (param.isDeviceError()) {
			detail.setDeviceError(0);
		}
		
		detail.setAlarmType("고수압(경고)");
		detail.setDurationTime(395);
		detail.setTotal(54);
		
		return detail;
	}
	
	/**
	 * 소수점 둘째자리 반올림
	 * @param value
	 * @return
	 */
	private float round(double value) {
		return Math.round(value * 100f) / 100f;
	}
}
