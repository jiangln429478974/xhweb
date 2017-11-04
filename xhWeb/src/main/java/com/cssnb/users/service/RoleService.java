package com.cssnb.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.users.dao.RoleMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @author wangmin
 *
 */
@Service
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	 public List<HashMap<String, Object>> getRoleList(Map map){
		 return roleMapper.getRoleList(map);
	 }
	 public PageList<HashMap<String, Object>> getInit(JqgridPage jqgridPage,
				Map<String, Object> param) {
			PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
			return roleMapper.getInit(pageBounds, param);
		}
	 
	 public void deleteRole(Map map){
		  roleMapper.deleteRole(map);
	 }
	 
	 public void updateRole(Map map){
		 roleMapper.updateRole(map);
	 }
	 public void insertRole(Map map){
		 roleMapper.insertRole(map);
	 }
	 
	// 角色功能菜单模块 
	 public List<HashMap<String, Object>> getGncdList(Map map){
		 return roleMapper.getGncdList(map);
	 }
	 public void insertRoleGncd(Map map){
		 roleMapper.insertRoleGncd(map);
	 }
	 public void deleteRoleGncd(Map map){
		  roleMapper.deleteRoleGncd(map);
	 }
	 
	//角色数据项授权模块
	public List<HashMap<String,Object>> getDataItemList(Map map){
		return roleMapper.getDataItemList(map);
	}
	public List<HashMap<String,Object>> getDataItemSecList(Map map){
		return roleMapper.getDataItemSecList(map);
	}
	public List<HashMap<String,Object>> getXxnr(Map map){
		return roleMapper.getXxnr(map);
	}
	public void insertSjx(Map map){
		roleMapper.insertSjx(map);
	}
	public List<HashMap<String,Object>> getOwnerSjx(Map map){
		return roleMapper.getOwnerSjx(map);
	}
	public void deleteSjx(Map map){
		roleMapper.deleteSjx(map);
	}
	public int getYhjsb(Map map){
		 return  roleMapper.getYhjsb(map);
	}
}
