package com.kugou.service;

import java.util.List;

import com.kugou.pojo.Song;
import com.kugou.util.DataTables;

public interface SongService
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
	public List<Song> selectAllSongInfo();

	// 所有
	public String selectAllSongs(DataTables dataTables);

	//根据id查询
	public Song selectSongById(Integer id);
}
