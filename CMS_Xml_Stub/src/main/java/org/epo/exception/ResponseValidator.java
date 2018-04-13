package org.epo.exception;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.epo.service.PropertyFileReaderService;
import org.epo.util.ResponseStatusCodeEnum;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 
 * @author amigarg
 *
 */
public class ResponseValidator {
	
	
	@Autowired
	private PropertyFileReaderService propertyFileReaderService;
	
	 private static final Logger logger = LogManager.getLogger(ResponseValidator.class);	 
	 
	 /**
	  * 
	  * @param statusCode
	  * @return
	  */
	 public ExceptionHandlerBean getErrorResponse(String statusCode ,String exceptionMessage) {
		 ExceptionHandlerBean exceptionHandlerBean = new ExceptionHandlerBean();
		 ResponseStatusCodeEnum enumObj=ResponseStatusCodeEnum.getEnumFromMappingCode(statusCode);
		 
		 exceptionHandlerBean.setId(enumObj.getTypeId());
		 exceptionHandlerBean.setStatusCode(enumObj.getResponseStatusCode());
		 exceptionHandlerBean.setDetails(propertyFileReaderService
         .getValue(enumObj.getDetailKey()));
		 
		 
		 /*switch (statusCode) {
		 case"1301":exceptionHandlerBean.setId(Constants.NOTIFICATION_CREATED_CODE);
		            exceptionHandlerBean.setStatusCode(Constants.USER_NOTIFICATION_CREATED_CODE);
		            exceptionHandlerBean.setDetails(propertyFileReaderService
				    .getValue(Constants.CREATE_USER_NOTIFICATION_DETAILS));
		            logger.info(exceptionHandlerBean.getDetails());
		            break;
		 case "201":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_CREATED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.CREATED);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_CREATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "204":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_UPDATED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UPDATE);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_UPDATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "206":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_DELETED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.DELETE);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_UPDATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "400":
			 exceptionHandlerBean.setId(Constants.WRONG_INPUT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.PRECONDITION);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_INPUT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "401":
			 exceptionHandlerBean.setId(Constants.AUTHENTICATION_FAILED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UNAUTHROISED);
			 exceptionHandlerBean.setDetails(Constants.AUTHENTICATION_FAILED_DETAILS);
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "403":
			 exceptionHandlerBean.setId(Constants.WRONG_KERBOROS_GRP_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UNAUTHROISED);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_KERBOROS_GRP_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;			
		 case "404":
			 exceptionHandlerBean.setId(Constants.RESOURCE_NOTFOUND_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.NOT_FOUND);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.RESOURCE_NOTFOUND_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "406":
			 exceptionHandlerBean.setId(Constants.UNACCEPTABLE_RESOURCE_FORMAT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.PRECONDITION);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.UNACCEPTABLE_RESOURCE_FORMAT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "408":
			 exceptionHandlerBean.setId(Constants.TIMEOUT_ERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.TIMEOUT_ERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "415":
			 exceptionHandlerBean.setId(Constants.VERSION_NOTSUPPORTED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.BADREQUEST);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.VERSION_NOTSUPPORTED_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "422":
			 exceptionHandlerBean.setId(Constants.WRONG_INPUT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.BADREQUEST);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_INPUT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "500":
			 exceptionHandlerBean.setId(Constants.THIRDPARTY_ERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.THIRDPARTY_ERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "503":
			 exceptionHandlerBean.setId(Constants.THIRDPARTY_SERVICEERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.THIRDPARTY_SERVICEERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "3001":
				exceptionHandlerBean.setId(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setDetails(propertyFileReaderService
						 .getValue(Constants.THIRDPARTY_SERVICEERROR_DETAILS));
				logger.info(exceptionHandlerBean.getDetails());
				break;
		 default:
			 exceptionHandlerBean.setId(Constants.TOC_SERVERERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.TOC_SERVERERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;

		 }*/
		return exceptionHandlerBean;
	}
	 
	 
	 /**
	  * 
	  * @param statusCode
	  * @return
	  */
	 public ExceptionHandlerBean getErrorResponse(String statusCode) {
		 ExceptionHandlerBean exceptionHandlerBean = new ExceptionHandlerBean();
		 
		 ResponseStatusCodeEnum enumObj=ResponseStatusCodeEnum.getEnumFromMappingCode(statusCode);
     
     exceptionHandlerBean.setId(enumObj.getTypeId());
     exceptionHandlerBean.setStatusCode(enumObj.getResponseStatusCode());
     exceptionHandlerBean.setDetails(propertyFileReaderService
         .getValue(enumObj.getDetailKey()));
		 
		 /*switch (statusCode) {
		 case "1301":exceptionHandlerBean.setId(Constants.NOTIFICATION_CREATED_CODE);
		            exceptionHandlerBean.setStatusCode(Constants.USER_NOTIFICATION_CREATED_CODE);
		            exceptionHandlerBean.setDetails(propertyFileReaderService
				    .getValue(Constants.CREATE_USER_NOTIFICATION_DETAILS));
		            logger.info(exceptionHandlerBean.getDetails());
		            break;
		 case "201":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_CREATED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.CREATED);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_CREATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "204":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_UPDATED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UPDATE);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_UPDATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "206":
			 exceptionHandlerBean.setId(Constants.NOTIFICATION_DELETED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.DELETE);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.NOTIFICATION_UPDATE_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "400":
			 exceptionHandlerBean.setId(Constants.WRONG_INPUT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.PRECONDITION);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_INPUT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "401":
			 exceptionHandlerBean.setId(Constants.AUTHENTICATION_FAILED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UNAUTHROISED);
			 exceptionHandlerBean.setDetails(Constants.AUTHENTICATION_FAILED_DETAILS);
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "403":
			 exceptionHandlerBean.setId(Constants.WRONG_KERBOROS_GRP_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.UNAUTHROISED);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_KERBOROS_GRP_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;			
		 case "404":
			 exceptionHandlerBean.setId(Constants.RESOURCE_NOTFOUND_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.NOT_FOUND);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.RESOURCE_NOTFOUND_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "406":
			 exceptionHandlerBean.setId(Constants.UNACCEPTABLE_RESOURCE_FORMAT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.PRECONDITION);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.UNACCEPTABLE_RESOURCE_FORMAT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "408":
			 exceptionHandlerBean.setId(Constants.TIMEOUT_ERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.TIMEOUT_ERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "415":
			 exceptionHandlerBean.setId(Constants.VERSION_NOTSUPPORTED_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.BADREQUEST);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.VERSION_NOTSUPPORTED_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "422":
			 exceptionHandlerBean.setId(Constants.WRONG_INPUT_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.BADREQUEST);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.WRONG_INPUT_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "500":
			 exceptionHandlerBean.setId(Constants.THIRDPARTY_ERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.THIRDPARTY_ERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "503":
			 exceptionHandlerBean.setId(Constants.THIRDPARTY_SERVICEERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.THIRDPARTY_SERVICEERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;
		 case "3001":
				exceptionHandlerBean.setId(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setDetails(propertyFileReaderService
						 .getValue(Constants.THIRDPARTY_SERVICEERROR_DETAILS));
				logger.info(exceptionHandlerBean.getDetails());
				break;
		 default:
			 exceptionHandlerBean.setId(Constants.TOC_SERVERERROR_CODE);
			 exceptionHandlerBean.setStatusCode(Constants.INTERNALSERVERERROR);
			 exceptionHandlerBean.setDetails(propertyFileReaderService
					 .getValue(Constants.TOC_SERVERERROR_DETAILS));
			 logger.info(exceptionHandlerBean.getDetails());
			 break;

		 }*/
		return exceptionHandlerBean;
	}

}
