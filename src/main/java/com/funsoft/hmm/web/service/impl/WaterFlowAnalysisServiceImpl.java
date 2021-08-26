package com.funsoft.hmm.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis.AnalysisCompositePK;
import com.funsoft.hmm.web.repository.WaterFlowAnalysisRepository;
import com.funsoft.hmm.web.service.BlockSmallService;
import com.funsoft.hmm.web.service.WaterFlowAnalysisService;

/**
 * 총괄수량수지분석 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class WaterFlowAnalysisServiceImpl implements WaterFlowAnalysisService {
	
	@Autowired
	private WaterFlowAnalysisRepository waterFlowAnalysisRepository;
	
	@Autowired
	private BlockSmallService blockSmallService;
	
	@Override
	public WaterFlowAnalysis get(AnalysisCompositePK id) {
		return waterFlowAnalysisRepository.findById(id).get();
	}

	@Override
	public List<WaterFlowAnalysis> getList() {
		return waterFlowAnalysisRepository.findAll();
	}

	@Override
	public boolean regist(WaterFlowAnalysis domain) {
		if (isNew(domain)) {
			return waterFlowAnalysisRepository.save(domain) != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean update(WaterFlowAnalysis domain) {
		if (!isNew(domain)) {
			return waterFlowAnalysisRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(WaterFlowAnalysis domain) {
		waterFlowAnalysisRepository.delete(domain);
		return true;
	}

	private boolean isNew(WaterFlowAnalysis domain) {
		return !waterFlowAnalysisRepository.existsById(new AnalysisCompositePK(domain.getFlctcFm(), domain.getAnaYm()));
	}

	@Transactional(readOnly = true)
	@Override
	public WaterFlowAnalysis search(String startDate, String endDate, List<String> checkList) {
		
		WaterFlowAnalysis waterFlowAnalysis = new WaterFlowAnalysis();
		
		startDate = changeDate(startDate);
		endDate = changeDate(endDate);
		
		List<WaterFlowAnalysis> results = new ArrayList<>();
		
		for (String bkNm : checkList) {
			BlockSmall blockSmall = blockSmallService.getBkNM(bkNm);
			waterFlowAnalysisRepository.findByStartDateAndEndDate(String.valueOf(blockSmall.getFlctcFm()), startDate, endDate).forEach(data -> {
				data.setBkNm(bkNm);
				data.setLossAmt(data.getILossAmt());
				data.setReduceAmt(data.getIReduceAmt());
				data.setMchkAmt(data.getUMchkAmt());
				data.setSudoAmt(data.getUSudoAmt());
				data.setCommAmt(data.getUCommAmt());
				data.setIllegalAmt(data.getUIllegalAmt());
				data.setChkAmt(data.getPChkAmt());
				data.setUchkAmt(data.getPUchkAmt());
				data.setLendAmt(data.getPLendAmt());
				data.setEtcAmt(data.getPEtcAmt());
				results.add(data);
			});
		}
		
		waterFlowAnalysis.setTotSpy((float)results.stream().mapToDouble(data -> data.getTotSpy()).sum());
		waterFlowAnalysis.setValidAmt((float)results.stream().mapToDouble(data -> data.getValidAmt()).sum());
		waterFlowAnalysis.setInvalidAmt((float)results.stream().mapToDouble(data -> data.getInvalidAmt()).sum());
		waterFlowAnalysis.setReduceAmt((float)results.stream().mapToDouble(data -> data.getReduceAmt()).sum());
		waterFlowAnalysis.setPaidAmt((float)results.stream().mapToDouble(data -> data.getPaidAmt()).sum());
		waterFlowAnalysis.setUnpaidAmt((float)results.stream().mapToDouble(data -> data.getUnpaidAmt()).sum());
		waterFlowAnalysis.setMchkAmt((float)results.stream().mapToDouble(data -> data.getMchkAmt()).sum());
		waterFlowAnalysis.setSudoAmt((float)results.stream().mapToDouble(data -> data.getSudoAmt()).sum());
		waterFlowAnalysis.setCommAmt((float)results.stream().mapToDouble(data -> data.getCommAmt()).sum());
		waterFlowAnalysis.setIllegalAmt((float)results.stream().mapToDouble(data -> data.getIllegalAmt()).sum());
		waterFlowAnalysis.setChkAmt((float)results.stream().mapToDouble(data -> data.getChkAmt()).sum());
		waterFlowAnalysis.setUchkAmt((float)results.stream().mapToDouble(data -> data.getUchkAmt()).sum());
		waterFlowAnalysis.setLendAmt((float)results.stream().mapToDouble(data -> data.getLendAmt()).sum());
		waterFlowAnalysis.setEtcAmt((float)results.stream().mapToDouble(data -> data.getEtcAmt()).sum());
		waterFlowAnalysis.setLossAmt((float)results.stream().mapToDouble(data -> data.getLossAmt()).sum());
		waterFlowAnalysis.setWtrFlowRate((float)results.stream().mapToDouble(data -> data.getWtrFlowRate()).average().orElse(0));
		
		waterFlowAnalysis.setWaterFlowAnalysis(results);
		
		return waterFlowAnalysis;
	}
	
	private String changeDate(String value) {
		SimpleDateFormat preFormat = new SimpleDateFormat("yyyy-mm");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyymm");
		
		try {
			Date date = preFormat.parse(value);
			return afterFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "";
	}

	@Override
	public List<WaterFlowAnalysis> getList(long flctcFm, String date) {
		return waterFlowAnalysisRepository.findByDate(String.valueOf(flctcFm), date);
	}
}
