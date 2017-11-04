package com.cssnb.util;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * AES 是一种可逆加密算法，对用户的敏感信息加密处理 对原始数据进行AES加密后，在进行Base64编码转化；
 */
public class AESOperator {
	/*
	 * 加密用的Key 可以用26个字母和数字组成 此处使用AES-128-CBC加密模式，key需要为16位。
	 */
	private String sKey = "0123456789asdfgh";
	private String ivParameter = "0123456789asdfgh";
	private static AESOperator instance = null;

	private AESOperator() {

	}

	public static AESOperator getInstance() {
		if (instance == null)
			instance = new AESOperator();
		return instance;
	}

	// 加密
	public  String encrypt(String sSrc) throws Exception {
		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		byte[] raw = sKey.getBytes();
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());// 使用CBC模式，需要一个向量iv，可增加加密算法的强度
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
		byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
		
		   //base64加密超过一定长度会自动换行 需要去除换行符  
		String result=new BASE64Encoder().encode(encrypted);
		result=result.replaceAll("\r\n", "").replaceAll("\r", "").replaceAll("\n", "");
	     
		return result;// 此处使用BASE64做转码。
	}

	// 解密
	public String decrypt(String sSrc) throws Exception {
		try {
			byte[] raw = sKey.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());
			cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
			byte[] encrypted1 = new BASE64Decoder().decodeBuffer(sSrc);// 先用base64解密
			byte[] original = cipher.doFinal(encrypted1);
			String originalString = new String(original, "utf-8");
			return originalString;
		} catch (Exception ex) {
			return null;
		}
	}

	public static void main(String[] args) throws Exception {
// 需要加密的字串
		String cSrc="{\"YHM\":\"JINGXINWEI\",\"CODE\":[{\"XM\":\"张三\",\"SFZH\":\"330205197501011234\"},{\"XM\":\"李四\",\"SFZH\":\"330203199411211226\"},{\"XM\":\"李四\",\"SFZH\":\"330203199411211226\"}]}";
//String cSrc = "我来自www.wenhq.com";
System.out.println(cSrc);
// 加密
long lStart = System.currentTimeMillis();
String enString = AESOperator.getInstance().encrypt(cSrc);
System.out.println("加密后的字串是：" + enString);

long lUseTime = System.currentTimeMillis()-lStart;
System.out.println("加密耗时：" + lUseTime + "毫秒");
// 解密
lStart = System.currentTimeMillis();
String DeString = AESOperator.getInstance().decrypt("2Ds7OVlDHIjvC7ADt3vpV1BCsvijt6o0z8uBMvmIT5epV3W46VeA4SaXLjbVfGcteRguUO79gL/3gd6JDL2EPJwMfDDrxGxX5yPQHYAkvUWSgDzMrFvNQsU8jN0XEqXylAXfZTvAqRlinwk35jIFuhc1CMwgJGeRkwVxbqzljk4K/QVg+udLqvefIdTm2VGBLWPSJvQK4eNDHWGycjB4P8VoLxnFNrdyiPx6mMlFa4Q=");
System.out.println("解密后的字串是：" + DeString);
lUseTime = System.currentTimeMillis()-lStart;
System.out.println("解密耗时：" + lUseTime + "毫秒");
}
}
