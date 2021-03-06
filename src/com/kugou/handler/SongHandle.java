package com.kugou.handler;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kugou.pojo.Cooperate;
import com.kugou.pojo.Img;
import com.kugou.pojo.Song;
import com.kugou.service.CooperateService;
import com.kugou.service.ImgService;
import com.kugou.service.SongService;
import com.kugou.util.DataTables;
import com.kugou.util.PackContents;

@Controller
@RequestMapping("/k")
public class SongHandle
{
	@Autowired
	private HttpServletRequest request;
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

	// 搜索查询
	@RequestMapping(value = "/s", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String selectAllSongInfo(@RequestParam(value = "show") String show, Map<String, Object> map)
	{
		try
		{
			show = new String(show.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		map.put("SongName", show);
		request.getSession().setAttribute("SongName", show);
		List<Song> list = songService.selectAllSongInfo();
		map.put("list", list);
		return PackContents.REGISTER_PAGE;
	}

	// 分页查询
	@RequestMapping(value = "/t", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public void selectAllSong(HttpServletResponse response)
	{// 指定输出内容类型和编码
		response.setContentType("text/html;charset=utf-8");
		try
		{
			DataTables dataTables = DataTables.createDataTables(request);
			if (dataTables.getSSearch() == null)
			{
				dataTables.setSSearch((String) request.getSession().getAttribute("SongName"));
			}
			PrintWriter out = response.getWriter(); // 获取输出流
			out.print(this.songService.selectAllSongs(dataTables));// 返回结果
			out.flush();
			out.close();
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
	}

	// 跳转到播放页面
	@RequestMapping("/q")
	public String selectSongById(Integer id, Map<String, Object> map)
	{
		Song song = songService.selectSongById(id);
		map.put("song", song);
		return PackContents.MUSIC_PAGE;

	}
}
