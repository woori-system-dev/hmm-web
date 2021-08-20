package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 공휴일 정보
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "HOLIDAY")
@Data
public class Holiday implements Domain {

	/** 순서 */
	@Id
	private int idx;
	
	/** 년 */
	@Column(length = 4)
	private String year;
	
	/** 월 */
	@Column(length = 2)
	private String month;
	
	/** 일 */
	@Column(length = 2)
	private String day;
	
	/** 공휴일 여부(평일(0), 공휴일(1)) */
	private boolean holiday;
}
