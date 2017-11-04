package com.cssnb.baseframework.quickstart.service.sjgx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.baseframework.quickstart.dao.sjgx.ResMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Service
public class ResService {
	@Autowired
	private ResMapper resMapper;

	/**
	 * 
	 * @描述: 获得变的列信息
	 * @方法名: findResFieldList
	 * @param jqgridPage
	 * @param param
	 * @return
	 * @返回类型 PageList<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月16日下午8:31:41
	 * @修改人 wujiong
	 * @修改时间 2015年8月16日下午8:31:41
	 * @修改备注
	 * @since
	 * @throws
	 */
	public PageList<HashMap<String, Object>> findResFieldList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findResFieldList(pageBounds, param);
	}

	// 通用接口
	public PageList<HashMap<String, Object>> findInfoList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findInfoList(pageBounds, param);
	}

	public HashMap<String, Object> getDetail(Map<String, Object> param) {
		return resMapper.getDetail(param);
	}

	public HashMap<String, Object> getTableInfoById(String id) {
		return resMapper.getTableInfoById(id);
	}

	public List<HashMap<String, Object>> getHeadListById(String id) {
		return resMapper.getHeadListById(id);
	}

	public List<HashMap<String, String>> getColsById(String id) {
		return resMapper.getColsById(id);
	};

	public List<HashMap<String, String>> getColsAndShowNameByIdForDetail(
			String id) {
		return resMapper.getColsAndShowNameByIdForDetail(id);
	};

	public List<HashMap<String, String>> getPKById(String id) {
		return resMapper.getPKById(id);
	}

	// 增加临时的非通用接口
	// 企业登记信息
	@Deprecated
	public PageList<HashMap<String, Object>> findQYDJXXList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findQYDJXXList(pageBounds, param);
	}

	@Deprecated
	public HashMap<String, Object> getQYDJXXDetail(String nbxh) {
		return resMapper.getQYDJXXDetail(nbxh);
	}

	// 纳税人信息
	@Deprecated
	public PageList<HashMap<String, Object>> findNSRXXList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findNSRXXList(pageBounds, param);
	}

	@Deprecated
	public HashMap<String, Object> getNSRXXDetail(String nsrsbh) {
		return resMapper.getNSRXXDetail(nsrsbh);
	}

	// 案件信息
	@Deprecated
	public PageList<HashMap<String, Object>> findAJXXList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		return null;
	}

	@Deprecated
	public HashMap<String, Object> getAJXXDetail(String nbxh) {
		return null;
	}

	// 年检信息
	@Deprecated
	public PageList<HashMap<String, Object>> findNJXXList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findNJXXList(pageBounds, param);
	}

	@Deprecated
	public HashMap<String, Object> getNJXXDetail(String nbxh, String nd) {
		return resMapper.getNJXXDetail(nbxh, nd);
	}

	// 企业投资方信息
	@Deprecated
	public PageList<HashMap<String, Object>> findQYTZFXXList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resMapper.findQYTZFXXList(pageBounds, param);
	}

	@Deprecated
	public HashMap<String, Object> getQYTZFXXDetail(String nbxh, String sbxh) {
		return resMapper.getQYTZFXXDetail(nbxh, sbxh);
	}

}
