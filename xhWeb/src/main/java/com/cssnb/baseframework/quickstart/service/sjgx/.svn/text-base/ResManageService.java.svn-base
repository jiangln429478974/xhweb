package com.cssnb.baseframework.quickstart.service.sjgx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.baseframework.quickstart.dao.sjgx.ResManageMapper;
import com.cssnb.baseframework.quickstart.entity.sjgx.ResOrderContent;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @类描述：数据共享管理
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.service.sjgx
 * @类名称：ResManageService
 * @创建人：wujiong
 * @创建时间：2015年8月4日上午9:35:56
 * @修改人：wujiong
 * @修改时间：2015年8月4日上午9:35:56
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright
 * @mail
 */
@Service
public class ResManageService {
	@Autowired
	private ResManageMapper resManageMapper;

	/**
	 * 
	 * @描述:查询列表
	 * @方法名: findInfoList
	 * @param jqgridPage
	 * @param param
	 * @return
	 * @返回类型 PageList<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日上午10:17:23
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日上午10:17:23
	 * @修改备注
	 * @since
	 * @throws
	 */
	public PageList<HashMap<String, Object>> findInfoList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resManageMapper.findInfoList(pageBounds, param);
	}

	/**
	 * 
	 * @描述:删除某天信息
	 * @方法名: deleteInfo
	 * @param id
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日上午10:18:05
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日上午10:18:05
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void deleteInfo(String id) {
		resManageMapper.deleteInfo(id);
	}

	/**
	 * @return
	 * 
	 * @描述:获得共享方式的列表
	 * @方法名: getShareMode
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午3:15:46
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午3:15:46
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getShareMode() {
		return resManageMapper.getShareMode();
	}

	/**
	 * 获得频率列表
	 * 
	 * @描述:
	 * @方法名: getFrequency
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午3:48:46
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午3:48:46
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getFrequency() {
		return resManageMapper.getFrequency();
	}

	/**
	 * 
	 * @描述:获得部门列表
	 * @方法名: getDepartment
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午4:36:44
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午4:36:44
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getDepartment() {
		return resManageMapper.getDepartment();
	}

	/**
	 * 
	 * @描述:得到共享申请的订单信息
	 * @方法名: getDetail
	 * @param id
	 * @return
	 * @返回类型 Map
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午5:06:20
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午5:06:20
	 * @修改备注
	 * @since
	 * @throws
	 */
	public Map<String, Object> getDetail(String id) {
		return resManageMapper.getDetail(id);
	}

	/**
	 * 
	 * @描述:得到共享申请订单内容信息
	 * @方法名: getDetailContent
	 * @param id
	 * @return
	 * @返回类型 List
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午5:06:59
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午5:06:59
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<ResOrderContent> getDetailContent(String id) {
		return resManageMapper.getDetailContent(id);
	}

	/**
	 * 
	 * @描述:获得资源列表
	 * @方法名: getResName
	 * @return
	 * @返回类型 List<Map<String,String>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午5:24:24
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午5:24:24
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<Map<String, String>> getResName() {
		return resManageMapper.getResName();
	}

	/**
	 * 
	 * @描述:添加订单
	 * @方法名: addOrder
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午9:42:10
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午9:42:10
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void addOrder(Map<String, Object> map) {
		resManageMapper.addOrder(map);
	}

	/**
	 * 
	 * @描述:添加订单内容信息
	 * @方法名: addOrder4Content
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午10:56:08
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午10:56:08
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void addOrder4Content(Map<String, Object> map) {
		resManageMapper.addOrder4Content(map);
	}

	/**
	 * 
	 * @描述:添加订单数据库信息
	 * @方法名: addOrder4DBInfo
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午10:56:52
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午10:56:52
	 * @修改备注
	 * @since
	 * @throws
	 */

	public void addOrder4DBInfo(Map<String, Object> map) {
		resManageMapper.addOrder4DBInfo(map);
	}

	/**
	 * 
	 * @描述: 订单状态编码表
	 * @方法名: getOrderStatus
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:29:40
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:29:40
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getOrderStatus() {
		return resManageMapper.getOrderStatus();
	}

	/**
	 * 
	 * @描述:订单申请列表
	 * @方法名: findOrderCheckList
	 * @param pageBounds
	 * @param param
	 * @return
	 * @返回类型 PageList<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:31:01
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:31:01
	 * @修改备注
	 * @since
	 * @throws
	 */
	public PageList<HashMap<String, Object>> findOrderCheckList(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return resManageMapper.findOrderCheckList(pageBounds, param);
	}

	/**
	 * 
	 * @描述:orderID查找详情
	 * @方法名: getOrderByOrderId
	 * @param orderID
	 * @return
	 * @返回类型 Map<String,Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午3:05:14
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午3:05:14
	 * @修改备注
	 * @since
	 * @throws
	 */
	public Map<String, Object> getOrderByOrderId(String orderID) {
		return resManageMapper.getOrderByOrderId(orderID);
	}

	/**
	 * 
	 * @描述:orderID查找订单内容
	 * @方法名: getOrderContentByOrderId
	 * @param orderID
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午4:24:08
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午4:24:08
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getOrderContentByOrderId(String orderID) {
		return resManageMapper.getOrderContentByOrderId(orderID);
	}

	/**
	 * 
	 * @描述:更新订单数据
	 * @方法名: updateOrder
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午4:43:20
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午4:43:20
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void updateOrder(Map<String, Object> map) {
		resManageMapper.updateOrder(map);
	}

	/**
	 * 
	 * @描述:删除订单表内容数据
	 * @方法名: updataOrder4Content
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午4:43:36
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午4:43:36
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void deleteOrder4Content(String orderID) {
		resManageMapper.deleteOrder4Content(orderID);
	}
	/**
	 * 
	 * @描述:更新订单状态
	 * @方法名: updateOrderStatus
	 * @param status
	 * @param noPassReason
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月16日下午6:22:06
	 * @修改人 wujiong
	 * @修改时间 2015年8月16日下午6:22:06
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void updateOrderStatus(String status,String noPassReason,String orderId){
		resManageMapper.updateOrderStatus(status, noPassReason,orderId);
	}
	
	/**
	 * 
	 * @描述:共享数据统计
	 * @方法名: getShareCount
	 * @param id
	 * @return
	 * @返回类型 Map<String,Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月19日下午2:15:16
	 * @修改人 wujiong
	 * @修改时间 2015年8月19日下午2:15:16
	 * @修改备注
	 * @since
	 * @throws
	 */
	public Map<String, Object> getShareCount(@Param("status") String id){
		return resManageMapper.getShareCount(id);
	}

	public void addShareTask(Map<String, Object> param) {
		// TODO Auto-generated method stub
		resManageMapper.addShareTask(param);
	}
	
}
