package com.kugou.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kugou.pojo.Img;

/**
 * @author Administrator
 *
 */
@Repository
public interface ImgDao 
{
	List<Img> selectImgInfo();
}
