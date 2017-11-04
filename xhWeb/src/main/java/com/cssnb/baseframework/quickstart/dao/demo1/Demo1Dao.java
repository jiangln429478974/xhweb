package com.cssnb.baseframework.quickstart.dao.demo1;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

public interface Demo1Dao {
	public List<Map<String,Object>> getAllData();

	public void deleteData(@Param("id")int id);

	public Map<String, Object> getDataById(@Param("id")int id);

	public List findDataByPaging(PageBounds pageBounds,Map<String,Object> paramMap);
}
