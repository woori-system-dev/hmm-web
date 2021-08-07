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

	@Id
	private int idx;
	
	@Column(length = 4)
	private String year;
	
	@Column(length = 2)
	private String month;
	
	@Column(length = 2)
	private String day;
	
	private boolean holiday;
}
