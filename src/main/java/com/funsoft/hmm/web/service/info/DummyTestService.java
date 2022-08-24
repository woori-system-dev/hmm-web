package com.funsoft.hmm.web.service.info;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.common.DateUtil;
import com.funsoft.hmm.web.domain.AlarmHistoryTable;
import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.db.Holiday;
import com.funsoft.hmm.web.domain.db.NightMinFlow;
import com.funsoft.hmm.web.domain.db.QRealTimeMeasurement;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.HolidayService;
import com.funsoft.hmm.web.service.NightMinFlowService;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.querydsl.core.types.ConstantImpl;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.jpa.impl.JPAQueryFactory;

@Service
public class DummyTestService {
	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
	private RealTimeMeasurementService realTimeMeasurementService;
	
	@Autowired
	private NightMinFlowService hightMinFlowService;
	
	@Autowired
	private HolidayService holidayService;
	
	@Autowired
	private BlockSmallService blockSmallService;
	
//	@PostConstruct
	public void start() {
		JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
		
		QRealTimeMeasurement qRealTimeMeasurement = QRealTimeMeasurement.realTimeMeasurement;
		
		StringTemplate datePath = Expressions.stringTemplate("to_char({0},'{1s}')", qRealTimeMeasurement.datetime, ConstantImpl.create("yyyy-MM-dd"));
		
		List<RealTimeAnalysis> measurements = queryFactory
				.select(Projections.bean(RealTimeAnalysis.class, qRealTimeMeasurement.flow.round().as("flow"), 
						qRealTimeMeasurement.flow.count().as("count")))
				.distinct()
				.from(qRealTimeMeasurement)
				.where(qRealTimeMeasurement.bkFlctcFm.eq((long) 101006000).and(datePath.between("2014-05-08", "2014-05-15")))
				.groupBy(qRealTimeMeasurement.flow.round())
				.fetch().stream().sorted(Comparator.comparing(RealTimeAnalysis::getFlow)).collect(Collectors.toList());
		
		System.err.println(measurements.size());
	}
	
//	@PostConstruct
	public void insert() {
		blockSmallService.getList().stream().parallel().forEach(data -> {
			List<RealTimeMeasurement> measurements = realTimeMeasurementService.findByBkFlctcFmAndDate(data.getFlctcFm(), "2014-05-10");
			for (RealTimeMeasurement domain : measurements) {
				Holiday holiday = holidayService.get(DateUtil.toSmallDateString(domain.getDatetime()));
				domain.setHoliday(holiday.isHoliday());
				realTimeMeasurementService.update(domain);
			}
			
			List<NightMinFlow> flows = hightMinFlowService.findByBkFlctcFmAndDate(data.getFlctcFm(), "2014-06-08");
			for (NightMinFlow domain : flows) {
				Holiday holiday = holidayService.get(DateUtil.toSmallDateString(domain.getDatetime()));
				domain.setHoliday(holiday.isHoliday());
				hightMinFlowService.update(domain);
			}
		});
	}
	
	public List<AlarmHistoryTable> createAlarmHistoryInfoList() {
		List<AlarmHistoryTable> result = new ArrayList<>();
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:13", "2018년 4월 26일 15:14", "고수압", "주의", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:12", "2018년 4월 26일 15:13", "고수압", "경고", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:11", "2018년 4월 26일 15:12", "고수압", "주의", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:10", "2018년 4월 26일 15:11", "고수압", "경고", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:09", "2018년 4월 26일 15:10", "고수압", "주의", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:08", "2018년 4월 26일 15:09", "고수압", "경고", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:07", "2018년 4월 26일 15:08", "고수압", "주의", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:06", "2018년 4월 26일 15:07", "고수압", "경고", "1분"));
		result.add(new AlarmHistoryTable("2018년 4월 26일 15:05", "2018년 4월 26일 15:06", "고수압", "주의", "1분"));
		return result;
	}
}
