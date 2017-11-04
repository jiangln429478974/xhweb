package com.cssnb.baseframework.quickstart.web.demo;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.quickstart.service.demo1.Demo1Service;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.github.miemiedev.mybatis.paginator.domain.Paginator;

@Controller
@RequestMapping("/demo/table")
public class TableController {
	@Autowired
	private Demo1Service demo1Service;

	@RequestMapping("/jqgrid")
	public String jqgrid() {
		return "demo/table/table_jqgrid";
	}

	@RequestMapping("/findDataByJqgrid")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> findDataByPaing(
			JqgridPage jqgridPage) {
		PageList list = demo1Service.findDataByPaging(jqgridPage.getPage(),
				jqgridPage.getRows());
		Paginator paginator = list.getPaginator();
		return new JqgridResponse<HashMap<String, Object>>(paginator, list);
	}

//	@RequestMapping("/test")
//	@ResponseBody
//	public List<Node> test() {
//		List<Node> nodes = new ArrayList<>();
//		Node node = new Node();
//		node.setId(0);
//		node.setName("node0");
//		List<Node> childrenNode = new ArrayList<>();
//		Node node01 = new Node();
//		node01.setId(1);
//		node01.setName("node01");
//		childrenNode.add(node01);
//		Node node02 = new Node();
//		node02.setId(2);
//		node02.setName("node02");
//		childrenNode.add(node02);
//		Node node03 = new Node();
//		node03.setId(3);
//		node03.setName("node03");
//		childrenNode.add(node03);
//		node.setChildren(childrenNode);
//		nodes.add(node);
//		Node node11 = new Node();
//		node11.setName("node11");
//		List<Node> childrenNode2 = new ArrayList<>();
//		Node node111 = new Node();
//		node111.setId(1);
//		node111.setName("node11");
//		childrenNode2.add(node111);
//		Node node222 = new Node();
//		node222.setId(2);
//		node222.setName("node22");
//		childrenNode2.add(node222);
//		node11.setChildren(childrenNode2);
//		nodes.add(node11);
//		return nodes;
//	}

}
