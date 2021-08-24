package com.funsoft.hmm.web.service;

import java.util.List;

import com.funsoft.hmm.web.domain.db.SudoGumchim;
import com.funsoft.hmm.web.domain.db.SudoGumchim.SudoGumchimCompositePK;
import com.funsoft.hmm.web.domain.param.SudoGumchimParam;

public interface SudoGumchimService extends CRUDService<SudoGumchim, SudoGumchimCompositePK> {

	List<SudoGumchim> getList(SudoGumchimParam param);

}
