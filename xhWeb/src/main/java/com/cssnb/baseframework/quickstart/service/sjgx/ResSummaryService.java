package com.cssnb.baseframework.quickstart.service.sjgx;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.quickstart.dao.sjgx.ResSummaryMapper;
import com.cssnb.baseframework.quickstart.entity.sjgx.ResSummary;

@Service
public class ResSummaryService {
	@Autowired
	private ResSummaryMapper zyhzbMapper;
	@Cacheable("simpleCache")
	public List<ResSummary> getAllData(){
		return zyhzbMapper.getAllData();
	}
	
}
