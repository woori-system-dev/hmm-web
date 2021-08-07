package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.BlockSmall;
import com.funsoft.hmm.web.repository.BlockSmallRepository;
import com.funsoft.hmm.web.service.BlockSmallService;

@Service
@Transactional
public class BlockSmallServiceImpl implements BlockSmallService {
	
	@Autowired
	private BlockSmallRepository blockSmallRepository;

	@Override
	public BlockSmall get(Long id) {
		return blockSmallRepository.findById(id).get();
	}
	
	@Override
	public List<BlockSmall> getList() {
		return blockSmallRepository.findAllByOrderByBkNmAsc();
	}

	@Override
	public boolean regist(BlockSmall domain) {
		if (isNew(domain)) {
			return blockSmallRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(BlockSmall domain) {
		if (!isNew(domain)) {
			return blockSmallRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(BlockSmall domain) {
		blockSmallRepository.delete(domain);
		return true;
	}
	
	@Override
	public boolean isNew(BlockSmall blockSmall) {
		return !blockSmallRepository.existsById(blockSmall.getFlctcFm());
	}

	@Override
	public BlockSmall get(long flctcFm) {
		return blockSmallRepository.findById(flctcFm).get();
	}
	
	@Override
	public BlockSmall getBkNM(String bkNm) {
		return blockSmallRepository.findByBkNm(bkNm);
	}

}
