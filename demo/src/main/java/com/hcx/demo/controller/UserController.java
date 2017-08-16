package com.hcx.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.hcx.demo.pojo.User;
import com.hcx.demo.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 用户登录的方法
	 * @return
	 */
	@RequestMapping("/userLogin.action")
	public String userLogin(String username,String password,Model model){
		if ("".equals(username) || "".equals(password)) {
			model.addAttribute("msg", "用户名或密码不能为空");
			return "login";
		}
		User user = userService.getUserByUsernameAndPassword(username, password);
		if (user == null) {
			//登录失败
			model.addAttribute("msg", "用户名或密码不正确");
			return "login";
		}else {
			return "success";
		}
	}
	
	/**
	 * 用户登录的方法
	 * @return
	 */
	@RequestMapping("/userLoginAjax.action")
	@ResponseBody
	public String userLoginAjax(String username,String password,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject();
		User user = userService.getUserByUsernameAndPassword(username, password);
		if (user == null) {
			//登录失败
			jsonObject.put("code", "0");
			jsonObject.put("msg", "用户名或者密码不正确");
		}else {
			jsonObject.put("code", "1");
			request.getSession().setAttribute("loginUser", user);
		}
		return jsonObject.toString();
	}

}
