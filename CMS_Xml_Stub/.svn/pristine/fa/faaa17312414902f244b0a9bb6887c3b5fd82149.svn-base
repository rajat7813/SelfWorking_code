package org.epo.service.impl;

import java.io.File;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.epo.beans.response.CmsStubModel;
import org.epo.beans.response.StubPermission;
import org.epo.beans.response.SyncDossierResponse;
import org.epo.dao.CmsDao;
import org.epo.exception.CustomException;
import org.epo.exception.DAOException;
import org.epo.exception.ResponseValidator;
import org.epo.readDossier.ApplicationProcedureBiblioAttribute;
import org.epo.readDossier.DossierDetail;
import org.epo.readDossier.DossierInfo;
import org.epo.readDossier.Example;
import org.epo.readDossier.ProcessDetails;
import org.epo.readDossier.ProductOrderInvolvement;
import org.epo.readDossier.TaskDetails;
import org.epo.readDossier.TimeLimit;
import org.epo.service.CmsService;
import org.epo.userDetails.ListUserAccounts;
import org.epo.userDetails.UserRoleMappingList;
import org.epo.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
@PropertySource("classpath:cms-stub-service.properties")
public class CmsServiceImpl implements CmsService {

	@Autowired
	private ResponseValidator responseValidator;

	@Autowired
	private CmsDao cmsDao;

	@Value("${save.task.url}")
	private String saveTaskUrl;

	@Value("${start.process.url}")
	private String startProcesURL;

	public CmsStubModel getHistoryResponse(String dossirNumber) throws CustomException {
		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		CmsStubModel cmsStub = null;

		try {
			if (dossirNumber == null || ("").equals(dossirNumber)) {
				dossirNumber = "Blank";
			} else {
				dossirNumber = dossirNumber.replaceAll(" ", "");
			}

			// File file = new
			// File(classLoader.getResource("/response/history/CmsResponse"+dossirNumber+".txt").getFile());
			File file = new File(getRealFilePath(
					classLoader.getResource("/response/history/CmsResponse" + dossirNumber + ".txt").getPath()));

			if (file.exists()) {
				cmsStub = mapper.readValue(file, CmsStubModel.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cmsStub;
	}

	public StubPermission getPermissionResponse(String UserId) throws CustomException {
		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		StubPermission cmsStubPerm = null;
		String userId = UserId;

		try {
			// File file = new
			// File(classLoader.getResource("/response/permission/PermissionResponse1234.txt").getFile());
			File file = new File(getRealFilePath(
					classLoader.getResource("/response/permission/PermissionResponse1234.txt").getPath()));

			if (file.exists()) {
				cmsStubPerm = mapper.readValue(file, StubPermission.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cmsStubPerm;
	}

	public ListUserAccounts getUserDetailsResponse() throws CustomException {
		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		ListUserAccounts listStubUserDetails = null;
		// String userId =UserId;

		try {
			// File file = new
			// File(classLoader.getResource("/response/userDetails/userDetails.txt").getFile());
			File file = new File(
					getRealFilePath(classLoader.getResource("/response/userDetails/userDetails.txt").getPath()));

			if (file.exists()) {
				listStubUserDetails = mapper.readValue(file, ListUserAccounts.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listStubUserDetails;
	}

	public Example getDossierDetails(String appNumber) throws CustomException {
		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Example listDosierDetails = null;
		// String userId =UserId;

		try {
			if (appNumber == null) {
				appNumber = "";
			} else {
				appNumber = appNumber.replaceAll(" ", "");
			}

			// File file = new
			// File(classLoader.getResource("/response/dossierDetails/dossierDetails"+appNumber+".txt").getFile());
			File file = new File(getRealFilePath(
					classLoader.getResource("/response/dossierDetails/dossierDetails" + appNumber + ".txt").getPath()));

			if (file.exists()) {
				listDosierDetails = mapper.readValue(file, Example.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listDosierDetails;
	}

	public SyncDossierResponse getSyncDossierResponse(String taskId) throws CustomException {

		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		SyncDossierResponse response = null;

		try {
			// TimeUnit.SECONDS.sleep(5);
			// taskId = (taskId.equals("EPA 16151657-EP
			// 16151657-001"))?"123456":taskId;
			// taskId = (taskId.equals("EPA 16151657-EP
			// 16151657-002"))?"1010":taskId;

			taskId = "123456";
			File file = new File(getRealFilePath(
					classLoader.getResource("/response/SyncDossierResponse/SyncDossierResponse" + taskId).getPath()));

			if (file.exists()) {
				response = mapper.readValue(file, SyncDossierResponse.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return response;
	}

	public String getRealFilePath(String aFilePath) throws Exception {
		org.jboss.vfs.VirtualFile vFile = org.jboss.vfs.VFS.getChild(aFilePath);
		URI fileNameDecodedTmp = org.jboss.vfs.VFSUtils.getPhysicalURI(vFile);
		String path = fileNameDecodedTmp.getPath();

		return path;
	}

	public UserRoleMappingList getRoleNameForUser(String lalTaskId) throws CustomException {
		ClassLoader classLoader = this.getClass().getClassLoader();
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		UserRoleMappingList userRoleMappingList = null;
		try {
			File file = new File(getRealFilePath(
					classLoader.getResource("/response/userRoleMapping/userRoleMapping.txt").getPath()));

			if (file.exists()) {
				userRoleMappingList = mapper.readValue(file, UserRoleMappingList.class);
			}

		} catch (DAOException de) {
			throw new CustomException(
					responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION, de.getMessage()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return userRoleMappingList;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = CustomException.class)
	public String insertDossierDetails(DossierInfo dossierInfo) throws CustomException {

		String status = "";
		status = cmsDao.insertDossierInfo(dossierInfo);
		String saveTaskResp = saveTask(dossierInfo);
		int startProcessResp = startProcess(dossierInfo.getDossierDetail());

		return status;
	}

	@Transactional
	public String getDocMasterData() throws CustomException {
		return cmsDao.getDocMasterData();
	}

	private String saveTask(DossierInfo dossierInfo) {
		RestTemplate restTemplate = new RestTemplate();
		TaskDetails taskDetails = new TaskDetails();
		DossierDetail dossDtls = dossierInfo.getDossierDetail();

		String firstExaminer = "";
		String secondExaminer = "";
		String chairman = "";
		String proceduralLanguage = "";
		String dossierTitle = "";
		String numberOfClaims = "";
		String limitDate = "";
		String limitDateType = "";
		List<String> stickers = new ArrayList<String>();
		List<String> userGeneratedTag = new ArrayList<String>();

		for (ProductOrderInvolvement productOrderInv : dossierInfo.getProductOrderInvolvement()) {
			if (productOrderInv.getInvolvementRole().equalsIgnoreCase("FirstExaminer")) {
				firstExaminer = productOrderInv.getInvolvementUser();
			}
			if (productOrderInv.getInvolvementRole().equalsIgnoreCase("SecondExaminer")) {
				secondExaminer = productOrderInv.getInvolvementUser();
			}
			if (productOrderInv.getInvolvementRole().equalsIgnoreCase("Chairman")) {
				chairman = productOrderInv.getInvolvementUser();
			}
		}

		for (ApplicationProcedureBiblioAttribute appBibloAttr : dossierInfo.getApplicationProcedureBiblioAttribute()) {
			if (appBibloAttr.getApplicationProcedureBiblioAttributeName()
					.equalsIgnoreCase("PatentApplicationProceduralLanguage")) {
				proceduralLanguage = appBibloAttr.getApplicationProcedureBiblioAttributeValue();
			}
			if (appBibloAttr.getApplicationProcedureBiblioAttributeName()
					.equalsIgnoreCase("PatentApplicationTitleOfInvention")) {
				dossierTitle = appBibloAttr.getApplicationProcedureBiblioAttributeValue();
			}
			if (appBibloAttr.getApplicationProcedureBiblioAttributeName()
					.equalsIgnoreCase("PatentApplicationNumberOfClaims")) {
				numberOfClaims = appBibloAttr.getApplicationProcedureBiblioAttributeValue();
			}
		}

		for (TimeLimit timeLimit : dossierInfo.getTimeLimit()) {
			if (timeLimit.getTimeLimitTypeDesc().equalsIgnoreCase("A2LimitDate")) {
				limitDate = timeLimit.getTimeLimitValue();
				limitDateType = timeLimit.getTimeLimitTypeDesc();
			}
		}

		Date currentDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String curDateStr = formatter.format(currentDate);
		System.out.println("Current Date : " + curDateStr);

		taskDetails.setAccountID("");
		taskDetails.setDirectorate("");
		taskDetails.setIndependentClaims("");
		taskDetails.setLastActionResult("");
		taskDetails.setNumberOfPages("");

		taskDetails.setNumberOfRelatedDossier("");
		taskDetails.setProceduralComments("");
		taskDetails.setTargetMonth("");
		taskDetails.setPriorityNumber("");
		taskDetails.setPublicationDate("");
		taskDetails.setUrgency("");
		taskDetails.setAllocatedRole("firstExaminer");
		taskDetails.setAllocatedUserId(firstExaminer);
		taskDetails.setApplicantName(dossDtls.getApplicantName());
		taskDetails.setChairman(chairman);
		taskDetails.setCommunicationType(dossDtls.getProductTypeName());
		taskDetails.setDossierNumber(dossDtls.getDossierNumber());
		taskDetails.setDossierTitle(dossierTitle);
		taskDetails.setDossierType(dossDtls.getDossierType());
		taskDetails.setFeesIndicator(dossDtls.getFeesIndicator());
		taskDetails.setFirstExaminer(firstExaminer);
		taskDetails.setLastActionActor("Stock Manager");
		taskDetails.setLastActionComment("Stock Allocated");
		taskDetails.setLastActionDate(curDateStr);
		taskDetails.setLegalMember(dossDtls.getRepresentativeName());
		taskDetails.setLimitDate(limitDate);
		taskDetails.setLimitDateType(limitDateType);
		taskDetails.setNumberOfClaims(numberOfClaims);
		taskDetails.setOpinionIndicator(dossDtls.getOpinionIndicator());
		taskDetails.setPhaseIndicator(dossDtls.getPhaseIndicator());
		taskDetails.setPreClassNo("G02F1/1333");
		taskDetails.setProceduralLanguage(proceduralLanguage);
		taskDetails.setReadIndicator("N");
		taskDetails.setReceiveDate(curDateStr);
		taskDetails.setSecondExaminer(secondExaminer);
		taskDetails.setTaskDescription("Initial search task");
		taskDetails.setTaskName("Initial search task");
		taskDetails.setTaskProvenance("FORWARD");
		taskDetails.setWorkFlowStatus("Ready for search");
		taskDetails.setStickers(stickers);
		taskDetails.setUserGeneratedTag(userGeneratedTag);

		System.out.println("Save Task URL : " + saveTaskUrl);
		System.out.println("Task Details : " + taskDetails);

		ResponseEntity<String> taskResponse = restTemplate.postForEntity(saveTaskUrl, taskDetails, String.class);

		System.out.println("Response Save Task Save Task Status code Value  : " + taskResponse.getStatusCodeValue());
		System.out.println("Response Save Task Body  : " + taskResponse.getBody());
		System.out.println("Response Save Task Class  : " + taskResponse.getClass());
		System.out.println("Response Save Task Headers  : " + taskResponse.getHeaders());
		System.out.println("Response Save Task Status Code  : " + taskResponse.getStatusCode());

		return taskResponse.getBody();
	}

	private int startProcess(DossierDetail dossDtls) {
		RestTemplate restTemplate = new RestTemplate();
		ProcessDetails processDtls = new ProcessDetails();

		processDtls.setApplicationType(dossDtls.getDossierType());
		processDtls.setCurrentWorkflowStatus("Ready for search");
		processDtls.setCurrentTaskName("Initial search task");

		String startUrl = startProcesURL + dossDtls.getDossierNumber() + "/5";

		System.out.println("Start Process URL : " + startUrl);
		System.out.println("Process Detail Object : " + processDtls);

		ResponseEntity<Integer> startResponse = restTemplate.postForEntity(startUrl, processDtls, Integer.class);

		System.out.println("Response Start Process Status code Value  : " + startResponse.getStatusCodeValue());
		System.out.println("Response Start Process Body  : " + startResponse.getBody());
		System.out.println("Response Start Process Class  : " + startResponse.getClass());
		System.out.println("Response Start Process Headers  : " + startResponse.getHeaders());
		System.out.println("Response Start Process Status Code  : " + startResponse.getStatusCode());

		return startResponse.getBody().intValue();
	}

}
