package com.cssnb.baseframework.quickstart.web.sjgx;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.alibaba.fastjson.JSONArray;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.service.sjgx.ResService;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @类描述：数据共享Controller
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.web.sjgx
 * @类名称：ResController
 * @创建人：wujiong
 * @创建时间：2015年8月3日下午5:25:18
 * @修改人：wujiong
 * @修改时间：2015年8月3日下午5:25:18
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright 
 * @mail
 */
@Controller
@RequestMapping("/sjgx")
public class ResController {
	
	@Autowired
	private ResService resService;

	
	@RequestMapping("/res/{resId}/resfieldlist")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> findResFieldList(
			@PathVariable String resId, JqgridPage jqgridPage,
			WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		param.put("resId", resId);
		PageList<HashMap<String, Object>> pagelist = resService.findResFieldList(
				jqgridPage, param);
		return new JqgridResponse<>(pagelist);
	}
	
	/**
	 * 
	 * @描述:数据共享跳转重定向
	 * @方法名: showList
	 * @param resId 资源ID
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:26:47
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:26:47
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/res/{resId}/datalist/index")
	public String showList(@PathVariable String resId, Model model) {
		model.addAttribute("resId", resId);
		Map<String, Object> tableInfo = resService.getTableInfoById(resId);
		model.addAttribute("table_name_cn", tableInfo.get("RESOURCE_NAME_CN"));
		return "sjgx/sjgx_list";
	}
	
	/**
	 * 
	 * @描述:数据共享详情
	 * @方法名: showDetail
	 * @param resId 资源ID
	 * @param pkey 主键
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:28:15
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:28:15
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/res/{resId}/datadetail/{pkey}")
	public String showDetail(@PathVariable("resId") String resId,
			@PathVariable("pkey") String pkey, Model model) {

		HashMap<String, Object> param = new HashMap<>();
		List<HashMap<String, String>> cols = resService
				.getColsAndShowNameByIdForDetail(resId);
		Map<String, Object> tableInfo = resService.getTableInfoById(resId);
		List<HashMap<String, String>> pks = resService.getPKById(resId);
		String tableName = tableInfo.get("RESOURCE_NAME").toString();
		String colStr = ListToString(cols);
		param.put("colStr", colStr);
		param.put("tableName", tableName);
		param.put("pk", pkey);
		param.put("pkcol", pks.get(0).get("RES_NAME"));

		Map<String, Object> detail = resService.getDetail(param);
		List<Map<String, String>> resultDetail = new ArrayList<Map<String, String>>();
		for (Map<String, String> colMap : cols) {
			String resName = colMap.get("RES_NAME");
			String showContent = colMap.get("SHOW_CONTENT");
			String res = detail.get(resName) == null ? "" : (String) detail
					.get(resName);
			Map<String, String> map = new HashMap<String, String>();
			map.put("showContent", showContent);
			map.put("value", res);
			resultDetail.add(map);
		}
		model.addAttribute("details", JSONArray.toJSON(resultDetail));
		model.addAttribute("resNameCn", tableInfo
				.get("RESOURCE_NAME_CN").toString());
		return "sjgx/sjgx_detail_dialog";
	}

	/**
	 * 
	 * @描述:数据共享列表查询
	 * @方法名: findDataByPaing
	 * @param resId 资源ID
	 * @param jqgridPage
	 * @param request
	 * @return
	 * @返回类型 JqgridResponse<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:29:01
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:29:01
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/res/{resId}/datalist")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> findDataByPaing(
			@PathVariable String resId, JqgridPage jqgridPage,
			WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		List<HashMap<String, String>> cols = resService.getColsById(resId);
		Map<String, Object> tableInfo = resService.getTableInfoById(resId);
		String tableName = tableInfo.get("RESOURCE_NAME").toString();
		String colStr = ListToString(cols);
		param.put("colStr", colStr);
		param.put("tableName", tableName);
		PageList<HashMap<String, Object>> pagelist = resService.findInfoList(
				jqgridPage, param);
		return new JqgridResponse<>(pagelist);
	}

	/**
	 * 
	 * @描述:资源共享列表表头查询
	 * @方法名: getHead
	 * @param resId 资源ID
	 * @param jqgridPage
	 * @param request
	 * @return
	 * @返回类型 Map<String,Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:29:38
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:29:38
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/res/{resId}/datahead")
	@ResponseBody
	public Map<String, Object> getHead(@PathVariable String resId,
			JqgridPage jqgridPage, WebRequest request) {
		List<HashMap<String, Object>> headList = resService
				.getHeadListById(resId);
		Map<String, Object> resultMap = new HashMap<>();
		List<String> rowHeadList = new ArrayList<>();
		List<Map<String, Object>> colModleMap = new ArrayList<>();
		// 先考虑单个主键。。
		String PKName = "";
		for (HashMap<String, Object> mheadMap : headList) {
			rowHeadList.add(mheadMap.get("SHOW_CONTENT").toString());
			Map<String, Object> mMap = new HashMap<>();
			mMap.put("name", mheadMap.get("RES_NAME"));
			mMap.put("index", mheadMap.get("RES_NAME"));
			// 都禁止排序
			mMap.put("sortable", false);
			if ("1".equals(mheadMap.get("IS_PK").toString())) {
				mMap.put("hidden", true);
				PKName = mheadMap.get("RES_NAME").toString();
			}
			colModleMap.add(mMap);
		}
		rowHeadList.add("操作");
		resultMap.put("PKName", PKName);
		resultMap.put("rowHead", rowHeadList);
		resultMap.put("rowsM", colModleMap);
		return resultMap;
	}

	public static String ListToString(List<HashMap<String, String>> stringList) {
		if (stringList == null) {
			return null;
		}
		StringBuilder result = new StringBuilder();
		boolean flag = false;
		for (HashMap<String, String> string : stringList) {
			if (flag) {
				result.append(",");
			} else {
				flag = true;
			}
			result.append(string.get("RES_NAME"));
		}
		return result.toString();
	}
}
