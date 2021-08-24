package com.funsoft.hmm.web.service.impl;

import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.RealTimeAnalysis;
import com.funsoft.hmm.web.domain.db.CompositePK;
import com.funsoft.hmm.web.domain.db.QRealTimeMeasurement;
import com.funsoft.hmm.web.domain.db.RealTimeMeasurement;
import com.funsoft.hmm.web.repository.RealTimeMeasurementRepository;
import com.funsoft.hmm.web.service.RealTimeMeasurementService;
import com.querydsl.core.types.ConstantImpl;
import com.querydsl.core.types.Projections;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.jpa.impl.JPAQueryFactory;

/**
 * 실시간 측정 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class RealTimeMeasurementServiceImpl implements RealTimeMeasurementService {
	
	@Autowired
	private RealTimeMeasurementRepository realTimeMeasurementRepository;
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public RealTimeMeasurement get(CompositePK id) {
		return realTimeMeasurementRepository.findById(id).get();
	}
	
	@Override
	public List<RealTimeMeasurement> getList() {
		return realTimeMeasurementRepository.findAll();
	}

	@Override
	public boolean regist(RealTimeMeasurement domain) {
		if (isNew(domain)) {
			return realTimeMeasurementRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(RealTimeMeasurement domain) {
		if (!isNew(domain)) {
			return realTimeMeasurementRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(RealTimeMeasurement domain) {
		realTimeMeasurementRepository.delete(domain);
		return true;
	}

	private boolean isNew(RealTimeMeasurement domain) {
		return !realTimeMeasurementRepository.existsById(new CompositePK(domain.getDatetime(), domain.getBkFlctcFm()));
	}

	@Transactional(readOnly = true)
	@Override
	public RealTimeMeasurement getRecentData(long blockId) {
		return realTimeMeasurementRepository.getRecentData(blockId);
	}

	@Transactional(readOnly = true)
	@Override
	public RealTimeMeasurement getRecentData(long blockId, String dateTime) {
		return realTimeMeasurementRepository.getRecentData(blockId, dateTime);
	}

	@Transactional(readOnly = true)
	@Override
	public List<RealTimeMeasurement> getList(long blockId, String dateTime) {
		return realTimeMeasurementRepository.findByBkFlctcFmAndDateAndRownum(blockId, dateTime, 10);
	}

	@Transactional(readOnly = true)
	@Override
	public List<RealTimeMeasurement> getList(long blockId, String startDate, String endDate) {
		return realTimeMeasurementRepository.findByBkFlctcFmAndBetween(blockId, startDate, endDate);
	}

	@Transactional(readOnly = true)
	@Override
	public RealTimeMeasurement get(long blockId, Date date) {
		return realTimeMeasurementRepository.findByBkFlctcFmAndDatetime(blockId, date);
	}

	@Transactional(readOnly = true)
	@Override
	public List<RealTimeMeasurement> findByBkFlctcFmAndDate(long blockId, String date) {
		return realTimeMeasurementRepository.findByBkFlctcFmAndDate(blockId, date);
	}

	@Transactional(readOnly = true)
	@Override
	public List<RealTimeAnalysis> findByGroupBy(long blockId, String startDate, String endDate) {
		JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
		QRealTimeMeasurement qRealTimeMeasurement = QRealTimeMeasurement.realTimeMeasurement;
		
		List<RealTimeAnalysis> measurements = queryFactory
				.select(Projections.bean(RealTimeAnalysis.class, qRealTimeMeasurement.flow.round().as("flow"), 
						qRealTimeMeasurement.flow.count().as("count"))).distinct()
				.from(qRealTimeMeasurement)
				.where(qRealTimeMeasurement.bkFlctcFm.eq(blockId).and(dateTemplate("yyyy-MM-dd").between(startDate, endDate)))
				.groupBy(qRealTimeMeasurement.flow.round())
				.fetch().stream().sorted(Comparator.comparing(RealTimeAnalysis::getFlow)).collect(Collectors.toList());
		return measurements;
	}
	
	private StringTemplate dateTemplate(String path) {
		QRealTimeMeasurement qRealTimeMeasurement = QRealTimeMeasurement.realTimeMeasurement;
		return Expressions.stringTemplate("to_char({0},'{1s}')", qRealTimeMeasurement.datetime, ConstantImpl.create(path));
	}

}
