package com.cssnb.baseframework.quickstart.shiro;

import com.cssnb.baseframework.quickstart.commons.utils.StrUtils;
import com.cssnb.baseframework.quickstart.entity.admin.Resource;
import com.cssnb.baseframework.quickstart.service.admin.ResourceService;

import org.apache.shiro.config.Ini;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.MessageFormat;
import java.util.Iterator;
import java.util.List;

/**
 * Company: 中国软件技术与服务股份有限公司宁波分公司
 * Project:
 * Module ID:
 * Comments:
 * JDK version used: JDK1.7
 * Author: 胡营
 * Created Date: 2015/2/5
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {
    @Autowired
    private ResourceService resourceService;
    private String filterChainDefinitions;

    /**
     * 默认premission字符串
     */
    public static final String PREMISSION_STRING="perms[\"{0}\"]";

    public Ini.Section getObject() throws BeansException {

        //获取所有Resource
        List<Resource> list = resourceService.getAllResource();

        Ini ini = new Ini();
        //加载默认的url
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        //循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
        //里面的键就是链接URL,值就是存在什么条件才能访问该链接
        for (Iterator<Resource> it = list.iterator(); it.hasNext();) {
            Resource resource = it.next();
            //如果不为空值添加到section中
            if(StrUtils.isNotEmpty(resource.getUrl()) && StrUtils.isNotEmpty(resource.getPremission())) {
               section.put(resource.getUrl(), resource.getPremission()/*MessageFormat.format(PREMISSION_STRING, resource.getPremission())*/);
            }
        }
        return section;
    }

    public static void main(String[] args) {
        System.out.println(MessageFormat.format(PREMISSION_STRING, "anon"));
    }

    /**
     * 通过filterChainDefinitions对默认的url过滤定义
     *
     * @param filterChainDefinitions 默认的url过滤定义
     */
    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    public Class<?> getObjectType() {
        return this.getClass();
    }

    public boolean isSingleton() {
        return false;
    }
}
