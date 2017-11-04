package com.cssnb.initpage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.initpage.dao.InitpageMapper;

@Service
public class InitpageService {
	
	@Autowired
	public InitpageMapper initpageMapper;
	
	public String getBMID(String yhm){
		return this.initpageMapper.getBMID(yhm);
	}
	
	public String getYHID(String yhm){
		return this.initpageMapper.getYHID(yhm);
	}
	
	public List<HashMap<String, Object>> checkItem(String YHID){
		return this.initpageMapper.checkItem(YHID);
	}
	
	public String getZXShareCount(Map param){
		return this.initpageMapper.getZXShareCount(param);
	}
	
	public String getShareCount(String BMID){
		return this.initpageMapper.getShareCount(BMID);
	}
	
	public String getBMData(String BMID){
		return this.initpageMapper.getBMData(BMID);
	}
	
	public String getZXData(){
		return this.initpageMapper.getZXData();
	}
	
	public String getStationinfo(String YHM){
		return this.initpageMapper.getStationInfo(YHM);
	}
	
	public String getZXZXCount(){
		return this.initpageMapper.getZXZXCount();
	}

	public List<HashMap<String, Object>> getBmggList(Map param) {
		return this.initpageMapper.getBmggList(param);
	}

	public int getYytjs(Map param) {
		return this.initpageMapper.getYytjs(param);
	}

	public List<Map<String, Object>> getBmsjtj(Map<String, Object> param) {
		return this.initpageMapper.getBmsjtj(param);
	}
//	
//	public String noShow(String yhm){
//		return this.initpageMapper.noShow(yhm);
//	}
//	public String showOrNot(String yhm){
//		return this.initpageMapper.showOrNot(yhm);
//	}
//	
	public Map getlhjcTJ(Map map){
		return initpageMapper.getlhjcTJ(map);
	}
	
	 
}
