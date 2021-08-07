package com.funsoft.hmm.web.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import com.funsoft.hmm.web.domain.Domain;

@NoRepositoryBean
public interface DefaultRepository<T extends Domain, ID extends Serializable> extends JpaRepository<T, ID> {
}
