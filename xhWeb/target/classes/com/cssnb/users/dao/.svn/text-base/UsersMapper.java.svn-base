package com.cssnb.users.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

public interface UsersMapper {

	/**
	 * hdd
	 * 显示用户列表
	 * @return
	 */
	 public List<HashMap<String, Object>> getUserList(Map map);//根据不同参数获取用户列表
	 
	 public PageList<HashMap<String, Object>> getInit(PageBounds pageBounds,//初始化用户列表 (jqgrid插件获取)
				Map<String, Object> param);
	 
	 public void deleteUser(Map map);//删除用户
	 public void updateUser(Map map);//更新用户
	 public void insertUser(Map map);//新增用户
	 public void resetPwd(Map map);//重置用户密码（废弃）
	 
	 public void insertYhJs(Map map);//新增用户角色
	 public void deleteYhJs(Map map);//删除用户角色
	 public List<HashMap<String, Object>> getYhJsList(Map map);//根据不同参数获取用户角色
	 
	 public String getUserName(String userName);//根据当前用户名取出用户名
	 public List<HashMap<String, Object>> getCa(String ca);//根据当前用户名取出用户名
	 public String getUsernameByca(String ca);//根据当前ca用户查找登录人用户名
	 public String vilidate(String UserName);//根据当前登陆人获取当前登陆人的密码
	 public String zt(String UserName);//根据当前登陆人获取当前登陆人的状态
	 public String vilidateByca(String ca);//根据当前CA用户获取当前登陆人的密码
	 public List<HashMap<String, Object>> getUserListForCxjk(Map map);//根据CA标识符身份证取的用户信息
	 public void addYzm(Map map);	
	 public int  checkYzm(Map map);
	 public void updateYzm(Map map);	
}
