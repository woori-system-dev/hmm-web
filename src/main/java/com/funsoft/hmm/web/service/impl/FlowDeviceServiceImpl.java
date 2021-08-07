package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funsoft.hmm.web.domain.db.FlowDevice;
import com.funsoft.hmm.web.repository.FlowDeviceRepository;
import com.funsoft.hmm.web.service.FlowDeviceService;

@Service
public class FlowDeviceServiceImpl implements FlowDeviceService {
	
	@Autowired
	private FlowDeviceRepository flowDeviceRepository;

	@Override
	public FlowDevice get(Long id) {
		return flowDeviceRepository.findById(id).get();
	}
	
	@Override
	public List<FlowDevice> getList() {
		return flowDeviceRepository.findAll();
	}

	@Override
	public boolean regist(FlowDevice domain) {
		if (isNew(domain)) {
			return flowDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(FlowDevice domain) {
		if (!isNew(domain)) {
			return flowDeviceRepository.save(domain) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(FlowDevice domain) {
		flowDeviceRepository.delete(domain);
		return true;
	}

	private boolean isNew(FlowDevice flowDevice) {
		return !flowDeviceRepository.existsById(flowDevice.getFtrIdn());
	}
}
