package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;
import com.funsoft.hmm.web.domain.db.WaterFlowAnalysis.AnalysisCompositePK;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 총괄수량수지분석
 * - 총괄수량수지분석 결과 테이블
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "WATER_FLOW_ANALYSIS")
@Data
@IdClass(AnalysisCompositePK.class)
@NoArgsConstructor
public class WaterFlowAnalysis implements Domain {

	/** 블록번호 */
	@Id
	private long flctcFm;
	
	/** 분석년월 */
	@Id
	@Column(length = 6)
	private String anaYm;
	
	/** 총공급량(유효수량 + 무효수량) */
	private float totSpy;
	
	/** 유효수량(유수수량 + 무수수량) */
	private float validAmt;
	
	/** 유수수량(계량요금수량+미계량요금수량+분수량+기탑과량) */
	private float paidAmt;
	
	/** 계량요금수량(계량기로 계측하여 수도요금을 징수하는 수량) */
	private float pChkAmt;
	
	/** 미계량요금수량(계량기로 계측하지 않고 수도요금이 부과되는 수량) */
	private float pUchkAmt;
	
	/** 분수량(다른 수도사업자에게 나누어주는 수량) */
	private float pLendAmt;
	
	/** 기타부과량(공공 공원, 녹지, 공중화장실 등 타 회계로부터 수입이 있는 수량) */
	private float pEtcAmt;
	
	/** 무수수량(계량기불감수량+수도사업용수량+공공수량+부정수량) */
	private float unpaidAmt;
	
	/** 계량기불감수량(계량기에서 측정하지 못하고 사용되는 수량) */
	private float uMchkAmt;
	
	/** 수도사업용수량(정수장, 배수지 사용수량 및 수도관 세척 등 수도사업자 사용 수량) */
	private float uSudoAmt;
	
	/** 공공수량(소방용수, 운반급수 등 수입이 없는 수량) */
	private float uCommAmt;
	
	/** 부정수량(비허가사용, 업종변경, 계량기조작 등 불법적으로 사용된 수량) */
	private float uIllegalAmt;
	
	/** 무효수량(조정감액수량+누수수량) */
	private float invalidAmt;
	
	/** 조정감액수량(수도사업자 귀책사유로 요금징수시 감액해준 수량) */
	private float iReduceAmt;
	
	/** 누수수량(배수관부터 급수전 이전까지 발생한 손실량) */
	private float iLossAmt;
	
	/** 유수율((유수수량/총급수량)*100) */
	private float wtrFlowRate;
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class AnalysisCompositePK implements Domain {
		
		private long flctcFm;
		
		private String anaYm;
	}
}
