package com.kugou.service;

import com.kugou.pojo.Manager;

public interface ManagerService
{
	// 登录
	Manager login(Manager manager);

	// 注册
	int insertManager(Manager manager);
}
