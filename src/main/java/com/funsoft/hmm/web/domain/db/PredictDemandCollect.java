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
	
	/** 수집순서 */
	@Id
	private long idx;
	
	/** 공휴일 */
	@Id
	@Column(length = 1)
	private String holiday;
	
	/** 하늘상태 */
	@Id
	@Column(length = 1)
	private String sky;
	
	/** 강수여부 */
	@Id
	@Column(length = 1)
	private String rain;
	
	/** 최저기온 */
	@Id
	@Column(length = 2)
	private String temLow;
	
	/** 최고기온 */
	@Id
	@Column(length = 2)
	private String temHigh;
	
	/** 습도 */
	@Id
	@Column(length = 1)
	private String humidity;

	/** 유량(1일) */
	@Lob
	@Column(columnDefinition = "CLOB")
	private String flowDaily;
	
	/** 수압(1일) */
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
