package com.cssnb.baseframework.quickstart.dao.sjgx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @类描述：数据共享接口层
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.dao.sjgx
 * @类名称：ResMapper
 * @创建人：wujiong
 * @创建时间：2015年8月3日下午5:38:11
 * @修改人：wujiong
 * @修改时间：2015年8月3日下午5:38:11
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright 
 * @mail
 */
public interface ResMapper {
	
	public PageList<HashMap<String, Object>> findResFieldList(
			PageBounds pageBounds, Map<String, Object> param);
	
	// 通用接口
	public PageList<HashMap<String, Object>> findInfoList(
			PageBounds pageBounds, Map<String, Object> param);

	public HashMap<String, Object> getDetail(Map<String, Object> param);

	public HashMap<String, Object> getTableInfoById(@Param("id") String id);

	public List<HashMap<String, Object>> getHeadListById(@Param("id") String id);

	public List<HashMap<String, String>> getColsById(@Param("id") String id);

	public List<HashMap<String, String>> getPKById(@Param("id") String id);

	public List<HashMap<String, String>> getColsAndShowNameByIdForDetail(
			@Param("id") String id);
	
	// 增加临时的非通用接口
	// 企业登记信息
	@Deprecated
	public PageList<HashMap<String, Object>> findQYDJXXList(
			PageBounds pageBounds, Map<String, Object> param);

	@Deprecated
	public HashMap<String, Object> getQYDJXXDetail(@Param("nbxh") String nbxh);

	// 纳税人信息
	@Deprecated
	public PageList<HashMap<String, Object>> findNSRXXList(
			PageBounds pageBounds, Map<String, Object> param);

	@Deprecated
	public HashMap<String, Object> getNSRXXDetail(@Param("NSRSBH") String nsrsbh);

	// 案件信息
	@Deprecated
	public PageList<HashMap<String, Object>> findAJXXList(
			PageBounds pageBounds, Map<String, Object> param);

	@Deprecated
	public HashMap<String, Object> getAJXXDetail(@Param("nbxh") String nbxh);

	// 年检信息
	@Deprecated
	public PageList<HashMap<String, Object>> findNJXXList(
			PageBounds pageBounds, Map<String, Object> param);

	@Deprecated
	public HashMap<String, Object> getNJXXDetail(@Param("nbxh") String nbxh,
			@Param("ND") String nd);

	// 企业投资方信息
	@Deprecated
	public PageList<HashMap<String, Object>> findQYTZFXXList(
			PageBounds pageBounds, Map<String, Object> param);

	@Deprecated
	public HashMap<String, Object> getQYTZFXXDetail(@Param("nbxh") String nbxh,
			@Param("sbxh") String sbxh);
}
