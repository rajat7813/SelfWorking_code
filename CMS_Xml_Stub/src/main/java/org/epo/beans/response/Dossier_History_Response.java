package org.epo.beans.response;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Dossier_History_Response {

	@JsonProperty("DOSSIERNUMBER")
	private String dossierNumber;
	@JsonProperty("APPLICATIONNUMBER")
	private String applicationNumber;
	@JsonProperty("CaseId")
	private String caseId;
	@JsonProperty("HTY_ID")
	private String htyId;
	@JsonProperty("TYPEOFLOG")
	private String typeOfLog;
	@JsonProperty("DESCRIPTION")
	private String description;
	@JsonProperty("USERNAME")
	private String userName;
	@JsonProperty("STATUSHISTORY")
	private String statusHistory;
	@JsonProperty("EVENTCODETOVALIDATE")
	private String eventCodeToValidate;
	@JsonProperty("DATEOFLOG")
	private String dateOfLog;
	@JsonProperty("DATETIMESTAMP")
	private String dateTimeStamp;
	@JsonProperty("SE38_Explanation")
	private String se38Explanation;
	@JsonProperty("SE38_Result")
	private String se38Result;
	
	public String getDossierNumber() {
		return dossierNumber;
	}
	public void setDossierNumber(String dossierNumber) {
		this.dossierNumber = dossierNumber;
	}
	public String getApplicationNumber() {
	    return applicationNumber;
	}
	public void setApplicationNumber(String applicationNumber) {
	    this.applicationNumber = applicationNumber;
	}
	public String getCaseId() {
		return caseId;
	}
	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}
	public String getHtyId() {
		return htyId;
	}
	public void setHtyId(String htyId) {
		this.htyId = htyId;
	}
	public String getTypeOfLog() {
		return typeOfLog;
	}
	public void setTypeOfLog(String typeOfLog) {
		this.typeOfLog = typeOfLog;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStatusHistory() {
		return statusHistory;
	}
	public void setStatusHistory(String statusHistory) {
		this.statusHistory = statusHistory;
	}
	public String getEventCodeToValidate() {
		return eventCodeToValidate;
	}
	public void setEventCodeToValidate(String eventCodeToValidate) {
		this.eventCodeToValidate = eventCodeToValidate;
	}
	public String getDateOfLog() {
		return dateOfLog;
	}
	public void setDateOfLog(String dateOfLog) {
		this.dateOfLog = dateOfLog;
	}
	public String getDateTimeStamp() {
		return dateTimeStamp;
	}
	public void setDateTimeStamp(String dateTimeStamp) {
		this.dateTimeStamp = dateTimeStamp;
	}
	public String getSe38Explanation() {
		return se38Explanation;
	}
	public void setSe38Explanation(String se38Explanation) {
		this.se38Explanation = se38Explanation;
	}
	public String getSe38Result() {
		return se38Result;
	}
	public void setSe38Result(String se38Result) {
		this.se38Result = se38Result;
	}	
	
	
}
