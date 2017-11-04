var CAPICOM_CURRENT_USER_STORE = 2;
var CAPICOM_STORE_OPEN_READ_ONLY = 0;
var CAPICOM_ENCODE_BASE64 = 0;
var CAPICOM_ENCODE_BINARY = 1;
 
var CAPICOM_INFO_SUBJECT_SIMPLE_NAME = 0;
var CAPICOM_INFO_ISSUER_SIMPLE_NAME = 1;
var CAPICOM_INFO_SUBJECT_EMAIL_NAME = 2;
var CAPICOM_INFO_ISSUER_EMAIL_NAME = 3;
var CAPICOM_CERTIFICATE_FIND_KEY_USAGE = 12 ;
var CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE = 128  ;
function SelectMySignCert()
{
       //cert store
	 
       var mystore = new ActiveXObject("CAPICOM.Store");
       
       mystore.Open(CAPICOM_CURRENT_USER_STORE,"My",CAPICOM_STORE_OPEN_READ_ONLY);
       var certs= mystore.Certificates.Find(CAPICOM_CERTIFICATE_FIND_KEY_USAGE,  CAPICOM_DIGITAL_SIGNATURE_KEY_USAGE, true);
//       var certs= mystore.Certificates ;
       //myca sign certs
//     var mycacerts= certs;
       var mycerts= new ActiveXObject("CAPICOM.Certificates"); 
       for(i=1;i<=certs.Count;i++)
       {
              //check issuer
              var issuer=certs.Item(i).SubjectName; 
//              alert(i+":"+issuer.indexOf("CN=ZJCA"));
//        if(issuer.indexOf("O=发改委信息中心")<0) 
//        	continue;
              if(issuer.indexOf("宁波中软信息服务有限公司")<0) 
              	continue;
        	 
         //not myca

    	  
              //check key usage
//        var ku=certs.Item(i).KeyUsage(); 
   
//        if(!ku.IsDigitalSignatureEnabled)   //not sign cert
//                     continue;
              //add
        
              mycerts.Add(certs.Item(i));
        
 
       }  
       
       if(mycerts.Count==0)
       {
    	   
              if(window.confirm("没有浙江ca签发的数字证书,请插入key后重试")==true)
                     return SelectMySignCert();
              else
                     return null;
       }
       
       
       
       //select cert
       var certsel= mycerts.Select("选择证书","请选择证书",false);
       if(certsel==null)return null;
        
       
       var cert= certsel.Item(1);
       
//     cert.Display();
       return cert;
}
 
function SignText(strtext)
{
       //select cert 
       var mysigncert= SelectMySignCert(); 
       if(mysigncert==null)return null; 
        
       //signed data
       var signer = new ActiveXObject("CAPICOM.Signer");
       signer.Certificate = mysigncert;
       var signeddata = new ActiveXObject("CAPICOM.SignedData");
       var utils = new ActiveXObject("CAPICOM.Utilities");
//       signeddata.Content = utils.BinaryStringToByteArray(strtext);
       
       signeddata.Content = '123456';
 
       var a = signeddata.Sign(signer,false,CAPICOM_ENCODE_BASE64);  
       return mysigncert.SubjectName;
}