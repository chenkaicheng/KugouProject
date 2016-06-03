package com.kugou.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kugou.dao.ManagerDao;
import com.kugou.pojo.Manager;
import com.kugou.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService
{

	@Resource
	private ManagerDao managerDao;

	@Override
	public int insertManager(Manager manager)
	{
		// TODO Auto-generated method stub
		return managerDao.insertManager(manager);
	}

	@Override
	public Manager login(Manager manager)
	{
		// TODO Auto-generated method stub
		return managerDao.login(manager);
	}

}
