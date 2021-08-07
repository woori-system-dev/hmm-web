package com.funsoft.hmm.web.domain.db;

import java.util.Date;

import com.funsoft.hmm.web.domain.Domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 복합 키 지정(기본키가 두 개 이상일 경우 지정)
 * 
 * @author hgko
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompositePK implements Domain {
	
	/** 측정시간 */
	private Date datetime;
	
	/** 블록시설물번호 */
	private long bkFlctcFm;
}