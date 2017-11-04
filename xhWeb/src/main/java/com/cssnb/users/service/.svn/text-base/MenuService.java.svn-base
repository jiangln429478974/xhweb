package com.cssnb.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.users.dao.MenuMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @author hdd
 *
 */
@Service
public class MenuService {

	@Autowired
	private MenuMapper  menuMapper;
	
	 public List getMenuList(Map map){
		 return menuMapper.getMenuList(map);
	 }
	 public List initMenuList(Map map){
		 return menuMapper.initMenuList(map);
	 }
	 public List initLowerMenuList(Map map){
		 return menuMapper.initLowerMenuList(map);
	 }
	 public PageList<HashMap<String, Object>> getInit(JqgridPage jqgridPage,
				Map<String, Object> param) {
			PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
			return menuMapper.getInit(pageBounds, param);
		}
	 public PageList<HashMap<String, Object>> getLowerMenuList(JqgridPage jqgridPage,
			 Map<String, Object> param) {
		 PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		 return menuMapper.getLowerMenuList(pageBounds, param);
	 }
	 
	 public Integer deleteMenu(Map map){
		  return menuMapper.deleteMenu(map);
	 }
	 public void deleteLowerMenu(Map map){
		 menuMapper.deleteLowerMenu(map);
	 }
	 
	 public Integer updateMenu(Map map){
		 return menuMapper.updateMenu(map);
	 }
	 public Integer insertMenu(Map map){
		 return menuMapper.insertMenu(map);
	 }
	 @Cacheable("simpleCache")//Cache是发生在cache1上的
	public List<Map<String, Object>> getMenuByUserId(String userId) {
		return menuMapper.getMenuByUserId(userId);
	}
	 public String  getXM(Map map){
		 return menuMapper.getXM(map);
	 }
}
