package com.kugou.handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kugou.pojo.Manager;
import com.kugou.service.ManagerService;

@Controller
public class ManagerHandler
{
	@Resource
	private ManagerService managerService;

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Manager manager, HttpServletRequest request)
	{
		Manager resultManager = managerService.login(manager);
		if (resultManager == null)
		{
			request.setAttribute("user", manager);
			// request.setAttribute("error", "账号或者密码错误");
			return "Admin";
		} else
		{
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", resultManager);
			return "redirect:/k/g";
		}
	}

	// 注册
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String insertManager(Manager manager) throws Exception
	{
		int result = managerService.insertManager(manager);
		return result > 0 ? "Admin" : "Register";
	}
}
