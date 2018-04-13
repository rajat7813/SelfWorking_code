package org.epo.userDetails;

import java.io.Serializable;

/**
 * 
 * @author narsing
 * pojo class for user and role mapping. 
 * Date : 05-June-2017
 */
public class UserRoleMapping implements Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 1L;
	private String role;
	private String startDate;
	private String endDate;
	private String userId;
	private String directorate;

	/**
	 * default constructor stub
	 */
	public UserRoleMapping() {
		super();
	}

	/**
	 * @return the role.
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set.
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the startDate.
	 */
	public String getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate the startDate to set.
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate.
	 */
	public String getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate the endDate to set.
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the userId.
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set.
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the directorate.
	 */
	public String getDirectorate() {
		return directorate;
	}

	/**
	 * @param directorate the directorate to set.
	 */
	public void setDirectorate(String directorate) {
		this.directorate = directorate;
	}
}
