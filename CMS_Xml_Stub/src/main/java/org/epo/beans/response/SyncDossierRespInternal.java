package org.epo.beans.response;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SyncDossierRespInternal {

	@JsonProperty("EH01_Result")
	private String eh01Result;
	
	@JsonProperty("EH01_Explanation")
	private String eh01Explanation;
	
	@JsonProperty("http_errorcode")
	private String httpErrorCode;
	
	@JsonProperty("CaseID")
	private String caseId;
	
	@JsonProperty("RES_ID")
	private String resId;

	public String getEh01Result() {
		return eh01Result;
	}

	public void setEh01Result(String eh01Result) {
		this.eh01Result = eh01Result;
	}

	public String getEh01Explanation() {
		return eh01Explanation;
	}

	public void setEh01Explanation(String eh01Explanation) {
		this.eh01Explanation = eh01Explanation;
	}

	public String getHttpErrorCode() {
		return httpErrorCode;
	}

	public void setHttpErrorCode(String httpErrorCode) {
		this.httpErrorCode = httpErrorCode;
	}

	public String getCaseId() {
		return caseId;
	}

	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}	
	
}
