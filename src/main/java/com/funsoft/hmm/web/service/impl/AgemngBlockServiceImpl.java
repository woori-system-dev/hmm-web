package com.funsoft.hmm.web.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.AgemngBlock;
import com.funsoft.hmm.web.repository.AgemngBlockRepository;
import com.funsoft.hmm.web.service.AgemngBlockService;
import com.funsoft.hmm.web.service.BlockSmallService;

@Service
@Transactional
public class AgemngBlockServiceImpl implements AgemngBlockService {
	
	@Autowired
	private AgemngBlockRepository agemngBlockRepository;
	
	@Autowired
	private BlockSmallService blockSmallService;

	@Override
	public AgemngBlock get(Long id) {
		return agemngBlockRepository.findById(id).get();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AgemngBlock> getList() {
		return agemngBlockRepository.OrderByBkNm().stream().map(data -> {
			data.setCoords(blockSmallService.get(data.getFlctcFm()).getCoords());
			return data;
		}).collect(Collectors.toList());
	}

	@Override
	public boolean regist(AgemngBlock domain) {
		if (isNew(domain)) {
			return agemngBlockRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(AgemngBlock domain) {
		if (!isNew(domain)) {
			return agemngBlockRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(AgemngBlock domain) {
		agemngBlockRepository.delete(domain);
		return true;
	}

	private boolean isNew(AgemngBlock domain) {
		return !agemngBlockRepository.existsById(domain.getFlctcFm());
	}

}
