package com.cssnb.monitor.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cssnb.monitor.dao.UDao;

@Service
public class UService {
    @Resource
    private UDao uDao;
    public void add(String userName,String userPass){
    	uDao.add(userName, userPass);
    }
}
