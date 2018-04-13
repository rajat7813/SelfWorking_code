package org.epo.beans.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SyncDossierResponse {
	
	
	private List<SyncDossierRespInternal> EH01Manageoccurrenceofevent;

	public List<SyncDossierRespInternal> getEH01Manageoccurrenceofevent() {
		return EH01Manageoccurrenceofevent;
	}

	@JsonProperty("EH01Manageoccurrenceofevent") 
	public void setEH01Manageoccurrenceofevent(List<SyncDossierRespInternal> eH01Manageoccurrenceofevent) {
		EH01Manageoccurrenceofevent = eH01Manageoccurrenceofevent;
	}

}
