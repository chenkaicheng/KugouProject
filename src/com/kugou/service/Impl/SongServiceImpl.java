package com.kugou.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kugou.dao.SongDao;
import com.kugou.pojo.Song;
import com.kugou.service.SongService;
import com.kugou.util.DataTables;

import net.sf.json.JSONArray;

@Service("songService")
public class SongServiceImpl implements SongService
{

	@Resource
	private SongDao songDao;

	// 音乐盛典
	@Override
	public List<Song> selectAllSongRadio()
	{
		return songDao.selectAllSongRadio();
	}

	// 热榜Top10
	@Override
	public List<Song> selectAllSongHeat()
	{
		return songDao.selectAllSongHeat();
	}

	// 最新歌曲
	@Override
	public List<Song> selectAllSong()
	{
		return songDao.selectAllSong();
	}

	// 原创和美女
	@Override
	public List<Song> selectAllSongOriginal()
	{
		return songDao.selectAllSongOriginal();
	}

	// MV热播
	@Override
	public List<Song> selectAllSongMV()
	{
		return songDao.selectAllSongMV();
	}

	// 搜索查询
	@Override
	public List<Song> selectAllSongInfo()
	{
		return songDao.selectAllSongInfo();
	}

	// 所有
	@Override
	public String selectAllSongs(DataTables dataTables)
	{

		System.out.println("dataTables.getSSearch() ========== " + dataTables.getSSearch());
		String[] columns =
		{ "songID", "songName" };// 页面对应的数据列
		Map<String, Object> params = new HashMap<String, Object>();// 传给Mapper的参数
		params.put("sSearch", dataTables.getSSearch());
		params.put("iDisplayStart", dataTables.getStart());
		params.put("pageDisplayLength", dataTables.getLength());
		params.put(dataTables.getsSortDir_0(), columns[dataTables.getiSortCol_0()]);// 获取需要的列和对应的排序方式

		List<Map<String, String>> logList = this.songDao.selectForSearch(params);// 返回的结果集
		dataTables.setiTotalDisplayRecords(this.songDao.iTotalDisplayRecords(params));// 搜索结果总行数
		dataTables.setiTotalRecords(this.songDao.iTotalRecords());// 所有记录总行数
		dataTables.setAaData(logList);

		String logsListJSON = JSONArray.fromObject(dataTables).toString();
		return logsListJSON.substring(1, (logsListJSON.length() - 1));// 截取掉两端的[]
	}

}
