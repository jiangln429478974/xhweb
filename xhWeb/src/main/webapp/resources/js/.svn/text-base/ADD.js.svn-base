"use strict";
/* jshint node:true */


function adds(devType,obj1,obj2){

 
	var table = document.createElement("table");
	var div = document.createElement("div");
	table.className = "font-table";
	div.className = "div_update";
	var cacert = document.getElementById("cacert");
	var bgDiv = document.getElementById("bgDiv");
	var calogin2 = document.getElementById("calogin2");
	var calogin = document.getElementById("calogin"),
		radio = [],
		hidden = [],
		tr = [], 
		tr_2 = [],
		td_1 = [],
		td_2 = [],
		td_3 = [],
		td_4 = [],
		td_5 = [],
		td_6 = [],
		

		pCertificates = [];
	calogin.style.display = "block";
	bgDiv.style.display = "block";
//	calogin.removeAttribute("hidden");
//	bgDiv.removeAttribute("hidden");
    //获取设备数量
	var deviceCount = deviceEnum.Count;
    //遍历设备 
	var target1 = 2;//标记是否为sm2证书，2为初始值，0为是sm2证书
	var target2 = 2; //标记证书是否为rsa 证书，2为初始值，0 为是rsa证书
	var target3 = 1; //标记表头是否显示  为0时显示，1是初始值，2是以显示一次不用在显示
	 
	
	for (var n = 0; n < deviceCount; n++) { 
	    var device = new ActiveXObject("ZJCAKeyManager.ZJCADevice.1");
	    //获取设备对象
	    deviceEnum.get_Item(n, device);
        //遍历证书
	    var i = 0
	    
	    for ( ; i < device.CertificateCount; i++) {
	        var cert = new ActiveXObject("ZJCAKeyManager.ZJCACertificate.1");
            //获取证书对象
	        device.get_Certificate(i, cert); 
	        
	        
//	        
	        if (cert.KeyUsage == 1) {
//	            if((devType==2)&&(cert.KeyType!=1) || (devType==3)&&(cert.KeyType!=2)) 
//	               continue;
	            //保存证书对象 
	        	 if((devType==3)&&(cert.KeyType==2)){ 
	        		 pCertificates[n] = cert; 
	        		 if(target3!=2){
	        			 target3=0;
	        		 }
	        		if(target3==0) {
	        			var tr0 = document.createElement("tr");
	        			 var td00 = document.createElement("th");
	        			 var td01 = document.createElement("th");
	        			 var td02 = document.createElement("th");
	        			 var td03 = document.createElement("th");
	        			 var td04 = document.createElement("th");
	        			 var td05 = document.createElement("th");
	        			 
	        			 
	        			 var txt00 = document.createTextNode('选择');
	        			 var txt01 = document.createTextNode('使用者');
	        			 var txt02 = document.createTextNode('部门');
	        			 var txt03 = document.createTextNode('颁发者');
	        			 var txt04 = document.createTextNode('生效日期');
	        			 var txt05 = document.createTextNode('失效日期');
	        		     td00.appendChild(txt00);
	        		     td01.appendChild(txt01);
	        		     td02.appendChild(txt02);
	        		     td03.appendChild(txt03);
	        		     td04.appendChild(txt04);
	        		     td05.appendChild(txt05);
	        		     
	        		     tr0.appendChild(td00);
	        		     tr0.appendChild(td01);
	        		     tr0.appendChild(td02);
	        		     tr0.appendChild(td03);
	        		     tr0.appendChild(td04);
	        		     tr0.appendChild(td05);
	        			 table.appendChild(tr0);
	        			 target3 = 2;
	        		}
	        		 
	        		 
	        		 
	        		 
	        		 
	        	   radio[n] = document.createElement("input");
	 	           radio[n].type = "radio";
	 	           radio[n].value = n;
	 	           radio[n].name = "only";
	 	            
	 	           td_1[n] = document.createElement("td");
	 	           td_1[n].style.textAlign = "center";
	 	           tr[n] = document.createElement("tr");
	 	           
	 	           td_1[n].appendChild(radio[n]);
	 	           tr[n].appendChild(td_1[n]);
	 	          
	 	            td_2[n] = document.createElement("td");
	 	            var txt2 = document.createTextNode(cert.get_UserNode("CN=") );
	 	            td_2[n].appendChild(txt2);
	 	            tr[n].appendChild(td_2[n]);  
	 	           
	 	            td_3[n] = document.createElement("td");
	 	            var txt3= document.createTextNode(cert.get_UserNode("O="));
	 	            td_3[n].appendChild(txt3);
	 	            tr[n].appendChild(td_3[n]);  
	 	            
	 	            td_4[n] = document.createElement("td");
	 	            var txt4= document.createTextNode(cert.get_IssuerNode("CN="));
	 	            td_4[n].appendChild(txt4);
	 	            tr[n].appendChild(td_4[n]); 
	 	            
	 	            td_5[n] = document.createElement("td");
	 	            var txt5= document.createTextNode(cert.ValidFrom );
	 	            td_5[n].appendChild(txt5);
	 	            tr[n].appendChild(td_5[n]);
	 	            
	 	            td_6[n] = document.createElement("td");
	 	            var txt6= document.createTextNode(cert.ValidUntil);
	 	            td_6[n].appendChild(txt6);
	 	            tr[n].appendChild(td_6[n]);
	 	            
	 	            table.appendChild(tr[n]); 
	 	            
	 	           target1 = 0;
	 	            break;
	        	 }  else{
	        		 target2 = 0;
	        		 break;
	        	 }

	        } 
	        
	    }
	    
	    
	   
	}

	 if((target1 == 2) &&(target2 == 0)){
		 
// 		calogin.setAttribute("hidden");
//		bgDiv.setAttribute("hidden");  
 		calogin.style.display = "none";
		bgDiv.style.display = "block";
//		 alert('请插入新版数字证书，并更新数字证书客户端和驱动程序。如有问题，可联系87360806信用中心杨磊。');
		calogin2.style.display = "block"; 
         
     }else if((target1 == 2) &&(target2 == 2)){
//  		 calogin.setAttribute("hidden");
//		 bgDiv.setAttribute("hidden");
	 		calogin.style.display = "none";
			bgDiv.style.display = "none";
    	 alert('请插入数字证书后重新操作。');
     }
	 else{ 
	  
	var sure = document.createElement("input");
	sure.type = "button";
	sure.value = "确定";
	sure.style.cssText="margin-top:30px;";
	sure.className="btn btn-primary";
	var a = 0;
	table.onchange = function( event ){
		var event = event || window.event;
		a = event.target.value; 
		
	};

	

	var ex = document.createElement("input");
	ex.type = "button";
	ex.value = "取消";
	ex.className="btn btn-primary"; 
    ex.style.cssText="margin-top:30px;";
	
	var nbsp = document.createElement("span"); 
	nbsp.className = "nbsp";
	sure.onclick = function(e){
//		e.stopPropagation();
//		e.cancelBubble = true;
		var btnSigns = document.getElementsByTagName("input").btnSign;
		btnSigns.removeAttribute("disabled");
//		calogin.setAttribute("hidden");
//		bgDiv.setAttribute("hidden");

 		calogin.style.display = "none";
		bgDiv.style.display = "none";
        //选择证书后获取相应设备进行签名操作
		var device = new ActiveXObject("ZJCAKeyManager.ZJCADevice.1");
		deviceEnum.get_Item(a, device);
        //显示证书信息到文本框 
		ShowCertInfo(pCertificates[a]);
        //签名
		on_btnSign(device);
		cacert.removeChild(div);
		cacert.removeChild(table);
		cacert.removeChild(sure);
		cacert.removeChild(nbsp);
		cacert.removeChild(ex);	
		
		
		
		ajax2();
		if(obj1=="checkData0"){//异议处理
			checkData0(obj2);
		}else if(obj1=="casubmit0"){
			casubmit0(obj2);
		}else if(obj1=="checkYycl0"){
			checkYycl0(obj2);
		}else if(obj1=="toYyclHandle0"){
			toYyclHandle0(obj2);
		}else if(obj1=="checkDataYsk20"){
			checkDataYsk20(obj2); 
		}else if(obj1=="function7"){ // cj/cj_bmtj  getData
			function7(obj2);
		}else if(obj1=="function8"){ // cj/cj_bmtjgs getData 
			function8(obj2); 
		}else if(obj1=="function9"){ // cj/cj_bscx downDemo 
			function9(obj2);
		}else if(obj1=="function10"){  // cj/cj_bscx  nocj
			function10(obj2);
		}else if(obj1=="function11"){ // cj/cj_bscx  bjData
			function11(obj2);
		}else if(obj1=="function12"){ // cj/cj_bscx getData
			function12(obj2);
		}else if(obj1=="function13"){ // cj/cj_bscx yijianPiyue 
			function13(obj2);
		}else if(obj1=="function14"){// cj/cj_gstj  getData
			function14(obj2);
		}else if(obj1=="function15"){ // cj/cj_pladdcj downDemo
			function15(obj2);
		}else if(obj1=="function16"){ // cj/cj_pladdcj nocj
			function16(obj2);
		}else if(obj1=="function17"){// cj/cj_pladdcj  bjData  
			function17(obj2);
		}else if(obj1=="function18"){// cj/cj_pladdcj  getData
			function18(obj2);
		}else if(obj1=="function19"){// cj/cj_pladdcj yijianPiyue
			function19(obj2);
		}else if(obj1=="function20"){// cj/cj_list downDemo 
			function20(obj2);
		}else if(obj1=="function21"){// cj/cj_list nocj
			function21(obj2); 
		}else if(obj1=="function22"){// cj/cj_list/bjData
			function22(obj2);
		}else if(obj1=="function23"){// cj/cj_list/ bjData
			function23(obj2);
		}else if(obj1=="function24"){// cj/cj_list/yijianPiyue
			function24(obj2);
		}else if(obj1=="function25"){// cj/fqbm_list/bjData
			function25(obj2);
		}else if(obj1=="function26"){// cj/fqbm_list/cxData
			function26(obj2);
		}else if(obj1=="function27"){// cj/fqbm_list/zxqk
			function27(obj2);
		}else if(obj1=="function28"){// cj/fqbm_list/getData
			function28(obj2);
		}else if(obj1=="function29"){// cj/fqbm_list/yijianBiaoji
			function29(obj2);
		}else if(obj1=="function30"){// cj/fqbm_list/yijianJiechu
			function30(obj2);
		}else if(obj1=="function31"){//  cj/gsj_fqbm_list_manage/getData
			function31(obj2);
		}else if(obj1=="function32"){// cj/gsj_add_file/shareSub
			function32(obj2);
		}else if(obj1=="function33"){// cj/gsj_fqbm_list/bjData
			function32(obj2);
		}else if(obj1=="function34"){// cj/gsj_fqbm_list/cxData
			function34(obj2);
		}else if(obj1=="function35"){// cj/gsj_fqbm_list/addzxqk
			function35(obj2);
		}else if(obj1=="function36"){// cj/gsj_fqbm_list/getData
			function36(obj2);
		}else if(obj1=="function37"){// cj/gsj_fqbm_list/yijianBiaoji
			function37(obj2);
		}else if(obj1=="function38"){// cj/gsj_fqbm_list/yijianJiechu
			function38(obj2);
		}else if(obj1=="function39"){// cj/gsj_fqbm_list/updateAJ
			function39(obj2);
		}else if(obj1=="function40"){// cj/phbm_list/downDemo
			function40(obj2);
		}else if(obj1=="function41"){// cj/phbm_list/nocj
			function41(obj2);
		}else if(obj1=="function42"){// cj/phbm_list/bjData
			function42(obj2);
		}else if(obj1=="function43"){// cj/phbm_list/getData
			function43(obj2);
		}else if(obj1=="function44"){// cj/phbm_list/yijianPiyue
			function44(obj2);
		}else if(obj1=="function45"){// cj/yycl_handle/ goback
			function45(obj2);
		}else if(obj1=="function46"){// cj/yycl_handle/ handleData
			function46(obj2);
		}else if(obj1=="function47"){// cj/yycl_handle/ fb
			function47(obj2);
		}else if(obj1=="function48"){// cj/yycl_handle/ yyclExchange
			function48(obj2);
		}
		else if(obj1=="function60"){//zx/list findData
			function60(obj2);
		}
		else if(obj1=="function61"){//zx/list init
			function61(obj2);
		}
		else if(obj1=="function62"){//zx/list updateGK
			function62(obj2);
		}
		else if(obj1=="function63"){//zx/list updateNOGK
			function63(obj2);
		}
		else if(obj1=="function64"){//info/notice/notice_list deleteData
			function64(obj2);
		}
		else if(obj1=="function65"){//info/notice/notice_list fabuData
			function65(obj2);
		}
		else if(obj1=="function66"){//info/notice/notice_list cancelData
			function66(obj2);
		}
		else if(obj1=="function67"){//info/notice/notice_list yijianFabuData
			function67(obj2);
		}
		else if(obj1=="function68"){//info/notice/notice_list scheng
			function68(obj2);
		}
		else if(obj1=="function69"){//ftp/file_add_bm shareSub 
			function69(obj2);
		}
		else if(obj1=="function70"){//ftp/file_add_bm nodata 
			function70(obj2);
		}
		else if(obj1=="function71"){//ftp/file_add_bm deleteData 
			function71(obj2);
		}
		else if(obj1=="function72"){//ftp/file_add_hmd_manage shareSub 
			function72(obj2);
		}
		else if(obj1=="function73"){//ftp/file_add_hmd_manage nodata 
			function73(obj2); 
		}
		else if(obj1=="function74"){//ftp/file_add_hmd_manage deleteData 
			function74(obj2); 
		}
		else if(obj1=="function75"){//ftp/file_add_hmd_manage downFile 
			function75(obj2); 
		}
		else if(obj1=="function76"){//ftp/file_add_hmd shareSub 
			function76(obj2); 
		}
		else if(obj1=="function77"){//ftp/file_add_hmd nodata 
			function77(obj2); 
		}
		else if(obj1=="function78"){//ftp/file_add_hmd deleteData 
			function78(obj2); 
		}
		else if(obj1=="function79"){//ftp/file_add shareSub 
			function79(obj2); 
		}
		else if(obj1=="function80"){//ftp/file_add deleteData 
			function80(obj2); 
		}
		else if(obj1=="function81"){//ftp/file_add downFile 
			function81(obj2); 
		}
		else if(obj1=="function82"){//ftp/file_add downFile2 
			function82(obj2); 
		}
		else if(obj1=="function83"){//ftp/file_add bjData 
			function83(obj2); 
		}
		else if(obj1=="function84"){//ftp/file_add bjData2 
			function84(obj2); 
		}
		else if(obj1=="function85"){//sjbd/list downDemo 
			function85(obj2); 
		}
		else if(obj1=="function86"){//sjbd/list getData 
			function86(obj2); 
		}
		else if(obj1=="function87"){//sjbd/list updateBZ 
			function87(obj2); 
		}
		else if(obj1=="function88"){//sjbd/list2 downDemo 
			function87(obj2); 
		}
		else if(obj1=="function89"){//sjbd/list2 downDemo 
			function89(obj2); 
		}
		else if(obj1=="function90"){//info/notify/notify_info_fquery btn-search
			function90(obj2); 
		}
		else if(obj1=="function91"){//info/notify/notify_info_query btn-search
			function91(obj2); 
		}
		else if(obj1=="function92"){//yycl/yycl_info  bysl
			function92(obj2); 
		}
		else if(obj1=="function93"){//yycl/yycl_info  sl
			function93(obj2); 
		}
		else if(obj1=="function94"){//yycl/yycl_info  toYyclHandle //处理
			function94(obj2); 
		}
		else if(obj1=="function95"){//yycl/yycl_info  checkYycl   //查看
			function95(obj2); 
		}
		else if(obj1=="function96"){//yycl/yycl_info  yyclExchange//未使用
			function96(obj2); 
		}
		else if(obj1=="function97"){//yycl/yycl_info  yanqi2
			function97(obj2); 
		}
		else if(obj1=="function98"){//yycl/yycl_info  checkDataYsk2//数据核查
			function98(obj2); 
		}
		else if(obj1=="function99"){//yycl/yycl_info  yybz  //异议标注
			function99(obj2); 
		}else if(obj1=="function100"){//info/share_apply_check shareSub //审核操作
			function100(obj2); 
		}else if(obj1=="function101"){//cj/gsj_ycxx_list/update
			function101(obj2); 
		}else if(obj1=="function102"){//cj/gsj_ycxx_list/detail
			function102(obj2); 
		}else if(obj1=="function103"){//cj/cj_bscx/download
			function103(obj2); 
		}else if(obj1=="function104"){//info/share/share_apply_add/subData
			function104(obj2); 
		}else if(obj1=="function105"){//info/share/share_apply_bumen_check/shareSub
			function105(obj2); 
		}
	};
	ex.onclick = function(){
		var btnSigns = document.getElementsByTagName("input").btnSign;
		btnSigns.removeAttribute("disabled");
//		calogin.setAttribute("hidden");
//		bgDiv.setAttribute("hidden");
		calogin.style.display="none";
		bgDiv.style.display="none";
		cacert.removeChild(div);
		cacert.removeChild(table);
		cacert.removeChild(sure);
		cacert.removeChild(nbsp);
		cacert.removeChild(ex);
	};
	 cacert.appendChild(div);
	cacert.appendChild(table);
	cacert.appendChild(sure);
	cacert.appendChild(nbsp);
	cacert.appendChild(ex); 
	return false;
	   }
}