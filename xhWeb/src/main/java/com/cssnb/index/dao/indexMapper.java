package com.cssnb.index.dao;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface indexMapper {

	/**
	 * hdd
	 * 显示用户列表
	 * @return
	 */
	 public List initMenuList(Map map);//初始化父类功能菜单列表
	 public List initLowerMenuList(Map map);//初始化子类功能菜单列表
	 public List getMenuList(Map map);//根据不同参数  获取功能菜单列表
	 public PageList<HashMap<String, Object>> getInit(PageBounds pageBounds,//功能菜单页面  初始化父类数据(jqgrid插件获取)
				Map<String, Object> param);
	 public PageList<HashMap<String, Object>> getLowerMenuList(PageBounds pageBounds,//功能菜单页面  初始化子类数据(jqgrid插件获取)
			 Map<String, Object> param);
	 
	 public Integer deleteMenu(Map map);//删除功能菜单
	 public void deleteLowerMenu(Map map);//根据父类功能菜单名称 删除子类功能菜单
	 public Integer updateMenu(Map map);//根据主键id更新功能菜单
	 public Integer insertMenu(Map map);//新增功能菜单
	 public String  getXM(Map map);
	public List<Map<String, Object>> getMenuByUserId(String userId);//根据用户获取功能菜单
}
