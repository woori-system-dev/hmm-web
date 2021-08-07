package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

@Entity
@Table(name = "ALM_THRESHOLD")
@Data
public class AlarmThreshold implements Domain {

	/** 시설물번호 */
	@Id
	private long flctcFm;

	/** 지형지물부호 */
	@Column(nullable = false, length = 5)
	private String flctcCde;
	
	/** 허용유량 */
	private float allowFlow;
}
