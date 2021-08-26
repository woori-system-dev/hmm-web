package com.funsoft.hmm.web.domain.db;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;
import lombok.Getter;

/**
 * 수압이상 알람
 * - 수압이상 알람정보
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "ALM_PRESSURE")
@Data
@IdClass(CompositePK.class)
public class AlarmPressure implements Domain {

	/** 측정시간 */
	@Id
	@Temporal(TemporalType.TIMESTAMP)
	private Date datetime;
	
	/** 지형지물부호 */
	@Column(length = 5)
	private String bkFlctcCde;
	
	/** 블록시설물번호 */
	@Id
	private long bkFlctcFm;
	
	/** 수압이상알람(1:상한1차이상, 2:상한2차이상, 3:하한1차이상, 4:하한2차이상) */
	@Enumerated(EnumType.ORDINAL)
	@Column(nullable = false)
	private AlarmPreesureType prsAbnm;
	
	/** 계측수압 */
	private float prsData;
	
	@Getter
	public enum AlarmPreesureType {
		NONE("0"),
		고수압주의("1"),
		고수압경보("2"),
		저수압주의("3"),
		저수압경보("4");
		
		private String type;
		
		private AlarmPreesureType(String type) {
			this.type = type;
		}
		
		public static AlarmPreesureType valueOfType(String type) {
			for (AlarmPreesureType preesureType : AlarmPreesureType.values()) {
				if (preesureType.getType().equals(type)) {
					return preesureType;
				}
			}
			
			return null;
		}
	}
}
