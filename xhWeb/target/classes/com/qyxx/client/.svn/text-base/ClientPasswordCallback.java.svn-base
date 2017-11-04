package com.qyxx.client;

import java.io.IOException;

import javax.security.auth.callback.Callback;   
import javax.security.auth.callback.CallbackHandler;   
import javax.security.auth.callback.UnsupportedCallbackException;   
import org.apache.ws.security.WSPasswordCallback;   

public class ClientPasswordCallback implements CallbackHandler{
	 public void handle(Callback[] callbacks) throws IOException,   
     UnsupportedCallbackException {   
 for(int i=0;i<callbacks.length;i++){   
     WSPasswordCallback ps=(WSPasswordCallback) callbacks[i];   
     ps.setPassword("cxfnbzxxt");   
     ps.setIdentifier("nbzxxt");   
 }   
	 }
}
