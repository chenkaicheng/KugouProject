package com.kugou.util;


public class StringUtil {


	/** 
	* @author:Ckc 
	* @project:KugouProject
	* @Title: isEmpty 
	* @Package com.kugou.util 
	* @Description: (是否为空) 
	* @return boolean    返回类型 
	* @date 2016年5月26日 下午8:48:18 
	* @throws 
	*/
	public static boolean isEmpty(String str){
		if(str==null||"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}

	/** 
	* @author:Ckc 
	* @project:KugouProject
	* @Title: isNotEmpty 
	* @Package com.kugou.util 
	* @Description: (是否不是空) 
	* @return boolean    返回类型 
	* @date 2016年5月26日 下午8:48:37 
	* @throws 
	*/
	public static boolean isNotEmpty(String str){
		if((str!=null)&&!"".equals(str.trim())){
			return true;
		}else{
			return false;
		}
	}
	

	/** 
	* @author:Ckc 
	* @project:KugouProject
	* @Title: formatLike 
	* @Package com.kugou.util 
	* @Description: (格式化模糊查询) 
	* @return String    返回类型 
	* @date 2016年5月26日 下午8:48:52 
	* @throws 
	*/
	public static String formatLike(String str){
		if(isNotEmpty(str)){
			return "%"+str+"%";
		}else{
			return null;
		}
	}
}
