package com.kugou.dao;

import java.util.List;

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
}
