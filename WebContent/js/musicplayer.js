/*
 * q6player:html5播放器
 * ver 2.1.0
 * by q6q64399
 * */
$.music = {
	getlyric: function(lyric) {
		console.log('[info] 歌词处理执行');
		var lyc = [];
		try {
			var l = lyric.match(/\[\S+\][\S\t\v\r ]+/g);
			var musicinfo = "<div class='music-lyric-info'>";
			for (var i = 0; i < 5; i++) {
				var obj = new Object();
				obj.t = "0";
				obj.c = '&nbsp;&nbsp;';
				lyc.push(obj);
			}
			//匹配歌曲名字
			try {

				musicinfo += "歌曲： " + lyric.match(/\[ti:[\u4e00-\u9fa5,A-Z,a-z,0-9]+\]/)[0].replace(/\[ti:/, "").replace(/\]/, "");

			} catch (err) {
				console.log('[info] 没有歌曲名称信息');
			}
			//匹配歌手
			try {

				musicinfo += "<br/>演唱： " + lyric.match(/\[ar:[\u4e00-\u9fa5,A-Z,a-z,0-9]+\]/)[0].replace(/\[ar:/, "").replace(/\]/, "");

			} catch (err) {
				console.log('[info] 没有歌手信息' + err.toString());
			}
			//匹配歌词专辑
			try {

				musicinfo += "<br/>专辑： " + lyric.match(/\[al:[\u4e00-\u9fa5,A-Z,a-z,0-9]+\]/)[0].replace(/\[al:/, "").replace(/\]/, "");

			} catch (err) {
				console.log('[info] 没有歌词制作者信息');
			}
			musicinfo += "</div>"
			var obj = new Object();
			obj.t = "1";
			obj.c = musicinfo;
			lyc.push(obj);
			for (var i = 0; i < l.length; i++) {
				//console.log(l[i]);
				try {
					var str = l[i].match(/\[\d+:\d+.\d+\]/g) + "";
					var count = str.split(',');
					var content = l[i].replace(l[i].match(/\[\S+\]/g), '');
					for (var c = 0; c < count.length; c++) {
						//console.log(count[1]);
						var times = (count[c]).match(/\d+/g);
						var time = Number(Number(times[0] * 60) + Number(times[1]) + Number(times[2]) / 1000).toFixed(0);
						var obj = new Object();
						obj.t = time;
						obj.c = content;
						lyc.push(obj);
					}
					//console.log(lyc[i].t);
				} catch (err) {
					console.log('[debug] 未知歌词信息：' + l[i] + '，错误详情：' + err);
				}

			}
			var temp;
			for (var i = 0; i < lyc.length; i++) {
				for (var j = 0; j < lyc.length - i; j++) {
					try {
						var ls = Number(lyc[j + 1].t);
						if (Number(lyc[j].t) > ls) {
							temp = lyc[j + 1];
							lyc[j + 1] = lyc[j];
							lyc[j] = temp;
							//console.log(temp);
						}
					} catch (err) {

					}
				}
			}
			console.log('[info] 歌词文件就位');
		} catch (err) {
			var obj = new Object();
			obj.t = '0';
			obj.c = '歌词内容异常';
			lyc.push(obj);
			console.log('[warning] err01：无法找到歌词文件或者无法正则' + err);
		}
		return lyc;
	}
}

//主线程方法
$(function() {
	//全局ajax同步
	$.ajaxSetup({
		async: false
	});
	/* 全局变量
	 * _lrc:歌词对象
	 * 
	 */
	var _lrc;

	//创建player对象
	$('q6player').each(function() {
		//处理歌词文件
		$(this).html('');
		$.get($(this).attr('lrc'), function(data) {
			_lrc = $.music.getlyric(data);
			console.log(_lrc);
		});
		//创建歌词
		var str = '';
		for (var i = 0; i < _lrc.length; i++) {
			str += "<lrc time='" + _lrc[i].t + "'>" + _lrc[i].c + "</lrc>"
		}
		//创建界面
		$(this).append("<div class='music-panel music-panel-close '><div class='music-button-panel '><i tag='stop' style='font-size: 40px;' class='bf music-button music-button-xs music-play'>&#xe6e1;</i>" +
			"<i class='iconfont music-button music-button-xs music-stop'>&#xe626;</i></div>" +
			"<div class='music-button-lyric-panel'><i class='iconfont music-button music-button-xs music-button-lyric'>&#xe758;</i></div>" +
			"<!-- 进度条panel -->" +
			"<div class='music-progress-panel' ><div class='music-progress'></div></div>" +
			"<!-- 歌词panel --><div style='display: none;' class='music-lyric-panel'>" + str + "</div>" +
			"<audio src='" + $(this).attr('src') + "' class='music-main'></audio></div>");

	});
	//打开歌词
	$('.music-button-lyric').click(function() {
		if ($(this).parent().parent().hasClass('music-panel-close')) {
			$(this).html('&#xe769;');
			$(this).parent().parent().removeClass('music-panel-close');
			$(this).parent().parent().addClass('music-panel-open');
			$(this).parent().nextAll('.music-lyric-panel').addClass('music-lyric-left');
			$(this).parent().nextAll('.music-lyric-panel').attr('style', '');
		} else {
			$(this).html('&#xe758;');
			$(this).parent().parent().removeClass('music-panel-open');
			$(this).parent().parent().addClass('music-panel-close');
			$(this).parent().parent().removeClass('music-lyric-left');
			$(this).parent().nextAll('.music-lyric-panel').removeClass('music-lyric-left');
			$(this).parent().nextAll('.music-lyric-panel').attr('style', 'display: none;');
		}
	});
	//点击播放时的事件
	$('.music-play').click(function() {
		//声明歌曲时长
		var audio = $(this).parent().nextAll('.music-main')[0];
		//开始播放
		//console.log('开始播放~');
		if ($(this).attr('tag') == 'stop') {
			//打开歌词块
			if ($(this).parent().parent().hasClass('music-panel-close')); {
				$('.music-button-lyric').click();
			}

			$(this).html('&#xe70d;');
			audio.play();
			console.log('开始播放~');
			$(this).attr('tag', 'play');
		}
		//暂停播放
		else {
			$(this).html('&#xe6e1;');
			audio.pause();
			console.log('暂停播放~');
			$(this).attr('tag', 'stop');
		}
	});
	//终止播放
	$('.music-stop').click(function() {
		var audio = $(this).parent().nextAll('.music-main')[0];
		$(this).prevAll('.music-play').html('&#xe6e1;');
		$(this).prevAll('.music-play').attr('tag', 'stop');
		audio.load();
		console.log('播放终止~');
	});
	//播放时轴事件
	$('.music-main').bind('timeupdate', function() {
		//console.log($(this).prevAll('.music-progress-panel').("[time='" + $(this).prop('currentTime').toFixed(0) + "']"));
		//改进度条
		var time = ($(this).prop('currentTime') / $(this).prop('duration') * 100);
		$(this).prevAll('.music-progress-panel').find('.music-progress').attr('style', 'width:' + time + '%');
		//修改滚动歌词显示区域（平滑滚动）
		var at = $(this).prevAll('.music-lyric-panel').find("[time=" + $(this).prop('currentTime').toFixed(0) + "]");
		if (at.length != 0) {
			var at2 = $(this).prevAll('.music-lyric-panel').find('.music-lyric-main');
			//console.log(at);
			//console.log($(this).prop('currentTime'));
			//console.log(at2);
			if (at != at2) {
				at2.removeClass('music-lyric-main');
				at.addClass('music-lyric-main');
			}
			//$(this).prevAll('.music-lyric-panel')[0].scrollHeight
			var t = (at.prevAll().length * 45 - 70);
			//console.log(t);
			$(this).prevAll('.music-lyric-panel').animate({
				scrollTop: t
			}, 200);

		}
	});
	//跳进
	$('.music-progress-panel').click(function(e) {
		if (e.pageX < $(this).width()) {
			index = 0;
		}
		$(this).nextAll('.music-main').prop('currentTime', (((e.pageX - $(this).offset().left) / $(this).width()) * $(this).nextAll('.music-main').prop('duration')).toFixed(4));
		//快进修改

		var time = ($(this).nextAll('.music-main').prop('currentTime') / $(this).nextAll('.music-main').prop('duration') * 100);
		var t = (($(this).nextAll('.music-lyric-panel')[0].scrollHeight) * time / 90);
		$(this).nextAll('.music-lyric-panel').animate({
			scrollTop: t
		}, 200);

		console.log('wl');
	});
	//结束时滚回进度条且修改图标和歌词
	$('.music-main').bind('ended', function() {
		$(this).prevAll('.music-button-panel').find('.music-stop').click();
	});
	//$('.music-lyric-panel').animate({scrollTop:150},500);

});