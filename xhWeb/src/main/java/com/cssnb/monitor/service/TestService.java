package com.cssnb.monitor.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.org.rapid_framework.util.page.PageList;

import com.cssnb.monitor.dao.Test;
import com.cssnb.monitor.util.SystemServiceLog;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
@Service
public class TestService {
     @Resource
     private Test test;
     public void insert(Map map){
    	 
    	 test.insert(map);
     }
     public com.github.miemiedev.mybatis.paginator.domain.PageList<HashMap<String, Object>> getList(PageBounds pageBounds,
				Map<String, Object> param){
    	 return test.getList(pageBounds, param);
     }
}
