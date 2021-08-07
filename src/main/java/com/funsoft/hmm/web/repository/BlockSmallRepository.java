package com.funsoft.hmm.web.repository;

import java.util.List;

import com.funsoft.hmm.web.domain.db.BlockSmall;

public interface BlockSmallRepository extends DefaultRepository<BlockSmall, Long> {

	List<BlockSmall> findAllByOrderByBkNmAsc();

	BlockSmall findByBkNm(String bkNm);
	
}
