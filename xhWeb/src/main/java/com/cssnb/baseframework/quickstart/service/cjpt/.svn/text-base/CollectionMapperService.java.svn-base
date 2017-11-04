package com.cssnb.baseframework.quickstart.service.cjpt;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.baseframework.quickstart.dao.cjpt.CollectionMapper;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.entity.cjpt.Frequency;
import com.cssnb.baseframework.quickstart.entity.cjpt.Table;
import com.cssnb.baseframework.quickstart.entity.cjpt.TableName;
import com.cssnb.baseframework.quickstart.entity.cjpt.Task;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditEntity;
import com.cssnb.baseframework.quickstart.entity.zTree.Node;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditDetail;

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
public class CollectionMapperService {
    @Autowired
    private CollectionMapper collectionMapper;

   

    /**
     * 查询用户列表
     * @return
     */
    public PageList<HashMap<String,Object>> getCollectionTaskList(JqgridPage jqgridPage,Map<String,Object> param){
        PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
         return collectionMapper.getCollectionTaskList(pageBounds,param);
    }
    
   

    /**
     * 根据用户ID或者用户名查询用户信息
     * @param userId
     * @param userName
     * @return
     */
    public User getUserInfo(Integer userId,String userName){
        return collectionMapper.getUserInfo(userId,userName);
    }

	

	public void deleteInfo(String id) {
		collectionMapper.deleteInfo(id);
		
	}

	public void deletedata(String id) {
		collectionMapper.deletedata(id);
	}

	public void insertTask(Map<String, Object> param) {
		collectionMapper.insertTask(param);
		
	}

	public Map<String,Object> getTaskInfo(String iD) {
		return collectionMapper.getTaskInfo(iD);
	}

	public void updateTask(Map<String, Object> param) {
		collectionMapper.updateTask(param);
	}

	public String getTaskId(Map map) {
		return collectionMapper.getTaskId(map);
	}

	public List<Table> getResId(int userid) {
		return collectionMapper.getResId(userid);
	}

	public List<Map<String,String>> getResName(String res_table_id) {
		return collectionMapper.getResName(res_table_id);
	}

	public List<Frequency> getFrequency() {
		return collectionMapper.getFrequency();
	}

	public void updateResTable(Map<String, Object> param) {
		collectionMapper.updateResTable(param);
	}

	public void insertTag(Map<String,String> tagMap) {
		collectionMapper.insertTag(tagMap);
	}

	public String getEditTag(String RES_ID) {
		return collectionMapper.getEditTag(RES_ID);
	}

	public Map getTableInfo(String RES_ID) {
		return collectionMapper.getTableInfo(RES_ID);
	}

	public void updateTag(Map map1) {
		collectionMapper.updateTag(map1);
		
	}

	public int isRes_TagMoreThan1(String RES_ID) {
		return collectionMapper.isRes_TagMoreThan1(RES_ID);
	}

	public String getOneTag(String RES_ID) {
		return collectionMapper.getOneTag(RES_ID);
	}

	public String getResTableName(int resource_id) {
		return collectionMapper.getResTableName(resource_id);
	}

	public void addTag(Map<String, Object> param) {
		collectionMapper.addTag(param);
		
	}

	public List<Map<String, Object>> getDepartment() {
		return collectionMapper.getDepartment();
	}

	public auditDetail getAuditDetail(
			String id) {
		return collectionMapper.getAuditDetail(id);
	}

	public void insertReg(Map<String, Object> param) {
		collectionMapper.insertReg(param);
		
	}

	public int ifPass(Map<String, Object> param) {
		return collectionMapper.ifPass(param);
	}

	public PageList<auditEntity> getAuditListForUser(JqgridPage jqgridPage,
			Map<String,Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.getAuditListForUser(pageBounds, param);
	}

	 public PageList<auditEntity> getAuditListForManager(JqgridPage jqgridPage,Map<String,Object> param) {
    	 PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.getAuditListForManager(pageBounds,param);
	}



	public List<Map<String, Object>> getRegStatus() {
		return collectionMapper.getRegStatus();
	}



	public void auditCommit(Map<String, Object> param) {
		collectionMapper.auditCommit(param);
	}



	public auditDetail regDetail(String id) {
		return collectionMapper.regDetail(id);
	}



	public List<String> getTagList(String id) {
		return collectionMapper.getTagList(id);
	}



	public void deleteTag(Map<String, Object> param) {
		collectionMapper.deleteTag(param);
	}



	public PageList<HashMap<String, Object>> collectionTaskList1(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.collectionTaskList1(pageBounds, param);
	}



	public PageList<HashMap<String, Object>> collectionTaskList2(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.collectionTaskList2(pageBounds, param);
	}



	public PageList<HashMap<String, Object>> resList(JqgridPage jqgridPage,
			Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.resList(pageBounds, param);
	}



	public PageList<HashMap<String, Object>> resListForUser(
			JqgridPage jqgridPage, Map<String, Object> param) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return collectionMapper.resListForUser(pageBounds, param);
	}

	

	
}
