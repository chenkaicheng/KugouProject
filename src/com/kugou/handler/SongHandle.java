package com.kugou.handler;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kugou.pojo.Cooperate;
import com.kugou.pojo.Song;
import com.kugou.service.CooperateService;
import com.kugou.service.SongService;
import com.kugou.util.PackContents;


@Controller
@RequestMapping("/song")
public class SongHandle
{
	@Resource
	private SongService songService;
	@Resource
	private CooperateService cooperateService;
	
	@RequestMapping("/selectAllSong")
	public String selectAllSongs(Map<String, Object>map)
	{
		//音乐盛典
		List<Song>songRadio=songService.selectAllSongRadio();
		map.put("songRadio", songRadio);
		//热榜Top10
		List<Song>songHeat=songService.selectAllSongHeat();
		map.put("songHeat", songHeat);
		//最新歌曲
		List<Song>song=songService.selectAllSong();
		map.put("song", song);
		//原创和美女
		List<Song>songOriginal=songService.selectAllSongOriginal();
		map.put("songOriginal", songOriginal);
		//MV热播
		List<Song>songMV=songService.selectAllSongMV();
		map.put("songMV", songMV);
		//合伙网站
		List<Cooperate>cooperate=cooperateService.selectAllCooperateInfo();
		map.put("cooperate", cooperate);
		return PackContents.KUGOU_PAGE;
	}
}

