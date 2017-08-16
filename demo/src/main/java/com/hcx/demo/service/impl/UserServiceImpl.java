package com.hcx.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hcx.demo.dao.UserDao;
import com.hcx.demo.pojo.User;
import com.hcx.demo.pojo.UserQuery;
import com.hcx.demo.pojo.UserQuery.Criteria;
import com.hcx.demo.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User getUserByUsernameAndPassword(String username, String password) {
		UserQuery example = new UserQuery();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<User> list = userDao.selectByExample(example );
		if (list.size() > 0) {
			return list.get(0);
		}else {
			return null;
		}
	}

	

}
