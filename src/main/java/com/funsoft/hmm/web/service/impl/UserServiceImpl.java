package com.funsoft.hmm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.funsoft.hmm.web.domain.db.User;
import com.funsoft.hmm.web.repository.UserRepository;
import com.funsoft.hmm.web.service.UserService;

/**
 * 사용자 관리 서비스
 * 
 * @author hgko
 *
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User get(Integer id) {
		return userRepository.findById(id).get();
	}

	@Override
	public List<User> getList() {
		return userRepository.findAll();
	}

	@Override
	public boolean regist(User user) {
		if (isNew(user)) {
			return userRepository.save(user) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean update(User user) {
		if (!isNew(user)) {
			return userRepository.save(user) != null;
		} else {
			return false;
		}	
	}

	@Override
	public boolean delete(User user) {
		userRepository.delete(user);
		return true;
	}

	private boolean isNew(User user) {
		return !userRepository.existsById(user.getUserIdn());
	}

	@Override
	public User login(String userId, String password) {
		return userRepository.findByLoginIdAndLoginPw(userId, password);
	}
	
}
