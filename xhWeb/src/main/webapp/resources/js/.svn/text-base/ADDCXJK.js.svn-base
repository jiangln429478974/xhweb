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
		
		ajax3(); 
		if(obj1=="function49"){//异议处理 
			function49(obj2);
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