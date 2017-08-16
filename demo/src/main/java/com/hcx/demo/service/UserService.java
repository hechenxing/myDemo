package com.hcx.demo.service;

import com.hcx.demo.pojo.User;

public interface UserService {
	
	/**
	 * 通过用户名和密码获取user对象
	 * @return 存在则返回user对象，不存在则返回null
	 */
	public User getUserByUsernameAndPassword(String username,String password);

}
