package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;
import com.funsoft.hmm.web.domain.db.PredictDemandCollect.PredictDemandCollectPK;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 예상수요량수집
 * - 수집된 예상수요량을 갖는 테이블
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "PREDICT_DEMAND_COLLECT")
@Data
@IdClass(PredictDemandCollectPK.class)
public class PredictDemandCollect implements Domain {
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 수집순서 - 수집순위와 유량데이터를 제외한 동일 조건하에서 수집된 데이터들에 순서를 부여하여 관리하기 위한 IDX */
	@Id
	private long idx;
	
	/** 공휴일 - 평일(0), 휴일(1) */
	@Id
	@Column(length = 1)
	private String holiday;
	
	/** 하늘상태 - 맑음(0), 구름조금(1), 구름많음(2), 흐림(3) */
	@Id
	@Column(length = 1)
	private String sky;
	
	/** 강수여부 - 없음(0), 있음(1) */
	@Id
	@Column(length = 1)
	private String rain;
	
	/** 
	 * 최저기온 
	 * -15이하     (00)
	 * -14~-10 (01)
	 * -9~-5   (02)
	 * -4~0    (03)
	 * 1~5     (04)
	 * 6~10    (05)
	 * 11~15   (06)
	 * 16~20   (07)
	 * 21~25   (08)
	 * 26~30   (09)
	 * 31~35   (10)
	 * 36~40   (11)
	 * 40이상        (12)
	 */
	@Id
	@Column(length = 2)
	private String temLow;
	
	/** 
	 * 최고기온 
	 * -15이하     (00)
	 * -14~-10 (01)
	 * -9~-5   (02)
	 * -4~0    (03)
	 * 1~5     (04)
	 * 6~10    (05)
	 * 11~15   (06)
	 * 16~20   (07)
	 * 21~25   (08)
	 * 26~30   (09)
	 * 31~35   (10)
	 * 36~40   (11)
	 * 40이상        (12)
	 */
	@Id
	@Column(length = 2)
	private String temHigh;
	
	/** 
	 * 습도 
	 * 0~9    (0)
	 * 10~19  (1)
	 * 20~29  (2)
	 * 30~39  (3)
	 * 40~49  (4)
	 * 50~59  (5)
	 * 60~69  (6)
	 * 70~79  (7)
	 * 80~89  (8)
	 * 90~100 (9)
	 */
	@Id
	@Column(length = 1)
	private String humidity;
	
	/**
	 * 유량(1일) 
	 * 00시00분~23시 59분(총 288개의 유량 데이터를 1분 간격으로 가지는 테이블)
	 * (1분단위 유량 당 char (4 byte) 사용, 총 1440개 데이터)  ex> '0047'
	 * (소수->자연수 반올림), (단위 ㎥ / h 이므로 사용시 참고하여 환상 후 사용 필요) 
	 */
	@Lob
	@Column(columnDefinition = "CLOB")
	private String flowDaily;
	
	/** 
	 * 수압(1일)
	 * 00시00분~23시 59분(총 288개의 수압 데이터를 1분 간격으로 가지는 테이블)
	 * (1분단위 수압 당 char (4 byte) 사용, 총 1440개 데이터)  ex> '4.20'
	 * (소수->세자리 반올림) 4자리로 맞춤 
	 */
	@Lob
	@Column(columnDefinition = "CLOB")
	private String pressureDaily;
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class PredictDemandCollectPK implements Domain {
		
		private long bkFlctcFm;
		
		private long idx;
		
		private String holiday;
		
		private String sky;
		
		private String rain;
		
		private String temLow;
		
		private String temHigh;
		
		private String humidity;
	}
}
