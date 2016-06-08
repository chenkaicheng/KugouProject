package com.kugou.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * datatables实体类，用于传递参数
 * 
 * @author yangtao
 *
 */
public class DataTables
{
	private Integer iTotalRecords;// 数据库中的结果总行数
	private Integer iTotalDisplayRecords;// 搜索过滤后的总行数
	private Integer start;// 起始行数
	private String sSearch;// 搜索的字符串
	private Integer length;// 页面大小
	private String sEcho;// 不知道干嘛的，留着就行
	private Integer iSortCol_0;// 需要排序的列
	private String sSortDir_0;// 排序方式
	private List<Map<String, String>> aaData;// 结果集

	/**
	 * 构造方法
	 * 
	 * @param request
	 */
	public DataTables(HttpServletRequest request)
	{
		this.start = request.getParameter("start") != null ? Integer.parseInt(request.getParameter("start")) : 0;
		String search = request.getParameter("search[value]");
		this.sSearch = search.length() > 0 ? search : null;
		this.length = request.getParameter("length") != null ? Integer.parseInt(request.getParameter("length")) : 0;
		this.sEcho = request.getParameter("sEcho");
		this.iSortCol_0 = request.getParameter("order[0][column]") != null
				? Integer.parseInt(request.getParameter("order[0][column]")) : 0;
		this.sSortDir_0 = request.getParameter("order[0][dir]") != null ? request.getParameter("order[0][dir]") : "asc";
	}

	/**
	 * 构造器
	 * @param request
	 * @return
	 */
	public static DataTables createDataTables(HttpServletRequest request)
	{
		return new DataTables(request);
	}

	/**
	 * @return the iDisplayStart
	 */
	public Integer getStart()
	{
		return start;
	}

	/**
	 * @param iDisplayStart
	 *            the iDisplayStart to set
	 */
	public void setStart(Integer start)
	{
		this.start = start;
	}

	/**
	 * @return the searchParameter
	 */
	public String getSSearch()
	{
		return sSearch;
	}

	/**
	 * @param searchParameter
	 *            the searchParameter to set
	 */
	public void setSSearch(String searchParameter)
	{
		this.sSearch = searchParameter;
	}

	/**
	 * @return the pageDisplayLength
	 */
	public Integer getLength()
	{
		return length;
	}

	/**
	 * @param pageDisplayLength
	 *            the pageDisplayLength to set
	 */
	public void setLength(Integer length)
	{
		this.length = length;
	}

	/**
	 * @return the sEcho
	 */
	public String getsEcho()
	{
		return sEcho;
	}

	/**
	 * @param sEcho
	 *            the sEcho to set
	 */
	public void setsEcho(String sEcho)
	{
		this.sEcho = sEcho;
	}

	/**
	 * @return the iSortCol_0
	 */
	public Integer getiSortCol_0()
	{
		return iSortCol_0;
	}

	/**
	 * @param iSortCol_0
	 *            the iSortCol_0 to set
	 */
	public void setiSortCol_0(Integer iSortCol_0)
	{
		this.iSortCol_0 = iSortCol_0;
	}

	/**
	 * @return the sSortDir_0
	 */
	public String getsSortDir_0()
	{
		return sSortDir_0;
	}

	/**
	 * @param sSortDir_0
	 *            the sSortDir_0 to set
	 */
	public void setsSortDir_0(String sSortDir_0)
	{
		this.sSortDir_0 = sSortDir_0;
	}

	/**
	 * @return the iTotalRecords
	 */
	public Integer getiTotalRecords()
	{
		return iTotalRecords;
	}

	/**
	 * @param iTotalRecords the iTotalRecords to set
	 */
	public void setiTotalRecords(Integer iTotalRecords)
	{
		this.iTotalRecords = iTotalRecords;
	}

	/**
	 * @return the iTotalDisplayRecords
	 */
	public Integer getiTotalDisplayRecords()
	{
		return iTotalDisplayRecords;
	}

	/**
	 * @param iTotalDisplayRecords the iTotalDisplayRecords to set
	 */
	public void setiTotalDisplayRecords(Integer iTotalDisplayRecords)
	{
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	public List<Map<String, String>> getAaData()
	{
		return aaData;
	}

	public void setAaData(List<Map<String, String>> aaData)
	{
		this.aaData = aaData;
	}
}
