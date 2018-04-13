package com.edyt.mock.controllers.bi;

import com.edyt.mock.domain.deputisation.Deputisation;
import com.edyt.mock.domain.deputisation.DeputisationWrapper;
import com.edyt.mock.domain.deputisation.FunctionalRoleFromRequest;
import com.edyt.mock.domain.deputisation.FunctionalRolePayload;
import com.edyt.mock.domain.deputisation.FunctionalRoleSettingsPayload;
import com.edyt.mock.domain.deputisation.RevokeRoleConfirmation;
import com.edyt.mock.domain.deputisation.RevokeRoleRequest;
import com.edyt.mock.domain.deputisation.UpdateDeputisationRequest;
import com.edyt.mock.service.DeputisationService;
import com.edyt.mock.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.Collections;

@RestController
public class AccountController {

    public static final String FIRST_USER_ON_LIST_ID = "TB89033";
    public static final String FIRST_USER_ON_LIST_CASE_ID = "55680";
    @Autowired
    private DeputisationService deputisationService;

    @RequestMapping(path = "/restServices/ui/AccountManagement/ChangeFunctionalRoleSettings/{caseId}",
            method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<String> revokeRole(@PathVariable String caseId, @RequestBody FunctionalRoleSettingsPayload payload,
                                             @RequestParam(name = "FunctionalRoleRecordId", required = true) String roleId) throws IOException {
        FunctionalRoleFromRequest role = payload.getContent().getRole();
        deputisationService.revokeRole(role, roleId);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/accountsSortingOptions", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> accountsSortingOptions() {
        return ResponseUtil.serveJsonResource("bi/account/accountSortingOptions.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/AddNewFunctionalRoleV2/{caseId}", method = RequestMethod.POST,
            consumes = "application/json")
    public ResponseEntity<String> assignRole(@PathVariable String caseId, @RequestBody FunctionalRolePayload payload) throws IOException {
        FunctionalRoleFromRequest role = payload.getContent().getRole();

        deputisationService.assignRole(role);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/Functionalroles", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> currentRoles(@PathVariable String caseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/functional-roles.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToMe", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedRolesToMe(@PathVariable String caseId,
                                                                @RequestParam(name = "StatusAccountRole", required = true) String status) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-me.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToOthers", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedToOthers(@PathVariable String caseId,
                                                               @RequestParam(name = "CurrStatusAccountRole", required = true) String status) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-others.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToMeHistory", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedRolesToMeHistory(@PathVariable String caseId,
                                                                       @RequestParam(name = "StatusAccountRole", required = true) String status) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-me-history.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToOthersHistory", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedToOthersHistory(@PathVariable String caseId,
                                                                      @RequestParam(name = "CurrStatusAccountRole", required = true) String status) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-others-history.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToMe/{roleId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedRolesToMeRecord(@PathVariable String caseId, @PathVariable String roleId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-me-history-record.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToMeHistory/{roleId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedRolesToMeHistoryRecord(@PathVariable String caseId, @PathVariable String roleId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-me-history-record.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToOthers/{roleId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedToOthersRecord(@PathVariable String caseId, @PathVariable String roleId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-others-history-record.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/FunctionalRolesDeputisedToOthersHistory/{roleId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisedToOthersHistoryRecord(@PathVariable String caseId, @PathVariable String roleId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/deputised-to-others-history-record.json");
    }

    @RequestMapping(path = "/restServices/Account/AccountRoles/{caseId}/TRUE", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> deputisable(@PathVariable String caseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/account-roles.json");
    }

    @RequestMapping(path = "/restServices/GetAccountDetails/{UserID}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getAccount(@PathVariable("UserID") String userId) throws IOException {
        if (userId.equals(FIRST_USER_ON_LIST_ID)) {
            return ResponseUtil.serveJsonResource("bi/account/m1-get_account-other.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/account/m1-get_account.json");
        }
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ListAccounts", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> listAccounts() throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/m1-list_accounts.json");
    }

    @RequestMapping(path = "/restServices/AccountRoleV1/{RecordID}", method = RequestMethod.POST,
            consumes = "application/json",
            produces = "application/json")
    public ResponseEntity<ClassPathResource> createDeputisation(@PathVariable("RecordID") String deputisationRole,
                                                                @RequestBody DeputisationWrapper deputisationWrapper) {
        Deputisation deputisation = new Deputisation(deputisationWrapper.getDeputisationRequest());
        if (deputisationRole.equals("54401")) {
            deputisation.setAccountroledetailroletype("Stock Manager");
        } else {
            deputisation.setAccountroledetailroletype("examiner");
        }
        deputisation.setAccountrolestatuscode("Proposed");
        deputisation.setAccountroledetailtype("Techical field: xxx, yyy, zzz");
        deputisation.setAssigneefullname(deputisation.getAccountroleaccount());
        deputisationService.saveDeputisation(deputisation);
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        return ResponseUtil.serveJsonResource("bi/account/m1-deputise_response.json");
    }

    @RequestMapping(path = "/restServices/AccountRoleStatusV1/{accountRoleId}", method = RequestMethod.POST,
            consumes = "application/json",
            produces = "application/json")
    public ResponseEntity<ClassPathResource> updateDeputisation(@PathVariable String accountRoleId,
                                                                @RequestBody UpdateDeputisationRequest updateDeputisation) {
        deputisationService.updateDeputisation(accountRoleId, updateDeputisation.getAM06_Request().getAccountRoleStatusCode());
        return ResponseUtil.serveJsonResource("bi/account/put-account-role-status-success.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ServiceRemoveFunctionalRole/{caseId}", method = RequestMethod.POST,
            consumes = "application/json")
    public ResponseEntity<String> removeRole(@PathVariable String caseId, @RequestBody RevokeRoleRequest payload) {
        RevokeRoleConfirmation confirmation = payload.getObjects().getConfirmation();
        if (confirmation.getCaseId() != null && confirmation.getQuestion() != null && confirmation.getRecordId() != null)
        {
            return new ResponseEntity<>(HttpStatus.OK);
        } else{
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ListAccountTypes", produces = "application/json")
    public ResponseEntity<ClassPathResource> listAccountTypes() {
        return ResponseUtil.serveJsonResource("bi/account/list-account-types.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ListOrgAccounts", produces = "application/json")
    public ResponseEntity<ClassPathResource> listOrganisationalAccounts() {
        return ResponseUtil.serveJsonResource("bi/account/list-organisational-accounts.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/OrgansationalRelations", produces = "application/json")
    public ResponseEntity<ClassPathResource> getOrganisationalRelations() {
        return ResponseUtil.serveJsonResource("bi/account/organisational-relations.json");
    }

    @RequestMapping(path = "restServices/ui/AccountManagement/FindStockManager", produces = "application/json")
    public ResponseEntity<ClassPathResource> findStockManager() {
        return ResponseUtil.serveJsonResource("bi/account/find-stock-manager.json");
    }

    @RequestMapping(path = "restServices/ListCandidateDeputies/{roleId}", produces = "application/json")
    public ResponseEntity<ClassPathResource> getListCandidateDeputies(@PathVariable("roleId") String roleId) {
        return ResponseUtil.serveJsonResource("bi/account/list-candidate-deputies.json");
    }

    @RequestMapping(path = "restServices/ListCandidateDeputiesAdvancedSearch/{roleId}", produces = "application/json")
    public ResponseEntity<ClassPathResource> getListCandidateDeputiesAdvancedSearch(@PathVariable("roleId") String roleId) {
        return ResponseUtil.serveJsonResource("bi/account/list-candidate-deputies-advanced-search.json");
    }

    @RequestMapping(path = "restServices/GetTechnicalFieldsFromDirectorate/{recordId}", produces = "application/json")
    public ResponseEntity<ClassPathResource> getTechnicalFieldsFromDirectorate(@PathVariable("recordId") String recordId) {
        if (recordId.equals("798777")) {
            ClassPathResource resource = new ClassPathResource("bi/account/get-technical-fields-from-directorate-error.json");
            MultiValueMap<String, String> responseHeaders = new HttpHeaders();
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
            return new ResponseEntity<>(resource, responseHeaders, HttpStatus.BAD_REQUEST);
        }
        if (recordId.equals("798999")){
            ClassPathResource resource = new ClassPathResource("bi/account/get-technical-fields-from-directorate-no-case.json");
            MultiValueMap<String, String> responseHeaders = new HttpHeaders();
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
            return new ResponseEntity<>(resource, responseHeaders, HttpStatus.NOT_FOUND);
        }

        return ResponseUtil.serveJsonResource("bi/account/get-technical-fields-from-directorate.json");
    }

    @RequestMapping(path = "restServices/ui/AccountManagement/ListOrgAccounts/{recordId}/RelatedUserAccounts", produces = "application/json")
    public ResponseEntity<ClassPathResource> getRelatedUserAccounts(@PathVariable("recordId") String recordId) {
        return ResponseUtil.serveJsonResource("bi/account/related-user-accounts.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-user_account/{caseId}/UserCaseUpdates", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getUserCaseUpdates(@PathVariable String caseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/user-case-updates.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-org_account/{caseId}/OrganisationalDetails", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getOrganisationalDetailsByUnit(@PathVariable String caseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/organisational_details_by_unit.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/caseview-org_account/{caseId}/OrganisationalRelations", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getOrganisationalRelationsByUnit(@PathVariable String caseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/account/organisational_relations_by_unit.json");
    }
}
