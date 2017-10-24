package com.damianhorna.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damianhorna.mvc.dao.UserDAO;
import com.damianhorna.mvc.entities.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public void saveUser(User user) {
		userDAO.saveUser(user);
	}

}
