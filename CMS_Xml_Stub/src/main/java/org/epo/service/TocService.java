package org.epo.service;

import java.io.IOException;

import org.epo.beans.response.CmsStubModel;
import org.epo.beans.response.PermissionResponse;
import org.epo.beans.response.StubPermission;
import org.epo.exception.CustomException;
import org.epo.readDossier.Example;
import org.epo.readDossier.ID06ReadDossier;
import org.epo.userDetails.ListUserAccounts;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public interface TocService {
	CmsStubModel getHistoryResponse(String DossierNo)throws CustomException;
	StubPermission getPermissionResponse(String UserId) throws CustomException;
	ListUserAccounts getUserDetailsResponse()throws CustomException;
	Example  getDossierDetails ()throws CustomException;
}
