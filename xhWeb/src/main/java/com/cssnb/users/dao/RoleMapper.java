package com.cssnb.users.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface RoleMapper {

	/**
	 * hdd
	 * 显示用户列表
	 * @return
	 */
	// 角色管理模块
	 public List<HashMap<String, Object>> getRoleList(Map map);//初始化角色列表
	 public PageList<HashMap<String, Object>> getInit(PageBounds pageBounds,
				Map<String, Object> param);//角色页面 列表数据(jqgrid插件获取)
	 
	 public void deleteRole(Map map);//根据角色id删除角色
	 public void updateRole(Map map);//根据角色id更新
	 public void insertRole(Map map);//插入角色
	// 角色功能菜单模块 
	public List<HashMap<String, Object>> getGncdList(Map map);//根据角色id或其他属性获取功能菜单列表
	public void insertRoleGncd(Map map);//给角色进行功能菜单授权
	public void deleteRoleGncd(Map map);//根据角色id删除角色的功能菜单权限
	//角色数据项授权模块
	public List<HashMap<String,Object>> getDataItemList(Map map);//根据目录 去重获取目录所属部门 
	public List<HashMap<String,Object>> getDataItemSecList(Map map);//根据部门id  获取目录名称等
	public List<HashMap<String,Object>> getXxnr(Map map);//根据信息事项主键id获取信息内容
	public void insertSjx(Map map);//给角色添加数据项
	public List<HashMap<String,Object>> getOwnerSjx(Map map);//角色已经拥有的数据项
	public void deleteSjx(Map map);//根据信息事项id清空 某角色某信息事项下的数据项内容 
	public int getYhjsb(Map map);//删除角色前先查查询有没有用户在使用
}
