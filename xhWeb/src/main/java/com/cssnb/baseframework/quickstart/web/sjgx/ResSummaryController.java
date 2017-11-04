package com.cssnb.baseframework.quickstart.web.sjgx;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cssnb.baseframework.quickstart.entity.sjgx.ResSummary;
import com.cssnb.baseframework.quickstart.entity.zTree.Node;
import com.cssnb.baseframework.quickstart.service.sjgx.ResSummaryService;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;

/**
 * 
 * @类描述：资源共享树
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.web.sjgx
 * @类名称：ResSummaryController
 * @创建人：wujiong
 * @创建时间：2015年8月3日下午5:31:21
 * @修改人：wujiong
 * @修改时间：2015年8月3日下午5:31:21
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright 
 * @mail
 */
@Controller
@RequestMapping("/sjgx")
public class ResSummaryController {
	@Autowired
	private ResSummaryService zyhzbService;
	
	/**
	 * 
	 * @描述:资源汇总起始页重定向
	 * @方法名: index
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:32:04
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:32:04
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/index")
	public String index(Model model){
		Subject subject = SecurityUtils.getSubject();
		boolean hasAdminRole = subject.hasRole("admin");
		model.addAttribute("hasAdminRole", hasAdminRole);
		return "sjgx/sjgx_index";
	}
	
	
	@RequestMapping("/resdate/index")
	public String showResDate(Model model) {
		return "sjgx/sjgx_res_grid_index";
	}
	
	/**
	 * 
	 * @描述:资源汇总树查询
	 * @方法名: zyhzb
	 * @return
	 * @返回类型 List<Node>
	 * @创建人 wujiong
	 * @创建时间 2015年8月3日下午5:32:34
	 * @修改人 wujiong
	 * @修改时间 2015年8月3日下午5:32:34
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/treedata")
	@ResponseBody
	public List<Node> zyhzb() {
		List<ResSummary> list = zyhzbService.getAllData();
		List<Node> nodes = new ArrayList<Node>();
		if (list == null || list.isEmpty()) {
			return Collections.emptyList();
		}
		int size = list.size();
		for (int i = 0; i < size; i++) {
			ResSummary zyhzb = list.get(i);
			int id = zyhzb.getDepartmentId();
			if (nodes == null || nodes.isEmpty()) {
				Node node = new Node();
				node.setId(id);
				node.setName(zyhzb.getDepartmentName());
				List<Node> childrenNodes = new ArrayList<Node>();
				Node childrenNode = new Node();
				childrenNode.setId(zyhzb.getResourceId());
				childrenNode.setName(zyhzb.getResourceNameCn());
				childrenNodes.add(childrenNode);
				node.setChildren(childrenNodes);
				nodes.add(node);
			} else {
				int nodesSize = nodes.size();
				boolean flag = false;
				for (int j = 0; j < nodesSize; j++) {
					Node node = nodes.get(j);
					if (node.getId() == id) {
						Node childrenNode = new Node();
						childrenNode.setId(zyhzb.getResourceId());
						childrenNode.setName(zyhzb.getResourceNameCn());
						node.getChildren().add(childrenNode);
						flag = true;
						break;
					}
				}
				if (!flag) {
					Node node = new Node();
					node.setId(id);
					node.setName(zyhzb.getDepartmentName());
					List<Node> childrenNodes = new ArrayList<Node>();
					Node childrenNode = new Node();
					childrenNode.setId(zyhzb.getResourceId());
					childrenNode.setName(zyhzb.getResourceNameCn());
					childrenNodes.add(childrenNode);
					node.setChildren(childrenNodes);
					nodes.add(node);
				}
			}
		}
		return nodes;
	}
}
