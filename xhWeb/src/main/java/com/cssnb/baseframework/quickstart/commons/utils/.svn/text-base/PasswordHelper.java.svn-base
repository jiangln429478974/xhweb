package com.cssnb.baseframework.quickstart.commons.utils;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cssnb.baseframework.quickstart.entity.admin.User;

/**
 * 密码帮助类
 * @Company: 宁波中软信息服务有限公司
 * @Project: 公司框架v2.0
 * @Module ID: 
 * @Description: 
 * @JDK version used: JDK1.6
 * @Author: xuning
 * @Email: xuning@css.com.cn
 * @Created Date: 2014年8月1日 下午3:47:52
 */
@Service
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    @Value("${shiro.hashAlgorithmName}")
    private String algorithmName = "md5";
    @Value("${shiro.hashIterations}")
    private int hashIterations = 2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }

    public void encryptPassword(User user) {

       // user.setSalt(randomNumberGenerator.nextBytes().toHex());
    	System.out.println(algorithmName);
        System.out.println(hashIterations);
        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                null,
                hashIterations).toHex();

        user.setPassword(newPassword);
    }
}