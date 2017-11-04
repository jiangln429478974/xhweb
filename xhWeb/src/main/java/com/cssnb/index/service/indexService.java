package com.cssnb.index.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.users.dao.DeptMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

  
@Service
public class indexService {

	@Autowired
	private DeptMapper  deptMapper;
	
	 public List<HashMap<String, Object>> getDeptList(Map map){
		 return deptMapper.getDeptList(map);
	 }
	 public List<HashMap<String, Object>> getSsqyList(Map map){
		 return deptMapper.getSsqyList(map);
	 }
	 
	 public PageList<HashMap<String, Object>> getInit(JqgridPage jqgridPage,
				Map<String, Object> param) {
			PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
			return deptMapper.getInit(pageBounds, param);
		}
	 
	 public void deleteDept(Map map){
		  deptMapper.deleteDept(map);
	 }
	 
	 public void updateDept(Map map){
		 deptMapper.updateDept(map);
	 }
	 public void insertDept(Map map){
		 deptMapper.insertDept(map);
	 }
	 public int getYhb(Map map){
			 return  deptMapper.getYhb(map);
	 }
	 
	 public String  getBmpx(Map map){
		 return  deptMapper.getBmpx(map);
 }
	 
}
