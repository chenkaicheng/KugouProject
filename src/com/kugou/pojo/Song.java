package com.kugou.pojo;

import java.io.Serializable;

public class Song implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int SongID;
	private String SongName;
	private String SongSinger;
	private String SongImg;
	private String SongWords;
	private String SongURL;
	private String SongLRC;
	private Area AreaID;

	public int getSongID()
	{
		return SongID;
	}

	public void setSongID(int songID)
	{
		SongID = songID;
	}

	public String getSongName()
	{
		return SongName;
	}

	public void setSongName(String songName)
	{
		SongName = songName;
	}

	public String getSongSinger()
	{
		return SongSinger;
	}

	public void setSongSinger(String songSinger)
	{
		SongSinger = songSinger;
	}

	public String getSongImg()
	{
		return SongImg;
	}

	public void setSongImg(String songImg)
	{
		SongImg = songImg;
	}

	public String getSongWords()
	{
		return SongWords;
	}

	public void setSongWords(String songWords)
	{
		SongWords = songWords;
	}

	public String getSongURL()
	{
		return SongURL;
	}

	public void setSongURL(String songURL)
	{
		SongURL = songURL;
	}

	public Area getAreaID()
	{
		return AreaID;
	}

	public void setAreaID(Area areaID)
	{
		AreaID = areaID;
	}

	public String getSongLRC()
	{
		return SongLRC;
	}

	public void setSongLRC(String songLRC)
	{
		SongLRC = songLRC;
	}

	public Song()
	{
		super();
	}

	public Song(int songID, String songName, String songSinger, String songImg, String songWords, String songURL,
			String songLRC, Area areaID)
	{
		super();
		SongID = songID;
		SongName = songName;
		SongSinger = songSinger;
		SongImg = songImg;
		SongWords = songWords;
		SongURL = songURL;
		SongLRC = songLRC;
		AreaID = areaID;
	}

	@Override
	public String toString()
	{
		return "Song [SongID=" + SongID + ", SongName=" + SongName + ", SongSinger=" + SongSinger + ", SongImg="
				+ SongImg + ", SongWords=" + SongWords + ", SongURL=" + SongURL + ", SongLRC=" + SongLRC + ", AreaID="
				+ AreaID + "]";
	}

}
