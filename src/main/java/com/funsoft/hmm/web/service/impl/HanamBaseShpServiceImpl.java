package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.db.HanamBaseShp;
import com.funsoft.hmm.web.repository.HanamBaseShpRepository;
import com.funsoft.hmm.web.service.HanamBaseShpService;

@Service
public class HanamBaseShpServiceImpl implements HanamBaseShpService {
	
	@Autowired
	private HanamBaseShpRepository hanamBaseShpRepository;

	@Override
	public HanamBaseShp get(Long id) {
		return hanamBaseShpRepository.findById(id).get();
	}
	
	@Override
	public List<HanamBaseShp> getList() {
		return hanamBaseShpRepository.findAll();
	}

	@Override
	public boolean regist(HanamBaseShp domain) {
		return false;
	}

	@Override
	public boolean update(HanamBaseShp domain) {
		return false;
	}

	@Override
	public boolean delete(HanamBaseShp domain) {
		return false;
	}
}
