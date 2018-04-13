package org.epo.beans.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CmsStubModel {
	@JsonProperty("SE38History") 
	private List<Dossier_History_Response> sE38History;
	
	@JsonProperty("SE38History") 
	public List<Dossier_History_Response> getsE38History() {
		return sE38History;
	}
	@JsonProperty("SE38History") 
	public void setsE38History(List<Dossier_History_Response> sE38History) {
		this.sE38History = sE38History;
	}

	

	

}
