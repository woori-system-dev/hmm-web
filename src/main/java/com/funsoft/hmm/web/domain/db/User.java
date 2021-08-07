package com.funsoft.hmm.web.domain.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.funsoft.hmm.web.domain.Domain;

import lombok.Data;

/**
 * 사용자
 * 
 * @author hgko
 *
 */
@Entity
@Table(name = "SMT_USER")
@Data
public class User implements Domain {

	@Id
	private int userIdn;
	
	@Column(nullable = false, length = 20)
    private String userName;

	@Column(nullable = false, length = 20)
	private String loginId;
	
	@Column(nullable = false, length = 20)
	private String loginPw;

	@Column(length = 30)
	private String userDept;
	
	@Column(length = 20)
	private String userTel;
	
	@Column(length = 30)
	private String userEmail;
	
	@Column(nullable = false)
	private boolean adminYn;
}
