/* 
 * ZJCA COM Script Interface v0.9
 * 2015 ZJCA. All rights reserved.
 * 
 *
*/

/*	全局变量 */
var deviceCurType = 2;	//RSA
var deviceEnum = null;
var deviceArray = null;
var deviceSel = null;
/*
 *	初始化函数，请在页面加载时调用
 */
function zjca_Init() {
	zjca_Final();
		
	deviceEnum = new ActiveXObject("ZJCAKeyManager.ZJCADeviceEnum.1");	
	deviceEnum.AddHandler(zjca_OnKeyChanged);			
}
/*
 *	结束函数，请在页面关闭前调用
 */
function zjca_Final() {
	if (deviceSel) {
		deviceSel = null;
	}
	if (deviceEnum) {
		deviceEnum.RemoveHandler(zjca_OnKeyChanged);
		deviceEnum = null;
	}
}
/*
 *	列出设备函数，type：2-RSA设备；3-SM2设备。
 */
function zjca_FillKeyList(ctrlKeyList, type) {	
	var count = ctrlKeyList.options.length;
	for (var n = 0; n < count; n++) {
		ctrlKeyList.options.remove(0);
	}
	
	deviceCurType = type;
	deviceArray = null;
	deviceArray = new Array();
	
	var res = deviceEnum.EnumDevices(deviceCurType);
	var deviceCount = deviceEnum.Count;
	if (deviceCount > 0) {
		var el = document.createElement("OPTION");
		el.text = "请选择UKey设备";
		el.value = -1;
		ctrlKeyList.add(el);

		for (var n = 0; n < deviceCount; n++) {
			var device = new ActiveXObject("ZJCAKeyManager.ZJCADevice.1");
			if (device != null) {
				try {
					deviceEnum.get_Item(n, device);
					var deviceLabel = device.Label;
					var deviceSN = device.SN;
					var el = document.createElement("OPTION");
					el.text = deviceLabel + "(" + deviceSN + ")";
					el.value = n;
					ctrlKeyList.add(el);
				}
				catch (e) {
				}
				deviceArray.push(device);
			}
		}
	}
	else {
		var el = document.createElement("OPTION");
		el.text = "未发现任何ZJCA UKey设备";
		el.value = -1;
		ctrlKeyList.add(el);
	}
}
/*
 *	设备事件响应函数
 */
function zjca_OnKeyChanged(name, index, type) {
	//alert("zjca_OnKeyChanged:" + name);
	zjca_FillKeyList(document.form1.selKeys, deviceCurType);
}
/*
 *	获取设备内的证书对象
 */
function zjca_GetCert(devType, key, isSign) {	
	var certSel = null;
	try{
		var certCnt = deviceSel.CertificateCount;
		for (var index = 0; index < certCnt; index++) {
			var cert = new ActiveXObject("ZJCAKeyManager.ZJCACertificate.1");
			deviceSel.get_Certificate(index, cert);
			if ((devType==2)&&(cert.KeyType!=1) || (devType==3)&&(cert.KeyType!=2)) {
				continue;
			}
			if ((cert.KeyUsage==1)&&!isSign || (cert.KeyUsage==2)&&isSign) {
				continue;
			}
			certSel = cert;
			break;
		}
	}
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}
		else {
			alert("操作失败!");
		}	
	}		
	
	return certSel;	
}
/*
 *	解析证书内容，certString为Base64格式的证书内容。
 */
function zjca_ParseCertificate(certString) {
	var certificate = new ActiveXObject("ZJCAKeyManager.ZJCACertificate.1");
	try {
		certificate.FromString(certString);
	} catch (e) {
		alert(typeof (e) + " error " + e.number + ": " + e.description);
		certificate = null;
	}
	return certificate;
}

/*
 *	解析签名，signedData为Base64格式的签名内容。
 */	
function zjca_ParseSignature(signedData) {
    var signature = new ActiveXObject("ZJCAKeyManager.ZJCASignedData.1");
	try {
		signature.FromString(signedData);
		return signature;
	}
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}	
		else {
			alert("操作失败!");
		}	
}
	
	return null;	
}
/*
 *	签名数据
 */	
function zjca_SignMsg(key, msg, format) {
    var signature = new ActiveXObject("ZJCAKeyManager.ZJCASignedData.1");
	try {
		if (2 == deviceCurType) {		//2:RSA设备
			key.Sign(1, 	　       	//当前的证书算法(1:RSA证书；2:SM2证书)
					 msg, 				//待签名的原文
					 3,					//字符集,1:GBK(ASCII),2:UNICODE,3:UTF-8
					 "", 				//签名者信息，默认为空
					 format, 			//签名封装格式，建议：当为RSA设备时使用P7格式封装；当为SM2设备时使用P1格式封装。
					 7,					//签名属性标记(只对RSA P7格式的签名有效)，7:表明签名包含证书、原文和事件戳信息(ZJCA_SIGNATTACH_CERT | ZJCA_SIGNATTACH_MSG | ZJCA_SIGNATTACH_TIME) 
					 signature);		//返回的签名对象	
		}
		else if (3 == deviceCurType) {	//3:SM2设备
			key.Sign(2, 	　       	//当前的证书算法(1:RSA证书；2:SM2证书)
					 msg, 				//待签名的原文
					 3,					//字符集,1:GBK(ASCII),2:UNICODE,3:UTF-8
					 "1234567812345678",//SM3中的UserID，默认为"1234567812345678"
					 format, 			//签名封装格式，建议：当为RSA设备时使用P7格式封装；当为SM2设备时使用P1格式封装。
					 0,				 	//签名属性标记(忽略) 
					 signature);		//返回的签名对象	
		}
		else {
			alert("证书类型错误！");
		}
		return signature.ToString();		
	}
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}			
		else {
			alert("操作失败!");
		}	
	}
	
	return "";
}
/*
 *	签名文件数据
 */	
function zjca_SignFile(key, file, format) {	
    var signature = new ActiveXObject("ZJCAKeyManager.ZJCASignedData.1");
	var streamfactory = new ActiveXObject("ZJCAKeyManager.ZJCAStreamFactory.1");
	var fileStream = streamfactory.GetFileStream(file, 1);	
	if (fileStream == null) {
		alert("打开文件失败！");
		return;
	}	
	try {
		if (2 == deviceCurType) {		//2:RSA设备
			key.Sign(1, 	　       	//当前的证书算法(1:RSA证书；2:SM2证书)
					 fileStream,        //待签名的文件流对象
					 0,					//字符编码集，当输入为文件对象时忽略。
					 "",                //签名者信息，默认为空
					 format,            //签名封装格式，建议：当为RSA设备时使用P7格式封装；当为SM2设备时使用P1格式封装。
					 5, 				//签名属性标记(只对P7格式的签名有效)，5:表明签名包含证书和事件戳信息(ZJCA_SIGNATTACH_CERT | ZJCA_SIGNATTACH_TIME)，对文件签名时，不能使用标记ZJCA_SIGNATTACH_MSG！！！
					 signature);	    //返回的签名对象
		}
		else if (3 == deviceCurType) {	//3:SM2设备
			key.Sign(2, 	　       	//当前的证书算法(1:RSA证书；2:SM2证书)
					 fileStream,        //待签名的文件流对象
					 0,					//字符编码集，当输入为文件对象时忽略。
					 "1234567812345678",//签名者信息，默认为空
					 format,            //签名封装格式，建议：当为RSA设备时使用P7格式封装；当为SM2设备时使用P1格式封装。
					 0, 				//签名属性标记，忽略
					 signature);	    //返回的签名对象
		}
		else {
			alert("证书类型错误！");
		}				
	}
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}			
		else {
			alert("操作失败!");
		}	
	}		
	streamfactory.CloseStream(fileStream);
	return signature.ToString();	
}
/*
 *	签名URL数据
 */
function zjca_SignUrl(key, Url, format) {
	return "";		
}
/*
 *	验证数据签名
 */	
function zjca_VerifyMsg(key, cert, signature, msg) {
	var certObj = null;
	var pass = false;
	try {
		if (typeof cert == "string"){
			certObj = zjca_ParseCertificate(cert);
		}
		else {
			certObj = cert;
		}
		if(!certObj) {
			return false;
		}
		if (1 == certObj.KeyType) {		//验证RSA签名
			pass = key.Verify(msg, 3, signature, "", certObj);
		}
		else if(2 == certObj.KeyType) {	//验证SM2签名
			pass = key.Verify(msg, 3, signature, "1234567812345678", certObj);
		}
		return pass;
	}
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}		
		else {
			alert("操作失败!");
		}		
	}
	
	return false;
}
/*
 *	验证文件数据签名
 */
function zjca_VerifyFile(key, cert, signature, fileStream) {	
	var certObj = null;
	var pass = false;
	try {
		if (typeof cert == "string"){
			certObj = zjca_ParseCertificate(cert);
		}
		else {
			certObj = cert;
		}
		if(!certObj) {
			return false;
		}
		if (1 == certObj.KeyType) {		//验证RSA签名
			pass = key.Verify(fileStream, 3, signature, "", certObj);
		}
		else if(2 == certObj.KeyType) {	//验证SM2签名
			pass = key.Verify(fileStream, 3, signature, "1234567812345678", certObj);
		}
	}		
	catch(e) {
		if (e.message != "") {
			alert(e.message);
		}		
		else {
			alert("操作失败!");
		}		
	}
	return pass;	
}
/*
 *	验证URL数据签名
 */
function zjca_VerifyUrl(key, cert, signature, Url) {
	return "";		
}
