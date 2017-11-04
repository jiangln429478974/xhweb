package com.cssnb.baseframework.quickstart.dao.sjgx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cssnb.baseframework.quickstart.entity.sjgx.ResOrderContent;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @类描述：数据共享管理
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.dao.sjgx
 * @类名称：ResManageMapper
 * @创建人：wujiong
 * @创建时间：2015年8月4日上午9:36:22
 * @修改人：wujiong
 * @修改时间：2015年8月4日上午9:36:22
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright
 * @mail
 */
public interface ResManageMapper {
	/**
	 * 
	 * @描述:查询列表
	 * @方法名: findInfoList
	 * @param pageBounds
	 * @param param
	 * @return
	 * @返回类型 PageList<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日上午10:15:08
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日上午10:15:08
	 * @修改备注
	 * @since
	 * @throws
	 */
	public PageList<HashMap<String, Object>> findInfoList(
			PageBounds pageBounds, Map<String, Object> param);

	/**
	 * 
	 * @描述:删除某条信息
	 * @方法名: deleteInfo
	 * @param id
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日上午10:16:21
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日上午10:16:21
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void deleteInfo(String id);

	/**
	 * 
	 * @描述:获得共享方式的列表
	 * @方法名: getShareMode
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午3:16:14
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午3:16:14
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getShareMode();

	/**
	 * 获得频率列表
	 * 
	 * @描述:
	 * @方法名: getFrequency
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午3:47:54
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午3:47:54
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getFrequency();

	/**
	 * 
	 * @描述:获得部门列表
	 * @方法名: getDepartment
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月5日下午4:36:19
	 * @修改人 wujiong
	 * @修改时间 2015年8月5日下午4:36:19
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getDepartment();

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
	public Map<String, Object> getDetail(String id);

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
	public List<ResOrderContent> getDetailContent(String id);

	/**
	 * 
	 * @描述:获得资源类表
	 * @方法名: getResName
	 * @return
	 * @返回类型 List<Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午5:23:22
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午5:23:22
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<Map<String, String>> getResName();

	/**
	 * 
	 * @描述:添加订单
	 * @方法名: addOrder
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午9:42:41
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午9:42:41
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void addOrder(Map<String, Object> map);

	/**
	 * 
	 * @描述:添加订单内容
	 * @方法名: addOrder4Content
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午10:54:47
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午10:54:47
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void addOrder4Content(Map<String, Object> map);

	/**
	 * 
	 * @描述:添加订单数据库信息
	 * @方法名: addOrder4DBInfo
	 * @param map
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月7日上午10:55:24
	 * @修改人 wujiong
	 * @修改时间 2015年8月7日上午10:55:24
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void addOrder4DBInfo(Map<String, Object> map);

	/**
	 * 
	 * @描述: 订单状态编码表
	 * @方法名: getOrderStatus
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:27:53
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:27:53
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getOrderStatus();

	/**
	 * 
	 * @描述: 订单申请列表
	 * @方法名: findOrderCheckList
	 * @param pageBounds
	 * @param param
	 * @return
	 * @返回类型 PageList<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:28:39
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:28:39
	 * @修改备注
	 * @since
	 * @throws
	 */
	public PageList<HashMap<String, Object>> findOrderCheckList(
			PageBounds pageBounds, Map<String, Object> param);

	/**
	 * 
	 * @描述:orderID查找详情
	 * @方法名: getOrderByOrderId
	 * @param orderId
	 * @return
	 * @返回类型 Map<String,Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午3:04:03
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午3:04:03
	 * @修改备注
	 * @since
	 * @throws
	 */
	public Map<String, Object> getOrderByOrderId(String orderID);

	/**
	 * 
	 * @描述:orderID查找订单表内容
	 * @方法名: getOrderContentByOrderId
	 * @param orderID
	 * @return
	 * @返回类型 List<String>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午4:23:15
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午4:23:15
	 * @修改备注
	 * @since
	 * @throws
	 */
	public List<String> getOrderContentByOrderId(String orderID);

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
	public void updateOrder(Map<String, Object> map);

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
	public void deleteOrder4Content(String orderId);

	/**
	 * 
	 * @描述:更新订单状态
	 * @方法名: updateOrderStatus
	 * @param status
	 * @param noPassReason
	 * @返回类型 void
	 * @创建人 wujiong
	 * @创建时间 2015年8月16日下午6:21:39
	 * @修改人 wujiong
	 * @修改时间 2015年8月16日下午6:21:39
	 * @修改备注
	 * @since
	 * @throws
	 */
	public void updateOrderStatus(@Param("status") String status,
			@Param("noPassReason") String noPassReason,
			@Param("orderId") String orderId);
	/**
	 * 
	 * @描述:共享数据统计
	 * @方法名: getShareCount
	 * @param id
	 * @return
	 * @返回类型 Map<String,Object>
	 * @创建人 wujiong
	 * @创建时间 2015年8月19日下午2:14:42
	 * @修改人 wujiong
	 * @修改时间 2015年8月19日下午2:14:42
	 * @修改备注
	 * @since
	 * @throws
	 */
	public Map<String, Object> getShareCount(@Param("id") String id);

	public void addShareTask(Map<String, Object> param);
}
