package com.cssnb.users.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface DeptMapper {

	/**
	 * hdd
	 * 显示用户列表
	 * @return
	 */
	 public List<HashMap<String, Object>> getDeptList(Map map);//获取部门列表
	 public List<HashMap<String, Object>> getSsqyList(Map map);//获取区域列表
	 
	 public PageList<HashMap<String, Object>> getInit(PageBounds pageBounds,//角色页面  初始化数据(jqgrid插件获取)
				Map<String, Object> param);
	 
	 public void deleteDept(Map map);//根据不同属性删除部门
	 public void updateDept(Map map);//根据主见id更新
	 public void insertDept(Map map);//新增部门
	 public int getYhb(Map map);//删除部门前先查查询有没有用户在使用
	 public String getBmpx(Map map);
	 
}
