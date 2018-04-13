package org.epo.service;

public interface PropertyFileReaderService {

	/**
	 * This method returns the value for a given key from properties file
	 * 
	 * @param key
	 * @return value as String
	 */
	public String getValue(String key);

	/**
	 * This method returns the host after concatenating it with paramString for
	 * LAL Api
	 * 
	 * @param paramString
	 * @return host as String
	 */
	public String getInstancesForLAL(String paramString);

	/**
	 * This method returns the host after concatenating it with paramString for
	 * DSL Api
	 * 
	 * @param paramString
	 * @return
	 */
	public String getInstancesForDSL(String paramString);

}