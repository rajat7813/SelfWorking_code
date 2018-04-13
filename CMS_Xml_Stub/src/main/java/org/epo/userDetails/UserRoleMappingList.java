package org.epo.userDetails;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * @author narsing
 * pojo class for user and role mapping. 
 * Date : 05-June-2017
 */
public class UserRoleMappingList implements Serializable {

	@JsonProperty("USERROLEMAPPINGLIST") 
	List<UserRoleMapping> userRoleMappingList;// = new ArrayList<UserRoleMapping>();

	/**
	 * @return the userRoleMappingList
	 */
	@JsonProperty("USERROLEMAPPINGLIST") 
	public List<UserRoleMapping> getUserRoleMappingList() {
		return userRoleMappingList;
	}

	/**
	 * @param userRoleMappingList the userRoleMappingList to set
	 */
	@JsonProperty("USERROLEMAPPINGLIST") 
	public void setUserRoleMappingList(List<UserRoleMapping> userRoleMappingList) {
		this.userRoleMappingList = userRoleMappingList;
	}

	
}
