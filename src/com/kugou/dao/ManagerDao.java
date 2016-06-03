package com.kugou.dao;

import com.kugou.pojo.Manager;

public interface ManagerDao
{

	// 登录
	Manager login(Manager manager);

	// 注册
	int insertManager(Manager manager);
}
