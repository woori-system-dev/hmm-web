package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 블록 건전도 평가 결과
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "AGEMNG_BLOCK")
@Data
public class AgemngBlock implements Domain {

	/** 블록번호 */
	@Id
	private long flctcFm;
	
	/** 블록명칭 */
	@Column(length = 255)
	private String bkNm;
	
	/** A1인자 평가결과값 - 관로나이(배수관) 평가결과값 */
	@Column(name = "A1_VAL")
	private double a1Val;
	
	/** A1인자 평가결과점수 - 관로나이(배수관) 평가결과점수 */
	@Column(name = "A1_SCORE")
	private double a1Score;
	
	/** A2인자 평가결과점수 - 관로나이(급수관) 평가결과점수 */
	@Column(name = "A2_SCORE")
	private double a2Score;
	
	/** B1인자 평가결과점수 - 노후관(배수관) 평가결과점수 */
	@Column(name = "B1_SCORE")
	private double b1Score;
	
	/** B2인자 평가결과점수 - 노후관(급수관) 평가결과점수 */
	@Column(name = "B2_SCORE")
	private double b2Score;
	
	/** C1인자 평가결과점수 - 내성식관(배수관) 평가결과점수 */
	@Column(name = "C1_SCORE")
	private double c1Score;
	
	/** C2인자 평가결과점수 - 내성식관(급수관) 평가결과점수 */
	@Column(name = "C2_SCORE")
	private double c2Score;
	
	/** D1인자 평가결과점수 - 누수건수(배수관) 평가결과점수 */
	@Column(name = "D1_SCORE")
	private double d1Score;
	
	/** D2인자 평가결과점수 - 누수건수(급수관) 평가결과점수 */
	@Column(name = "D2_SCORE")
	private double d2Score;
	
	/** 평가결과점수 합계 */
	private double scoreSum;
	
	/** 진단위험도 */
	private int risk;
	
	/** 진단내용 */
	@Column(length = 1000)
	private String ageContent;
	
	/** 좌표값 - WKT 타입의 좌표값 */
	@Transient
	private String coords;
}
