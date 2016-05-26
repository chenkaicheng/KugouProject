package com.kugou.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kugou.pojo.Cooperate;
import com.kugou.pojo.Img;
import com.kugou.pojo.Song;
import com.kugou.service.CooperateService;
import com.kugou.service.ImgService;
import com.kugou.service.SongService;
import com.kugou.util.PackContents;
import com.kugou.util.StringUtil;

@Controller
@RequestMapping("/k")
public class SongHandle
{
	@Resource
	private SongService songService;
	@Resource
	private CooperateService cooperateService;
	@Resource
	private ImgService imgService;

	@RequestMapping("/g")
	public String selectAllSongs(Map<String, Object> map)
	{
		// 音乐盛典
		List<Song> songRadio = songService.selectAllSongRadio();
		map.put("songRadio", songRadio);
		// 热榜Top10
		List<Song> songHeat = songService.selectAllSongHeat();
		map.put("songHeat", songHeat);
		// 最新歌曲
		List<Song> song = songService.selectAllSong();
		map.put("song", song);
		// 原创和美女
		List<Song> songOriginal = songService.selectAllSongOriginal();
		map.put("songOriginal", songOriginal);
		// MV热播
		List<Song> songMV = songService.selectAllSongMV();
		map.put("songMV", songMV);
		// 合伙网站
		List<Cooperate> cooperate = cooperateService.selectAllCooperateInfo();
		map.put("cooperate", cooperate);
		// 首页大图片轮换效果
		List<Img> list = imgService.selectAllImgs();
		map.put("list", list);
		return PackContents.KUGOU_PAGE;
	}
	
	//搜索查询
	@RequestMapping(value="/s",method=RequestMethod.GET)
	public String selectAllSongInfo(Song song)
	{
		System.out.println("123");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("show", StringUtil.formatLike(song.getSongName()));
		System.out.println(map);
		return PackContents.REGISTER_PAGE;
	}
}
