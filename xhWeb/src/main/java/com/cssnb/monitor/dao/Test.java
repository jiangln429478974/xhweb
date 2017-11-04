package com.cssnb.monitor.dao;

import java.util.HashMap;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface Test {
      public void insert(Map map);
      
      public PageList<HashMap<String, Object>> getList(PageBounds pageBounds,
				Map<String, Object> param);
}
