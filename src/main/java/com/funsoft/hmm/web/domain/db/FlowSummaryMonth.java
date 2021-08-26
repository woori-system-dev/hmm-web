package com.funsoft.hmm.web.domain.db;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
public class FlowSummaryMonth {

	/** 집계년월 - 년월(YYYYMM) */
	@Id
	private String summartYm;
	
	/** 집계수요량 */
	private int summaryAmt;
}
