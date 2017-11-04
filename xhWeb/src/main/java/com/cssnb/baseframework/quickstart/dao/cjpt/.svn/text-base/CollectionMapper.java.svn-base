package com.cssnb.baseframework.quickstart.dao.cjpt;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.entity.cjpt.Frequency;
import com.cssnb.baseframework.quickstart.entity.cjpt.Table;
import com.cssnb.baseframework.quickstart.entity.cjpt.TableName;
import com.cssnb.baseframework.quickstart.entity.cjpt.Task;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditDetail;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditEntity;
import com.cssnb.baseframework.quickstart.entity.zTree.Node;
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
public interface CollectionMapper {
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
    public PageList<HashMap<String,Object>> getCollectionTaskList( PageBounds pageBounds,Map<String,Object> param);

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

	public void insertTask(Map<String, Object> param);

	public Map<String,Object> getTaskInfo(String iD);

	public void updateTask(Map<String, Object> param);

	public String getTaskId(Map map);

	public List<Table> getResId(int userid);

	public List<Map<String,String>> getResName(String res_table_id);

	public List<Frequency> getFrequency();

	public void updateResTable(Map<String, Object> param);

	public void insertTag(Map<String,String> tagMap);

	public String getEditTag(String RES_ID);

	public Map getTableInfo(String RES_ID);

	public void updateTag(Map map1);

	public int isRes_TagMoreThan1(String RES_ID);

	public String getOneTag(String rES_ID);

	public String getResTableName(int resource_id);

	public void addTag(Map<String, Object> param);

	public List<Map<String, Object>> getDepartment();

	public PageList<auditEntity> getAuditListForManager(PageBounds pageBounds,Map<String,Object> param);

	public auditDetail getAuditDetail(String id);

	public void insertReg(Map<String, Object> param);

	public int ifPass(Map<String, Object> param);

	public PageList<auditEntity> getAuditListForUser(PageBounds pageBounds,
			Map<String,Object> param);

	public List<Map<String, Object>> getRegStatus();

	public void auditCommit(Map<String, Object> param);

	public auditDetail regDetail(String id);

	public List<String> getTagList(String id);

	public void deleteTag(Map<String, Object> param);

	public PageList<HashMap<String, Object>> collectionTaskList1(
			PageBounds pageBounds, Map<String, Object> param);

	public PageList<HashMap<String, Object>> collectionTaskList2(
			PageBounds pageBounds, Map<String, Object> param);

	public PageList<HashMap<String, Object>> resList(PageBounds pageBounds,
			Map<String, Object> param);

	public PageList<HashMap<String, Object>> resListForUser(
			PageBounds pageBounds, Map<String, Object> param);
	
}
