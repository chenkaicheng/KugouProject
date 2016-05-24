package com.kugou.service.Impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kugou.dao.SongDao;
import com.kugou.pojo.Song;
import com.kugou.service.SongService;

@Service("songService")
public class SongServiceImpl implements SongService
{

	@Resource
	private SongDao songDao;

	//音乐盛典
	@Override
	public List<Song> selectAllSongRadio()
	{
		return songDao.selectAllSongRadio();
	}
	
	//热榜Top10
	@Override
	public List<Song> selectAllSongHeat()
	{
		return songDao.selectAllSongHeat();
	}
	
	//最新歌曲
	@Override
	public List<Song> selectAllSong()
	{
		return songDao.selectAllSong();
	}

	//原创和美女
	@Override
	public List<Song> selectAllSongOriginal()
	{
		return songDao.selectAllSongOriginal();
	}
	//MV热播
	@Override
	public List<Song> selectAllSongMV()
	{
		return songDao.selectAllSongMV();
	}


}
