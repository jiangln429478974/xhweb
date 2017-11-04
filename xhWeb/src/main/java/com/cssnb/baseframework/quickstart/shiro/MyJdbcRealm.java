/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package com.cssnb.baseframework.quickstart.shiro;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import com.cssnb.baseframework.quickstart.commons.utils.Constants;
import com.cssnb.users.service.UsersService;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.JdbcUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Realm that allows authentication and authorization via JDBC calls. The
 * default queries suggest a potential schema for retrieving the user's password
 * for authentication, and querying for a user's roles and permissions. The
 * default queries can be overridden by setting the query properties of the
 * realm.
 * <p/>
 * If the default implementation of authentication and authorization cannot
 * handle your schema, this class can be subclassed and the appropriate methods
 * overridden. (usually
 * {@link #doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)},
 * {@link #getRoleNamesForUser(java.sql.Connection,String)}, and/or
 * {@link #getPermissions(java.sql.Connection,String,java.util.Collection)}
 * <p/>
 * This realm supports caching by extending from
 * {@link org.apache.shiro.realm.AuthorizingRealm}.
 * 
 * @since 0.2
 */
public class MyJdbcRealm extends AuthorizingRealm {
	@Autowired
	private UsersService userService;
	/**
	 * 授权操作
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		  String currentUsername = (String)super.getAvailablePrincipal(principals);  
	      SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();  
	        //实际中可能会像上面注释的那样从数据库取得  
	        if(null!=currentUsername && "zhangsan".equals(currentUsername)){
	            //添加一个角色,不是配置意义上的添加,而是证明该用户拥有admin角色    
	             simpleAuthorInfo.addRole("admin");  
	            //添加权限  
	            simpleAuthorInfo.addStringPermission("admin:manage");  
	            System.out.println("已为用户[mike]赋予了[admin]角色和[admin:manage]权限");  
	            return simpleAuthorInfo;  
	        }
	        //若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址  
	        //详见applicationContext.xml中的<bean id="shiroFilter">的配置  
	        return null;  
	}

	/**
	 * 身份验证操作
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		
		String username = (String) token.getPrincipal();
		Map map=new HashMap();
		map.put("username", username);
		List userList = userService.getUserList(map);

		if (userList== null||userList.size()==0) {
			// 木有找到用户
			throw new UnknownAccountException("没有找到该账号");
		}
			Map userMap=(Map)userList.get(0);
//			ShiroUser user=new ShiroUser();
//			user.setUserId(userMap.get("ID")+"");
//			user.setPassword(userMap.get("MM")+"");
//			user.setUserName(userMap.get("YHM")+"");
//			user.setNickName(userMap.get("XM")+"");
			
		/*
		 * if(Boolean.TRUE.equals(user.getLocked())) { throw new
		 * LockedAccountException(); //帐号锁定 }
		 */

		/**
		 * 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以在此判断或自定义实现
		 */
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
				userMap.get("YHM"),userMap.get("MM"), getName());
		return info;
	}

	@Override
	public String getName() {
		return getClass().getName();
	}

	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroUser implements Serializable {

		private static final long serialVersionUID = -1748602382963711884L;
		private int userId;
		private String userName;
		private String nickName;
		private String password;
		private String departmentId;

		public ShiroUser() {
		}

		public ShiroUser(String userName, String nickName) {
			this.userName = userName;
			this.nickName = nickName;
		}

		public int getUserId() {
			return userId;
		}

		public void setUserId(int userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getNickName() {
			return nickName;
		}

		public void setNickName(String nickName) {
			this.nickName = nickName;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getDepartmentId() {
			return departmentId;
		}

		public void setDepartmentId(String departmentId) {
			this.departmentId = departmentId;
		}

		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return nickName;
		}
	}

}