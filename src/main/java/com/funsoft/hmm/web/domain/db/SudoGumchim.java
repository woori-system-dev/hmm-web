package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;
import com.funsoft.hmm.web.domain.db.SudoGumchim.SudoGumchimCompositePK;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 수도 검침 테이블
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "SUDO_GUMCHIM")
@Data
@IdClass(SudoGumchimCompositePK.class)
public class SudoGumchim implements Domain {
	
	/** 관리번호 - 수용가번호 */
	@Id
	@Column(length = 15)
	private String suyNo;
	
	/** 납기 - 납기년월 */
	@Id
	@Column(length = 6)
	private String payYm;

	/** 주소 - 수용가의 주소 */
	@Column(length = 255)
	private String suyAddr;
	
	/** 상수업종 - 계량기 업종(코드:업종명) */
	@Column(length = 20)
	private String sangBiz;
	
	/** 구경 - 계량기 구경(코드:구경MM) */
	@Column(length = 20)
	private String sangDip;
	
	/** 계기번호 - 계량기 계기번호 */
	@Column(length = 20)
	private String metaNum;
	
	/** 세대수 - 수용가의 세대수 */
	private int homCnt;
	
	/** 검침일자 - 검침한 년월일 */
	@Column(length = 8)
	private String gumchimYmd;
	
	/** 상수지침 - 계량기 지침 */
	private int gumchim;
	
	/** 상수인정 - 지침 인정(코드:값) */
	@Column(length = 20)
	private String sangRec;
	
	/** 상수사용량 - 지침과 인정으로 계산된 최종 상수 사용량 */
	private int sangAmt;
	
	/** 상수도료 - 상수사용량에 따른 상수도요금 */
	private int sangWon;
	
	/** 정액료 - 정액요금 */
	private int sjungWon;
	
	/** 하수사용량 */
	private int haAmt;
	
	/** 하수도료 - 하수 사용량에 따른 하수도요금 */
	private int haWon;
	
	/** 물부담금 */
	private int wtrWon;
	
	/** 전체합계 - 상수도료+정액료+하수도료+물부담금 */
	private int totWon;
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class SudoGumchimCompositePK implements Domain {
		
		private String suyNo;
		
		private String payYm;
	}
}
