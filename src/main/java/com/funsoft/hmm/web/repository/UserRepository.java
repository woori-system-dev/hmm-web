package com.funsoft.hmm.web.repository;

import com.funsoft.hmm.web.domain.db.User;

public interface UserRepository extends DefaultRepository<User, Integer> {

	User findByLoginIdAndLoginPw(String loginId, String password);
	
}
