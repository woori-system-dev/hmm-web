package com.funsoft.hmm.web.service;

import com.funsoft.hmm.web.domain.db.BlockSmall;

public interface BlockSmallService extends CRUDService<BlockSmall, Long> {

	public BlockSmall get(long flctcFm);
	
	public BlockSmall getBkNM(String bkNm);
	
	public boolean isNew(BlockSmall blockSmall);
}
