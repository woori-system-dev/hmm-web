package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.PressureDevice;
import com.funsoft.hmm.web.repository.PressureDeviceRepository;
import com.funsoft.hmm.web.service.PressureDeviceService;

@Service
@Transactional
public class PressureDeviceServiceImpl implements PressureDeviceService {
	
	@Autowired
	private PressureDeviceRepository pressureDeviceRepository;

	@Override
	public PressureDevice get(Long id) {
		return pressureDeviceRepository.findById(id).get();
	}
	
	@Override
	public List<PressureDevice> getList() {
		return null;
	}

	@Override
	public boolean regist(PressureDevice domain) {
		if (isNew(domain)) {
			return pressureDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(PressureDevice domain) {
		if (!isNew(domain)) {
			return pressureDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(PressureDevice domain) {
		pressureDeviceRepository.delete(domain);
		return true;
	}

	private boolean isNew(PressureDevice flowDevice) {
		return !pressureDeviceRepository.existsById(flowDevice.getFtrIdn());
	}

}
