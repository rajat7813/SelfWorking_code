package org.epo.service.impl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.epo.exception.CustomException;
import org.epo.service.PropertyFileReaderService;
import org.epo.util.Constants;

/**
 * Reads tocConfig properties for getting custom property
 * @author amigarg
 * 
 */

public class PropertyFileReaderServiceImpl implements PropertyFileReaderService {


	private static final Logger logger = LogManager.getLogger(PropertyFileReaderServiceImpl.class);
	private Properties prop = new Properties();
	private Map<String, String> hmap = new HashMap<String, String>();
	
	/**
	 * 
	 * @throws CustomException
	 */
	public PropertyFileReaderServiceImpl() {

		try {

			String fileName = System.getProperty("jboss.server.config.dir") + "\\config.properties";
			InputStream in = new FileInputStream(fileName);
			prop.load(in);

			for (String key : prop.stringPropertyNames()) {
				String value = prop.getProperty(key);
				hmap.put(key, value);
			}

		} catch (IOException ex) {			
			logger.info(Constants.ERROR+ "PropertyFileReaderServiceImpl at :"+ex.getMessage()+ Calendar.getInstance().getTime());
		}
	}

	/**
	 * return property file valües
	 */
	public String getValue(String key) {

		if (key != null && !key.isEmpty()) {
			return hmap.get(key);
		}
		return null;

	}

	/**
	 * return LAL URL
	 */
	public String getInstancesForLAL(String paramString) {
		return getValue(Constants.HOST_FOR_LALSERVICE) + paramString +"?includeBlobs=true";
	}

	/**
	 * return DSL URL
	 */
	public String getInstancesForDSL(String paramString) {
		return getValue(Constants.HOST_FOR_DSLSERVICE) + paramString;
	}

}
