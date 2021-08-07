package com.funsoft.hmm.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.funsoft.hmm.web.domain.db.AlarmDevice;
import com.funsoft.hmm.web.domain.db.CompositePK;

public interface AlarmDeviceRepository extends DefaultRepository<AlarmDevice, CompositePK> {
	
	@Query(value = "SELECT * FROM ALM_DEVICE WHERE BK_FLCTC_FM = ?1 and to_char(DATETIME, 'yyyy-MM-dd') = ?2", nativeQuery = true)
	List<AlarmDevice> findByBkFlctcFmAndDate(long blockId, String date);
}
