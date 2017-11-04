package com.cssnb.baseframework.quickstart.web.resteasy;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadUtil {

	public static String saveFile(String zbdlbm,HttpServletRequest request,Integer type) throws IOException{
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        MultipartFile file = multipartRequest.getFile("file");  
        String realFileName=null; 
        if(type==0){
         realFileName = file.getOriginalFilename(); 
        }else {
         realFileName = file.getOriginalFilename();
        }
        String ctxPath = request.getSession().getServletContext().getRealPath(  
                "/")  
                + "/" + "upload/";  
        // 创建文件  
        File dirPath = new File(ctxPath);  
        if (!dirPath.exists()) {  
            dirPath.mkdir();  
        }  
        File uploadFile = new File(ctxPath + realFileName);  
        FileCopyUtils.copy(file.getBytes(), uploadFile);
        
        return realFileName;
	}
}
