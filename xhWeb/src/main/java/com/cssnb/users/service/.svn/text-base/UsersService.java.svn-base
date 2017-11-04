package com.cssnb.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.users.dao.UsersMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @author hdd
 *
 */
@Service
public class UsersService {

	@Autowired
	private UsersMapper  usersMapper;
	
	 public List<HashMap<String, Object>> getUserList(Map map){
		 return usersMapper.getUserList(map);
	 }
	 
	 public PageList<HashMap<String, Object>> getInit(JqgridPage jqgridPage,
				Map<String, Object> param) {
			PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
			return usersMapper.getInit(pageBounds, param);
		}
	 
	 public void deleteUser(Map map){
		  usersMapper.deleteUser(map);
	 }
	 
	 public void updateUser(Map map){
		 usersMapper.updateUser(map);
	 }
	 public void insertUser(Map map){
		 usersMapper.insertUser(map);
	 }
	 
	 public void  resetPwd(Map map){
		 usersMapper.resetPwd(map);
	 }
	 
	 
	 public void insertYhJs(Map map){
		 usersMapper.insertYhJs(map);
	 }
	 public void deleteYhJs(Map map){
		 usersMapper.deleteYhJs(map);
	 }
	 public List<HashMap<String, Object>> getYhJsList(Map map){
		 return usersMapper.getYhJsList(map);
	 }
	 /**
	  * 根据当前登陆人找到用户名
	  * @param userName
	  * @return
	  */
	 public String getUserName(String userName){
		 
		 return usersMapper.getUserName(userName);
	 }
	 /**
	  * 根据当前登陆人找到ca标示
	  * @param userName
	  * @return
	  */
	 public List<HashMap<String, Object>>  getCa(String ca){
		 
		 return usersMapper.getCa(ca);
	 }
 
	 /**
	  * 根据当前登陆人ca查找用户名
	  * @param userName
	  * @return
	  */
	 public String getUsernameByca(String ca){
		 
		 return usersMapper.getUsernameByca(ca);
	 }
	 /**
	  * 根据当前登陆人获取当前密码
	  * @param UserName
	  * @return
	  */
	 public String vilidate(String UserName){
		 
		 return usersMapper.vilidate(UserName);
	 }
	 /**
	  * 根据当前登陆人获取当前状态
	  * @param UserName
	  * @return
	  */
	 public String zt(String UserName){
		 
		 return usersMapper.zt(UserName);
	 }
	 /**
	  * 根据当前ca用户获取当前密码
	  * @param UserName
	  * @return
	  */
	 public String vilidateByca(String ca){
		 
		 return usersMapper.vilidateByca(ca);
	 } 
	 //根据CA标识符身份证取的用户信息
	 public List<HashMap<String, Object>> getUserListForCxjk(Map map){
		 return usersMapper.getUserListForCxjk(map);
	 }
	  
	 public void addYzm(Map tpMap) {
		 usersMapper.addYzm(tpMap);
	 }
	 
	 public  int checkYzm(Map map){
		 return usersMapper.checkYzm(map);
	 }
	 
	 public void updateYzm(Map tpMap) {
		 usersMapper.updateYzm(tpMap);
	 }
	 
	
}
