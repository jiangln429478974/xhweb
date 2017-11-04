 

function cazs_select(s_cabzf)
{   
 
	try{
	 var CAPICOM_CURRENT_USER_STORE = 2  
	var CAPICOM_MY_STORE = "My"  
	var CAPICOM_STORE_OPEN_READ_ONLY = 0  
	var CAPICOM_STORE_OPEN_EXISTING_ONLY = 128  
	var CAPICOM_CERTIFICATE_FIND_KEY_USAGE = 12  
	var CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE = 128  
	var CAPICOM_CERT_INFO_SUBJECT_EMAIL_NAME = 2  
	var CAPICOM_HASH_ALGORITHM_SHA1 = 0   
	var CAPICOM_VERIFY_SIGNATURE_AND_CERTIFICATE = 1  
	var CAPICOM_CERT_INFO_SUBJECT_SIMPLE_NAME = 0  
	var CAPICOM_CERT_INFO_ISSUER_SIMPLE_NAME = 1  
	var CAPICOM_CERT_INFO_SUBJECT_EMAIL_NAME = 2  
	var CAPICOM_CERT_INFO_ISSUER_EMAIL_NAME = 3  
	var CAPICOM_ENCODE_BASE64 = 0;  
	var CAPICOM_VERIFY_SIGNATURE_ONLY = 0;  
	
	
	var store = new ActiveXObject("CAPICOM.Store");  
    var oSigner = new ActiveXObject("CAPICOM.Signer");  
    var oSignedData = new ActiveXObject("CAPICOM.SignedData");   
    //store.Open(CAPICOM_CURRENT_USER_STORE, CAPICOM_MY_STORE,   
    //        CAPICOM_STORE_OPEN_READ_ONLY | CAPICOM_STORE_OPEN_EXISTING_ONLY);  
   
    store.Open(CAPICOM_CURRENT_USER_STORE,"My",CAPICOM_STORE_OPEN_READ_ONLY); 
    certs = store.Certificates.Find(CAPICOM_CERTIFICATE_FIND_KEY_USAGE,  CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE, true); 
  //  alert(certs );
//     alert(certs.Item(1).SerialNumber ); 
    // certs = store.Certificates ;    
    if(s_cabzf!=null){
    	
    	for(i=1;i<=certs.Count;i++)
    	{  
    		var issuer=certs.Item(i).SerialNumber;    
            if(issuer==s_cabzf) { 
            	 return issuer; 
            }
           	
 
    	} 
    	
    }
        
     }
     catch(e){ 
    	 return  "error"; 
     }
    
     var mycerts= certs.Select("选择证书","请选择证书",false);  
   
     return  mycerts.Item(1).SerialNumber; 
 
      
	 
	
 
     
    /* form1.passport.value= mycerts.Item(1).SerialNumber;
   // certs = certs.Select();//弹出证书选择框  
     var cert = mycerts (1);  
    oSigner.Certificate = cert; 
   // oSignedData.Content = "123456";  
   // var signResult = oSignedData.Sign(oSigner, false, CAPICOM_ENCODE_BASE64);  
   
   
    
    form1.submit(); */

       /*  var signature= SignText("999");  
       if(signature==null)return;
       form1.passport.value= signature; 
       form1.submit();   */
        
}