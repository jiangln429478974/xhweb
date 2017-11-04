package com.qyxx.client;

import java.io.IOException;   
import java.io.InputStream;   
import java.security.KeyStore;   
import java.security.KeyStoreException;   
import java.security.NoSuchAlgorithmException;   
import java.security.UnrecoverableKeyException;   
import java.security.cert.CertificateException;   

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.KeyManager;   
import javax.net.ssl.KeyManagerFactory;   
import javax.net.ssl.TrustManager;   
import javax.net.ssl.TrustManagerFactory;   

import org.apache.cxf.configuration.jsse.TLSClientParameters;   
import org.apache.cxf.endpoint.Client;   
import org.apache.cxf.frontend.ClientProxy;  
import org.apache.cxf.transport.http.HTTPConduit;  
import org.apache.cxf.binding.soap.saaj.SAAJOutInterceptor;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.ws.security.wss4j.WSS4JOutInterceptor;
import org.apache.ws.security.WSConstants;
import org.apache.ws.security.handler.WSHandlerConstants;
import org.springframework.context.ApplicationContext;

import com.alibaba.fastjson.JSON;
import com.qyxx.service.IQyxxService;


public class QyxxServiceSSLClient_yc {

	private final static String trustStore = "truststore_yc.jks";
    private final static String keyStore = "client_yc.jks";   
    private final static String trustStorePass = "123456";   
    private final static String keyStorePass = "1234"; 
	
	public static void main (String[] args)throws Exception{
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		//添加验证
		   Map<String, Object> outProps = new HashMap<String, Object>();
	       outProps.put(WSHandlerConstants.ACTION,WSHandlerConstants.USERNAME_TOKEN);
	       outProps.put(WSHandlerConstants.USER, "admin");
	       outProps.put(WSHandlerConstants.PASSWORD_TYPE, WSConstants.PW_TEXT);
	       outProps.put(WSHandlerConstants.PW_CALLBACK_CLASS, ClientPasswordCallback.class.getName());
	       WSS4JOutInterceptor wssOut = new WSS4JOutInterceptor(outProps);
	       factory.getOutInterceptors().add(wssOut);
	       factory.getOutInterceptors().add(new SAAJOutInterceptor());
		
        factory.setServiceClass(IQyxxService.class);
//        factory.setAddress("https://localhost:8443/zxwebservice/QyxxWebService");
        factory.setAddress("https://60.190.2.174:8443/ggwebservice/QyxxWebService");
        //测试的时候，必需替换两个CA文件
        IQyxxService client = (IQyxxService) factory.create();
         
        
        Client proxy = ClientProxy.getClient(client);
        HTTPConduit conduit = (HTTPConduit) proxy.getConduit();
        TLSClientParameters tlsParams = conduit.getTlsClientParameters();
        if (tlsParams == null) {   
            tlsParams = new TLSClientParameters();   
        }   
        tlsParams.setSecureSocketProtocol("SSL");   
        tlsParams.setKeyManagers(getKeyManagers());   
        tlsParams.setTrustManagers(getTrustManagers());
        conduit.setTlsClientParameters(tlsParams);
        //String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETBGXXBYNBXH","","" ,"","","3302270110130448","");
//        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETQYXXLIST","余姚市成功文具制造有限公司","" ,"","","","");
//        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETQYDJBYNBXHFROMKY","","" ,"","","3302270110130448","");
//        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETQYDJBYNBXHFROMZX","","" ,"","","3302820130206730","");
//        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETBGXXBYNBXH","","" ,"","","3302270110130448","");
        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETDATA","","" ,"","","3302810120133485","");
//        String msg2= client.getMethod("FAGAIWEI","122.227.235.163","GETDETAIL","","" ,"","","3302810120133485","");
        
        System.out.println(msg2);
        Map map=JSON.parseObject(msg2,Map.class);
        String ID=(String)map.get("ID");
        System.out.println(ID);
        //返回是MAP的时候用
//        Map msgMap=(Map)map.get("MSG");
//        System.out.println(msgMap.get("QYMC"));
        //返回是list的时候用
//        List msgList=(List)map.get("MSG");
//        for(int i=0;i<msgList.size();i++ ){
//     	  Map msgMap=(Map)msgList.get(i);
//     	  System.out.println(msgMap.get("QYMC"));
//        }
	}
	
	

	private static TrustManager[] getTrustManagers() throws IOException {   
        try {   
            String alg = TrustManagerFactory.getDefaultAlgorithm();   
            TrustManagerFactory factory = TrustManagerFactory.getInstance(alg);   
            InputStream fp = QyxxServiceSSLClient_yc.class.getResourceAsStream(trustStore);   
            KeyStore ks = KeyStore.getInstance("JKS");   
            ks.load(fp, trustStorePass.toCharArray());   
            fp.close();   
            factory.init(ks);   
            TrustManager[] tms = factory.getTrustManagers();   
            return tms;   
        } catch (NoSuchAlgorithmException e) {   
            e.printStackTrace();   
        } catch (KeyStoreException e) {   
            e.printStackTrace();   
        } catch (CertificateException e) {   
            e.printStackTrace();   
        }   
        return null;   
    }   
       
    private static KeyManager[] getKeyManagers() throws IOException {   
        try {   
            String alg = KeyManagerFactory.getDefaultAlgorithm();   
            KeyManagerFactory factory = KeyManagerFactory.getInstance(alg);   
            InputStream fp = QyxxServiceSSLClient_yc.class.getResourceAsStream(keyStore);   
            KeyStore ks = KeyStore.getInstance("JKS");   
            ks.load(fp, keyStorePass.toCharArray());   
            fp.close();   
            factory.init(ks, keyStorePass.toCharArray());   
            KeyManager[] keyms = factory.getKeyManagers();   
            return keyms;   
        } catch (NoSuchAlgorithmException e) {   
            e.printStackTrace();   
        } catch (KeyStoreException e) {   
            e.printStackTrace();   
        } catch (CertificateException e) {   
            e.printStackTrace();   
        } catch (UnrecoverableKeyException e) {   
            e.printStackTrace();   
        }   
        return null;   
    }   
}
