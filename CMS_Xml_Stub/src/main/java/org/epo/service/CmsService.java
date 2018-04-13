package org.epo.service;

import org.epo.beans.response.CmsStubModel;
import org.epo.beans.response.StubPermission;
import org.epo.beans.response.SyncDossierResponse;
import org.epo.exception.CustomException;
import org.epo.readDossier.DossierInfo;
import org.epo.readDossier.Example;
import org.epo.readDossier.ID06ReadDossier;
import org.epo.userDetails.ListUserAccounts;
import org.epo.userDetails.UserRoleMappingList;

public interface CmsService {
	CmsStubModel getHistoryResponse(String DossierNo) throws CustomException;
	SyncDossierResponse getSyncDossierResponse(String taskId) throws CustomException;		
	StubPermission getPermissionResponse(String UserId) throws CustomException;
	ListUserAccounts getUserDetailsResponse() throws CustomException;
	Example  getDossierDetails(String appNumber) throws CustomException;
	UserRoleMappingList getRoleNameForUser(String lalTaskId) throws CustomException;
	String insertDossierDetails(DossierInfo dossierInfo) throws CustomException;
	String getDocMasterData() throws CustomException;
}
