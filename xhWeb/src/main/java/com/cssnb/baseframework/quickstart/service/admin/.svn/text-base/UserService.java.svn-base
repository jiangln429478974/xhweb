package com.cssnb.baseframework.quickstart.service.admin;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.baseframework.quickstart.dao.admin.UserDao;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
 * Created Date:
 */
@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    /**
     * 新增用户
     * @param user
     */
    public void insertUser(User user){
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        userDao.insertUser(user);
    }

    /**
     * 修改用户
     * @param user
     */
    public void updateUser(User user){
        userDao.updateUser(user);
    }

    /**
     * 删除用户
     * @param userId
     */
    public void deleteUser(Integer userId){
        userDao.deleteUser(userId);
    }

    /**
     * 查询用户列表
     * @return
     */
    public PageList<HashMap<String,Object>> findUserList(JqgridPage jqgridPage,Map<String,Object> param){
        PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
        //PageBounds pageBounds = new PageBounds(jqgridPage.getPage(), jqgridPage.getRows() , Order.create(jqgridPage.getSidx(),jqgridPage.getSord()));
        return userDao.findUserList(pageBounds,param);
    }

    /**
     * 根据用户ID或者用户名查询用户信息
     * @param userId
     * @param userName
     * @return
     */
    public User getUserInfo(Integer userId,String userName){
        return userDao.getUserInfo(userId,userName);
    }

	public void uploadExl(Map<Object, Object> newmap) {
		userDao.uploadExl(newmap);
		
	}

	public void inTest_nsrxx(Map<Object, Object> newmap) {
		userDao.inTest_nsrxx(newmap);
		
	}

	public List<Map<Object, Object>> selTest_nerxx() {
		return userDao.selTest_nerxx();
	}

	public void deleteInfo(String id) {
		userDao.deleteInfo(id);
		
	}

	public void deletedata(String id) {
		userDao.deletedata(id);
	}

//	public void insertTask(Task task) {
//		userDao.insertTask(task);
//		
//	}
//
//	public Task getTaskInfo(Integer iD) {
//		return userDao.getTaskInfo(iD);
//	}
//
//	public void updateTask(Task task) {
//		userDao.updateTask(task);
//	}

	
}
