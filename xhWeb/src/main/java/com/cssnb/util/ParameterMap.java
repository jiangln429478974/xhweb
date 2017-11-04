/**
 *<p>Copyright: CHINA NATIONAL SOFTWARE & SERVICE CO.,LTD.</p>
 */
package com.cssnb.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Company: 中国软件与技术服务股份有限公司宁波分公司
 * @Author(svn): 卜繁晟
 * @Created Date: 2013-1-31
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public class ParameterMap {

	/**
	 * 查询参数列表
	 * @作者: 卜繁晟
	 * @创时: 2013-1-31 下午4:02:14
	 */
	public static Map getParameterMap(Map pMap){
		Map map = new HashMap();
		Object temp = null;
		Object[] tempKey = pMap.keySet().toArray();
		for(int i = 0; i < tempKey.length; i++){
			temp = ((Object[]) pMap.get(tempKey[i]))[0];
			if(temp != null && !"".equals(tempKey)){
				try{
					temp = new String(temp.toString().getBytes("ISO-8859-1"), "UTF-8");
				}catch(UnsupportedEncodingException e){
					e.printStackTrace();
				}
			}
			map.put(tempKey[i], temp);
		}
		return map;
	}
}
