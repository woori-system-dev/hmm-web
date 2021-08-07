package com.funsoft.hmm.web.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 건전도 평가 - 블록 평가 도메인 클래스
 * 
 * @author hgko
 *
 */
@Data
public class BlockAssessmentInfo {
	
	private List<BlockAssessment> blockAssessments;
	
	private int level;
	
	private AssessmentLevel assessmentLevel;
	
	private float totalScore;
	
	private String content;

	@Data
	@AllArgsConstructor
	public static class BlockAssessment {
		
		private long flctcFm;
		
		private String bkNm;
		
		private float total;
		
		/** 관로나이(배수관) */
		private double pipeAge1;
		
		/** 관로나이(급수관) */
		private double pipeAge2;
		
		/** 노후관(배수관) */
		private String oldPipe1;
		
		/** 노후관(급수관) */
		private String oldPipe2;
		
		/** 내식성관(배수관) */
		private String corrosionResistancePipe1;
		
		/** 내식성관(급수관) */
		private String corrosionResistancePipe2;
		
		/** 누수건수(배수관) */
		private int waterLeakNum1;
		
		/** 누수건수(급수관) */
		private int waterLeakNum2;
		
		/** 좌표값 */
		private String coords;
	}
	
	public enum AssessmentLevel {
		위험, 주의;
	}
}
