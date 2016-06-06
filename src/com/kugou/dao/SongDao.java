package com.kugou.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kugou.pojo.Song;

public interface SongDao
{
	// 音乐盛典
	public List<Song> selectAllSongRadio();

	// 热榜Top10
	public List<Song> selectAllSongHeat();

	// 最新歌曲
	public List<Song> selectAllSong();

	// 原创和美女
	public List<Song> selectAllSongOriginal();

	// MV热播
	public List<Song> selectAllSongMV();

	// 搜索查询
	public List<Song> selectAllSongInfo(@Param(value = "SongName") String show);

	// 表记录总行数
	public Integer iTotalRecords();

	// 表搜索记录总行数
	public Integer iTotalDisplayRecords(Map<String, Object> params);

	// datatables分页查询
	public List<Map<String, String>> selectForSearch(Map<String, Object> params);
}
