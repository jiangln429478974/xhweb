package com.cssnb.baseframework.quickstart.service.resteasy;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class RestDemo1Service {
	public Map<String,String> getAll(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("name", "test1");
		map.put("nick", "xxxxxxxxx");
		map.put("address", "xxxx");
		map.put("phone", "123345");
		return map;
	}
}
