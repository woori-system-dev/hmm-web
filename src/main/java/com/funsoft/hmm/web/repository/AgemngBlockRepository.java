package com.funsoft.hmm.web.repository;

import java.util.List;

import com.funsoft.hmm.web.domain.db.AgemngBlock;

public interface AgemngBlockRepository extends DefaultRepository<AgemngBlock, Long> {

	List<AgemngBlock> OrderByBkNm();

}
