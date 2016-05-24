package com.kugou.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kugou.dao.CooperateDao;
import com.kugou.pojo.Cooperate;
import com.kugou.service.CooperateService;

@Service("cooperateService")
public class CooperateServiceImpl implements CooperateService
{
	@Resource
	private CooperateDao cooperateDao;
	//合伙网站
	@Override
	public List<Cooperate> selectAllCooperateInfo()
	{
		return cooperateDao.selectAllCooperateInfo();
	}

}
