package com.cssnb.baseframework.quickstart.web.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.service.admin.UserService;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

//import com.google.common.collect.Table.Cell;

/**
 * Company: 中国软件技术与服务股份有限公司宁波分公司 Project: Module ID:系统管理 Comments:用户管理 JDK
 * version used: JDK1.7 Author: 胡营 Created Date: 2015/2/1
 */
@Controller
@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, value = { "/admin/user" })
public class UserController {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	
	 @RequestMapping(value = {"","/list"})
	    public String toUserListPage(){
	        return "admin/user_list";
	    }
	
	/**
	 * 进入用户列表页面
	 * 
	 * @return
	 * @throws ParseException
	 * @throws BiffException
	 */
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, value = {
			"", "/" })
	public String toUserListPage(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException,
			BiffException {
		System.out.println("进入用户列表页面");

		// 转型为MultipartHttpRequest：
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 获取文件 与form表单中的name一致
		MultipartFile file = multipartRequest.getFile("filepath");

		// 获取文件名
		String realFileName = file.getOriginalFilename();
		// 获得当前时间戳
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNowStr = sdf.format(d);
		Date nowdate = sdf.parse(dateNowStr);

		InputStream is = null;
		OutputStream os = null;
		// 输出的excel的路径
		String filePath = "C:\\Users\\Administrator\\Desktop\\testJXL";
		// 创建文件保存路径
		File uploadFilePath = new File(filePath);
		uploadFilePath.mkdirs();
		// 创建新文件 命名为原文件名+当前时间戳
		File newFile = new File(uploadFilePath, realFileName.substring(0,
				realFileName.length() - 4) + nowdate.getTime() + ".xls");
		// FileCopyUtils.copy(file.getBytes(), newFile);
		is = file.getInputStream();
		os = new FileOutputStream(newFile);
		// // 创建缓冲区
		byte[] buffer = new byte[1024];
		// 创建判断实际读取长度的变量
		int len = 0;

		// 向缓冲区读入资源数据
		while ((len = is.read(buffer)) != -1) {
			// 从缓冲区向外输出资源数据
			os.write(buffer, 0, len);
			os.flush();
		}

		is.close();
		os.close();

		// 创建一个list 用来存储读取的内容
		List list = new ArrayList();
		Workbook rwb = null;
		Cell cell = null;

		// 创建输入流
		// InputStream stream = new
		// FileInputStream("C:\\Users\\Administrator\\Desktop\\testExl.xls");
		InputStream stream = new FileInputStream(newFile);

		// 获取Excel文件对象
		rwb = Workbook.getWorkbook(stream);
		// 获取文件的指定工作表 默认的第一个
		Sheet sheet = rwb.getSheet(0);

		List<Map<Object, Object>> maplist = new ArrayList<Map<Object, Object>>();
		List<Map<Object, Object>> nsrxx_column_list = userService
				.selTest_nerxx();

		/*
		 * Map<Object, Object> nsrxx_column = new HashMap<Object, Object>();
		 * Map<Object, Object> table_head = new HashMap<Object, Object>();
		 * Map<Object, Object> DATE_map = new HashMap<Object, Object>(); //i
		 * for(int j=0; j<nsrxx_column_list.size(); j++){ nsrxx_column =
		 * nsrxx_column_list.get(j);
		 * 
		 * }
		 */
		Map<String, String> nsrxx_map = new HashMap<>();

		for (Map<Object, Object> map : nsrxx_column_list) {
			nsrxx_map.put(map.get("COLUMN_NAME").toString(),
					map.get("COLUMN_NAME").toString());
		}
		System.out.println("1111111111111111111");
		List<String> table_head = new ArrayList<>();
		List<Integer> excleDateTypeColum = new ArrayList<Integer>();
		// 表头
		for (int i = 1; i < sheet.getColumns(); i++) {
			cell = (Cell) sheet.getCell(i, 0);
			table_head.add(((jxl.Cell) cell).getContents());
			
		}
		System.out.println("table_head="+table_head);
		for (int i = 0; i < table_head.size(); i++) {
			if (nsrxx_map.containsKey(table_head.get(i))) {
				excleDateTypeColum.add(i);
			}
		}
		System.out.println("excleDateTypeColum="+excleDateTypeColum);

			// 行数(表头的目录不需要，从1开始)
			for (int i = 0; i < sheet.getRows(); i++) {

				// 创建一个数组 用来存储每一列的值
				String[] str = new String[sheet.getColumns()];
				System.out.println(1);
				Map<Object, Object> map = new HashMap<Object, Object>(
						sheet.getColumns());
				System.out.println(2);
				// 列数
				for (int j = 1; j < sheet.getColumns(); j++) {

					boolean flag = false;
					for (Integer integers : excleDateTypeColum) {
						if (j == (int) integers) {
							flag = true;
						}
					}
					// 获取第i行，第j列的值
					cell = (Cell) sheet.getCell(j, i);
					str[j] = ((jxl.Cell) cell).getContents();

					if (flag) {
//						map.put(table_head.get(j), "TO_DATE(" +str[j]+ ",'yyyy-MM-dd hh24:mi:ss')");
//						System.out.println(map);
						SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						Date date = sdf2.parse(str[1]);
						map.put(table_head.get(j), date);
					} else {
						map.put(table_head.get(j), str[j]);
					}
					

				}
				// 把刚获取的列存入list
				list.add(str);
				maplist.add(map);
				System.out.println("maplist="+maplist);

			}
		
		for (Map<Object, Object> newmap : maplist) {
			System.out.println(newmap);
			if (newmap != null) {
				// userService.uploadExl(newmap);
				userService.inTest_nsrxx(newmap);
			}
		}
		System.out.println("=================================");
		for (int i = 0; i < list.size(); i++) {
			String[] str = (String[]) list.get(i);
			for (int j = 0; j < str.length; j++) {
				// System.out.println(str[j]);
			}
			// System.out.println("str="+str.toString());
			// System.out.println("list.get(i)="+list.get(i));
		}
		// System.out.println("-----------------------------------------------");
		// System.out.println("list="+list);

		return "admin/user_list";
	}

	@RequestMapping(method = RequestMethod.GET, value = "uploadtest")
	// @ResponseBody
	public String uploadtest(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {

		/*
		 * // 转型为MultipartHttpRequest： MultipartHttpServletRequest
		 * multipartRequest = (MultipartHttpServletRequest) request; //获取文件
		 * MultipartFile file = multipartRequest.getFile("file"); //获取文件名 String
		 * realFileName=file.getOriginalFilename(); //获得当前时间戳 Date d = new
		 * Date(); SimpleDateFormat sdf = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String dateNowStr =
		 * sdf.format(d); Date nowdate = sdf.parse(dateNowStr); //创建新文件
		 * 命名为原文件名+当前时间戳 File uploadFile = new
		 * File(realFileName+nowdate.getTime());
		 * FileCopyUtils.copy(file.getBytes(), uploadFile);
		 */

		return "uploadtest";
	}

	/**
	 * 查询用户列表
	 * 
	 * @param jqgridPage
	 * @param request
	 * @return
	 */
	@RequestMapping("/findUserList")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> findUserList(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		PageList<HashMap<String, Object>> userList = userService.findUserList(
				jqgridPage, param);
		return new JqgridResponse<>(userList);
	}
	
	/** 测试 删除功能
	 * @param id
	 * @return
	 */
	@RequestMapping("/deletedata/{id}")
	@ResponseBody
	public Response deleteInfo(@PathVariable String id){
		Response response = new Response();
		System.out.println(id);
		try {
			userService.deletedata(id);
			System.out.println("-------------------");
			response.setCode(Response.SUCCESS);
			System.out.println("=================");
		} catch (Exception e) {
			String msg = "删除失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "insertPage")
	// @ResponseBody
	public String insertPage(HttpServletRequest request, HttpServletResponse response){
		
		return "admin/insertPage";
	}
	
	/**
	 * 进入新增用户页面
	 * 
	 * @return
	 */
	@RequestMapping("user_add")
	public String toUserAddPage() {
		return "admin/user_add";
	}

	/**
	 * 新增用户信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public Response addUser(User user) {
		Response response = new Response();
		try {
			userService.insertUser(user);
			response.setCode(Response.SUCCESS);
		} catch (Exception ex) {
			String msg = "系统内部错误，新增用户失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, ex);
		}
		return response;
	}
	
//	@RequestMapping("/insertData")
//	@ResponseBody
//	public Response insertData(Task task) {
//		Response response = new Response();
//		Date date = new Date();
//		String lsh = Long.toString(date.getTime());
//		try {
//		 	task.setID(lsh);
//			userService.insertTask(task);
//			response.setCode(Response.SUCCESS);
//		} catch (Exception ex) {
//			String msg = "系统内部错误，新增用户失败";
//			response.setMsg(msg);
//			response.setCode(Response.ERROR);
//			LOGGER.error(msg, ex);
//		}
//		
//		//System.out.println("map="+task);
//		return response;
//	}
//	
//	@RequestMapping("/updateData")
//	@ResponseBody
//	public Response updateData(Task task) {
//		Response response = new Response();
//		System.out.println("task="+task);
//		try {
//			System.out.println("1");
//			userService.updateTask(task);
//			System.out.println("2");
//			response.setCode(Response.SUCCESS);
//		} catch (Exception ex) {
//			String msg = "系统内部错误，修改用户失败";
//			response.setMsg(msg);
//			response.setCode(Response.ERROR);
//			LOGGER.error(msg, ex);
//		}
//		return response;
//	}
//
//	/**
//	 * 进入用户编辑页面
//	 * 
//	 * @return
//	 */
//	@RequestMapping("/user_edit")
//	public ModelAndView toUserEditPage(@RequestParam("userId") Integer userId,
//			Model model) {
//		User user = userService.getUserInfo(userId, null);
//		return new ModelAndView("admin/user_edit", "user", user);
//	}
//	
//	@RequestMapping("/editPage")
//	public ModelAndView editPage(@RequestParam("ID") Integer ID,
//			Model model) {
//		Task task = userService.getTaskInfo(ID);
//		return new ModelAndView("admin/editPage", "task", task);
//	}

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public Response updateUser(User user) {
		Response response = new Response();
		try {
			userService.updateUser(user);
			response.setCode(Response.SUCCESS);
		} catch (Exception ex) {
			String msg = "系统内部错误，修改用户失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, ex);
		}
		return response;
	}

	/**
	 * 删除用户信息
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/deleteUser", method = { RequestMethod.POST })
	@ResponseBody
	public Response deleteUser(@RequestParam(value = "userId") Integer userId) {
		Response response = new Response();
		try {
			userService.deleteUser(userId);
			response.setCode(Response.SUCCESS);
		} catch (Exception ex) {
			String msg = "系统内部错误，删除用户失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, ex);
		}
		return response;
	}
}
