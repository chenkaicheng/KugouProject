package com.kugou.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kugou.dao.ImgDao;
import com.kugou.pojo.Img;
import com.kugou.service.ImgService;
@Service("imgService")
public class ImgServiceImpl implements ImgService
{
	@Resource
	private ImgDao imgDao;
	@Override
	public List<Img> selectAllImgs() 
	{
		return imgDao.selectImgInfo();
	}

}
