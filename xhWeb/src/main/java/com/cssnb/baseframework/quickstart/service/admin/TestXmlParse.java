package com.cssnb.baseframework.quickstart.service.admin;

import java.util.AbstractMap;
import java.util.HashMap;
import java.util.Map;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.converters.Converter;
import com.thoughtworks.xstream.converters.MarshallingContext;
import com.thoughtworks.xstream.converters.UnmarshallingContext;
import com.thoughtworks.xstream.io.HierarchicalStreamReader;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;

public class TestXmlParse {

	
	public static void xmlParse() {

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("name","白赟");
        map.put("home","ningbo");
        map.put("age", 26);
        
        XStream magicApi = new XStream();
        magicApi.registerConverter(new MapEntryConverter());
        magicApi.alias("user", Map.class);

        String xml = magicApi.toXML(map);
        System.out.println("Result of tweaked XStream toXml()");
        System.out.println(xml);

        Map<String, String> extractedMap = (Map<String, String>) magicApi.fromXML(xml);
        System.out.println("result map="+extractedMap);
        //assert extractedMap.get("name").equals("chris");
        //assert extractedMap.get("island").equals("faranga");

    }
	
	 public static class MapEntryConverter implements Converter {

	        public boolean canConvert(Class clazz) {
	            return AbstractMap.class.isAssignableFrom(clazz);
	        }

	        public void marshal(Object value, HierarchicalStreamWriter writer, MarshallingContext context) {

	            AbstractMap map = (AbstractMap) value;
	            for (Object obj : map.entrySet()) {
	                Map.Entry entry = (Map.Entry) obj;
	                writer.startNode(entry.getKey().toString());
	                Object val = entry.getValue();
	                if ( null != val ) {
	                    writer.setValue(val.toString());
	                }
	                writer.endNode();
	            }

	        }

	        public Object unmarshal(HierarchicalStreamReader reader, UnmarshallingContext context) {

	            Map<String, String> map = new HashMap<String, String>();

	            while(reader.hasMoreChildren()) {
	                reader.moveDown();

	                String key = reader.getNodeName(); // nodeName aka element's name
	                String value = reader.getValue();
	                map.put(key, value);

	                reader.moveUp();
	            }

	            return map;
	        }

	    }
}
