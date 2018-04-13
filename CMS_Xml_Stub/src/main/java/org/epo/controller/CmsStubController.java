package org.epo.controller;

import java.io.IOException;
import java.util.Collections;
import javax.servlet.http.HttpServletRequest;
import org.epo.beans.response.CmsStubModel;
import org.epo.beans.response.StubPermission;
import org.epo.beans.response.SyncDossierResponse;
import org.epo.exception.CustomException;
import org.epo.readDossier.DossierInfo;
import org.epo.readDossier.Example;
import org.epo.service.CmsService;
import org.epo.userDetails.ListUserAccounts;
import org.epo.userDetails.UserRoleMappingList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponses;
import io.swagger.annotations.ApiResponse;

/**
 * 
 * @author manokuma
 *
 */
@RestController
@RequestMapping("/BeInformed")
public class CmsStubController {
	private CmsService cmsService;

	@Autowired
	public CmsStubController(CmsService cmsService) {
		this.cmsService = cmsService;
	}

	@GetMapping("devaccount/restServices/GetHistory/{DossierNo}")
	public ResponseEntity<CmsStubModel> getApplicationApi(@PathVariable("DossierNo") String DossierNo,
			HttpServletRequest request) throws CustomException, IOException {

		CmsStubModel response = null;

		try {
			response = cmsService.getHistoryResponse(DossierNo);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<CmsStubModel>(response, HttpStatus.OK);
	}

	@GetMapping("devaccount/restServices/GetPermissions/{UserId}")
	public ResponseEntity<StubPermission> getPermissionsForUserId(@PathVariable("UserId") String UserId,
			HttpServletRequest request) throws CustomException, IOException {

		StubPermission response = null;

		try {
			response = cmsService.getPermissionResponse(UserId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<StubPermission>(response, HttpStatus.OK);
	}

	@GetMapping("devaccount/restServices/ui/AccountManagement/ListAccounts")
	public ResponseEntity<ListUserAccounts> getUserDetails(HttpServletRequest request)
			throws CustomException, IOException {

		ListUserAccounts response = null;

		try {
			response = cmsService.getUserDetailsResponse();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<ListUserAccounts>(response, HttpStatus.OK);
	}

	// @GetMapping("devaccount/restServices/ui/completeDossierdetails")
	@GetMapping("devaccount/restServices/ReadDossier/{ApplicationNumber}")
	public ResponseEntity<Example> getDossierDetails(@PathVariable("ApplicationNumber") String appNumber,
			HttpServletRequest request) throws CustomException, IOException {

		Example response = null;

		try {
			response = cmsService.getDossierDetails(appNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Example>(response, HttpStatus.OK);
	}

	@PostMapping("/PostLegacyEventV1/{eventCode}/{eventParameterName}/{eventParameterValue}/{wayOfExecution}")
	public ResponseEntity<SyncDossierResponse> syncDossierBeInformed(@PathVariable("eventCode") String eventCode,
			@PathVariable("eventParameterName") String eventParameterName,
			@PathVariable("eventParameterValue") String eventParameterValue,
			@PathVariable("wayOfExecution") String wayOfExecution, HttpServletRequest request)
			throws CustomException, IOException {

		System.out.println("eventCode = " + eventCode);
		System.out.println("eventParameterName = " + eventParameterName);
		System.out.println("eventParameterValue = " + eventParameterValue);
		System.out.println("wayOfExecution = " + wayOfExecution);

		SyncDossierResponse response = null;

		try {
			response = cmsService.getSyncDossierResponse(eventParameterValue);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<SyncDossierResponse>(response, HttpStatus.OK);
	}

	@GetMapping("devaccount/restServices/lal/stock/taskallocation/{lalTaskId}")
	public ResponseEntity<UserRoleMappingList> getRoleNameForUser(@PathVariable("lalTaskId") String lalTaskId)
			throws CustomException, IOException {

		UserRoleMappingList response = null;

		try {
			response = cmsService.getRoleNameForUser(lalTaskId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<UserRoleMappingList>(response, HttpStatus.OK);
	}

	@GetMapping("/contentbasedrouting/routingtable")
	public ResponseEntity<ClassPathResource> getRouting() {
		MultiValueMap<String, String> responseHeaders = new HttpHeaders();
		responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.TEXT_PLAIN_VALUE));
		ClassPathResource resource = new ClassPathResource("/response/routing/routing");
		return new ResponseEntity(resource, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/contentbasedrouting/defaultrouting")
	public ResponseEntity<ClassPathResource> getDefaultRouting() {
		MultiValueMap<String, String> responseHeaders = new HttpHeaders();
		responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
		ClassPathResource resource = new ClassPathResource("/response/routing/defaultRouting.json");
		return new ResponseEntity(resource, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/lal/organizational/units")
	public ResponseEntity<ClassPathResource> getOrganizationalUnits() {
		MultiValueMap<String, String> responseHeaders = new HttpHeaders();
		responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
		ClassPathResource resource = new ClassPathResource("/response/lalDirectory/GetOrganisationUnits_UAT.json");
		return new ResponseEntity(resource, responseHeaders, HttpStatus.OK);
	}

	@GetMapping("/lal/organizational/phonebook")
	public ResponseEntity<ClassPathResource> getOrganizationPhonebook() {
		MultiValueMap<String, String> responseHeaders = new HttpHeaders();
		responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
		ClassPathResource resource = new ClassPathResource("/response/lalDirectory/GetUsers_UAT.json");
		return new ResponseEntity(resource, responseHeaders, HttpStatus.OK);
	}

    @ApiResponses(value={
			@ApiResponse(code=201, message="Created Successfully", response=String.class), 
/*			@ApiResponse(code=400, message="Invalid json input", response=HttpError.class), 
			@ApiResponse(code=401, message="Unauthorized", response=HttpError.class), */
			}
	)
    @ApiOperation(value="Create Dossier Data", notes="Api to create Dossier data")
	@PostMapping(value = "/dossierDetailsInsert", produces = MediaType.ALL_VALUE)
	public ResponseEntity<String> insertDossierDetails(@RequestBody DossierInfo dossierInfo) throws CustomException {
		String status;
		status = cmsService.insertDossierDetails(dossierInfo);
		return new ResponseEntity<String>(status, HttpStatus.CREATED);
	}
	
	@GetMapping(value = "/DocDetails", produces = MediaType.ALL_VALUE)
	public ResponseEntity<String> DocDetails() throws CustomException {
		String status;
		status = cmsService.getDocMasterData();
		System.out.println("Dossier Info Insert Status : " + status);
		return new ResponseEntity<String>(status, HttpStatus.CREATED);
	}

}
