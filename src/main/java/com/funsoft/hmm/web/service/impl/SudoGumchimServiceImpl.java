package com.funsoft.hmm.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.SudoGumchim;
import com.funsoft.hmm.web.domain.db.SudoGumchim.SudoGumchimCompositePK;
import com.funsoft.hmm.web.domain.param.SudoGumchimParam;
import com.funsoft.hmm.web.repository.SudoGumchimRepository;
import com.funsoft.hmm.web.service.SudoGumchimService;

/**
 * 수도 검침 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class SudoGumchimServiceImpl implements SudoGumchimService {

	@Autowired
	private SudoGumchimRepository sudoGumchimRepository;
	
	@Override
	public SudoGumchim get(SudoGumchimCompositePK id) {
		return sudoGumchimRepository.findById(id).get();
	}

	@Override
	public List<SudoGumchim> getList() {
		return sudoGumchimRepository.findAll();
	}

	@Override
	public boolean regist(SudoGumchim domain) {
		if (isNew(domain)) {
			return sudoGumchimRepository.save(domain) != null;
		} else {
			return false;
		}
	}

	@Override
	public boolean update(SudoGumchim domain) {
		if (!isNew(domain)) {
			return sudoGumchimRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(SudoGumchim domain) {
		sudoGumchimRepository.delete(domain);
		return true;
	}

	private boolean isNew(SudoGumchim domain) {
		return !sudoGumchimRepository.existsById(new SudoGumchimCompositePK(domain.getSuyNo(), domain.getPayYm()));
	}

	@Transactional(readOnly = true)
	@Override
	public List<SudoGumchim> getList(SudoGumchimParam param) {
		String startDate = changeDate(param.getStartDate());
		String endDate = changeDate(param.getEndDate());
		
		if (param.getSangBiz().equals("전체")) {
			if (param.getSuyNo().isEmpty() && param.getMetaNum().isEmpty()) {
				return sudoGumchimRepository.findByGumchimYmdBetween(startDate, endDate);
			} else {
				return sudoGumchimRepository.findBySuyNoAndMetaNumAndGumchimYmdBetween(param.getSuyNo(), param.getMetaNum(), startDate, endDate);
			}
		}
		
		return sudoGumchimRepository.findBySuyNoAndSangBizAndMetaNumAndGumchimYmdBetween(param.getSuyNo(), param.getSangBiz(), param.getMetaNum(), startDate, endDate);
	}
	
	private String changeDate(String value) {
		SimpleDateFormat preFormat = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyymmdd");
		
		try {
			Date date = preFormat.parse(value);
			return afterFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "";
	}
}

