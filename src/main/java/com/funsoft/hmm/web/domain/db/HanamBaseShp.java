package com.funsoft.hmm.web.domain.db;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * HANAM_BASE Shp
 * 
 * @author hoywon
 *
 */
@Entity
@Table(name = "HANAM_BASE")
@Data
public class HanamBaseShp implements Domain {

	/** 측정시간 */
	@Id
	private long id;
		
	/** 지속시간 */
	private String geojson;
}
