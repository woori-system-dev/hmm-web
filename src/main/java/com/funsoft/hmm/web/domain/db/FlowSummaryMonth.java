package com.funsoft.hmm.web.domain.db;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 월별 수요량 집계
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "FLOW_SUMMARY_MONTH")
@Data
public class FlowSummaryMonth implements Domain {

	/** 집계년월 - 년월(YYYYMM) */
	@Id
	private String summaryYm;
	
	/** 집계수요량 */
	private int summaryAmt;
}
