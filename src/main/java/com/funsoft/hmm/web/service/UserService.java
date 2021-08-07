package com.funsoft.hmm.web.service;

import com.funsoft.hmm.web.domain.db.User;

public interface UserService extends CRUDService<User, Integer> {

	public User login(String userId, String password);
}
