package com.cssnb.baseframework.quickstart.service.demo1;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.quickstart.dao.demo1.Demo1Dao;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * @author HuYing
 *
 */
/**
 * @author HuYing
 *
 */
@Service
public class Demo1Service {
	@Autowired
	private Demo1Dao demo1Dao;
	@Cacheable("simpleCache")
	public List<Map<String,Object>> getAllData(){
		return demo1Dao.getAllData();
	}
	
	@CacheEvict(value="simpleCache",allEntries=true)
	public void deleteData(int id){
		demo1Dao.deleteData(id);
	}
	
	@Cacheable(value="simpleCache",key="#id")
	public Map<String,Object> getDataById(int id){
		return demo1Dao.getDataById(id);
	}
	
	/**
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public PageList<Map<String,Object>> findDataByPaging(int page,int pageSize){
		String sortString = "id.asc";//如果你想排序的话逗号分隔可以排序多列
		PageBounds pageBounds = new PageBounds(page, pageSize ,Order.formString(sortString));
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("id",2);
        paramMap.put("name","test2");
		List list = demo1Dao.findDataByPaging(pageBounds,paramMap);
		//获得结果集条总数
		PageList<Map<String,Object>> pageList = (PageList)list;
		return pageList;
	}
}
