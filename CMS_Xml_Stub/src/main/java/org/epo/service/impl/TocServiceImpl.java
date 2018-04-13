package org.epo.service.impl;

import java.io.File;
import java.io.IOException;

import org.epo.beans.response.CmsStubModel;
import org.epo.beans.response.PermissionResponse;
import org.epo.beans.response.StubPermission;
import org.epo.userDetails.ListUserAccounts;
import org.epo.exception.CustomException;
import org.epo.exception.DAOException;
import org.epo.exception.ResponseValidator;
import org.epo.readDossier.Example;
import org.epo.readDossier.ID06ReadDossier;
import org.epo.service.TocService;
import org.epo.userDetails.ListUserAccounts;
import org.epo.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service

public class TocServiceImpl implements TocService{
	@Autowired
	private ResponseValidator responseValidator;
	
	public CmsStubModel getHistoryResponse(String DossierNo) throws CustomException {
		 ClassLoader classLoader = this.getClass().getClassLoader();
		 ObjectMapper mapper = new ObjectMapper();
		 mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		 CmsStubModel cmsStub = null;
		 String dossirNumber =DossierNo;
		 if(dossirNumber==null && ("").equals(dossirNumber))
			 dossirNumber="Blank";
		 try{
			 if(dossirNumber.equals("EPA    05020948")){
				 dossirNumber="EPA05020948";
			 }
			  else if(dossirNumber.equals("EPA 050209481")){
				 dossirNumber="EPA050209481";
			 }
			 else if(dossirNumber.equals("EPA    16189610")){
				 System.out.println("EPA16189610");
				 dossirNumber="EPA16189610"; 
			 }
			 else if(dossirNumber.equals("FRA     1655188")){
				 System.out.println("FRA1655188");
				 dossirNumber="FRA1655188";
			 }
			 
			 else if(dossirNumber.equals("FRA    1670195")){
				 dossirNumber="FRA1670195";
			 }
			  else{
				 //Send some message
			 }
		 File file = new File(classLoader.getResource("/response/history/CmsResponse"+dossirNumber+".txt").getFile());
		 if (file.exists()) {
			 cmsStub = mapper.readValue(file, CmsStubModel.class);
		 }
	 
	    }catch(DAOException de){
		 throw new CustomException(responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION,de.getMessage()));
	    }  catch(Exception e){
        	System.out.println("11");
        	
        }
	  
		return cmsStub;
	
	}
	
	
	public StubPermission getPermissionResponse(String UserId) throws CustomException {
		 ClassLoader classLoader = this.getClass().getClassLoader();
		 ObjectMapper mapper = new ObjectMapper();
		 mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		 StubPermission cmsStubPerm = null;
		 String userId =UserId;
		
		 try{
		 File file = new File(classLoader.getResource("/response/permission/PermissionResponse1234.txt").getFile());
		 if (file.exists()) {
			 cmsStubPerm = mapper.readValue(file, StubPermission.class);
		 }
	 
	    }catch(DAOException de){
		 throw new CustomException(responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION,de.getMessage()));
	    }  catch(Exception e){
       	
       	
       }
	  
		return cmsStubPerm;
	
	}
	
	
	  public  ListUserAccounts getUserDetailsResponse() throws CustomException
	 {
		 ClassLoader classLoader = this.getClass().getClassLoader();
		 ObjectMapper mapper = new ObjectMapper();
		 mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		 ListUserAccounts listStubUserDetails = null;
		// String userId =UserId;
		
		 try{
		 File file = new File(classLoader.getResource("/response/userDetails/userDetails.txt").getFile());
		 if (file.exists()) {
			 listStubUserDetails = mapper.readValue(file, ListUserAccounts.class);
		 }
	 
	    }catch(DAOException de){
		 throw new CustomException(responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION,de.getMessage()));
	    }  catch(Exception e){
      	
      	
      }
	  
		return listStubUserDetails;
	
	}
	
	
	

	  public  Example getDossierDetails() throws CustomException
	 {
		 ClassLoader classLoader = this.getClass().getClassLoader();
		 ObjectMapper mapper = new ObjectMapper();
		 mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		 Example listDosierDetails = null;
		// String userId =UserId;
		
		 try{
		 File file = new File(classLoader.getResource("/response/dossierDetails/dossierDetails.txt").getFile());
		 if (file.exists()) {
			 listDosierDetails = mapper.readValue(file, Example.class);
		 }
	 
	    }catch(DAOException de){
		 throw new CustomException(responseValidator.getErrorResponse(Constants.DATA_ACCESS_EXCEPTION,de.getMessage()));
	    }  catch(Exception e){
      	
      	
      }
	  
		return listDosierDetails;
	
	}
	
	

}
