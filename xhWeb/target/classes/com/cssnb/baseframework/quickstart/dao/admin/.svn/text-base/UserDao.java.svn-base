package com.cssnb.baseframework.quickstart.dao.admin;

import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Company: 中国软件技术与服务股份有限公司宁波分公司
 * Project:
 * Module ID:
 * Comments:
 * JDK version used: JDK1.7
 * Author: 胡营
 * Created Date: 2015年1月27日
 */
public interface UserDao {
    /**
     * 插入用户信息
     * @param user
     */
    public void insertUser(User user);

    /**
     * 更新用户信息
     * @param user
     */
    public void updateUser(User user);

    /**
     * 根据用户ID删除用户信息
     * @param userId
     */
    public void deleteUser(Integer userId);

    /**
     * 分页查询用户信息
     * @param pageBounds
     * @param param
     * @return
     */
    public PageList<HashMap<String,Object>> findUserList( PageBounds pageBounds,Map<String,Object> param);

    /**
     * 根据用户ID或者用户名查询用户信息
     * @param userId
     * @param userName
     * @return
     */
    public User getUserInfo(@Param("userId") Integer userId, @Param("userName") String userName);

	public void uploadExl(Map<Object, Object> newmap);

	public void inTest_nsrxx(Map<Object, Object> newmap);

	public List<Map<Object, Object>> selTest_nerxx();

	public void deleteInfo(String id);

	public void deletedata(String id);
//
//	public void insertTask(Task task);
//
//	public Task getTaskInfo(Integer iD);
//
//	public void updateTask(Task task);

	
}
