package org.epo.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 
 * @author nisharma
 * 
 */
public interface Constants {

	// Constants for logger messages
	String ENTRY = "Entering into method : ";
	String EXIT = "Exiting from method : ";
	String ERROR="Error in Method";
	String ENTRY_API = "Before hitting third party API: ";
	String EXIT_API = "After hitting third party API: ";

	// Config file constants
	String HOST_FOR_LALSERVICE = "hostForLal";
	String HOST_FOR_DSLSERVICE = "hostForDsl";
	String LOCALHOST = "localhost";
	String USER_NOTIFICATION_DIALOG_HOST = "userNotificationDialogHost";

	// Response codes
	String SUCCESS = "200";
	String CREATED = "201";
	String UPDATE = "204";
	String DELETE = "206";
	String BADREQUEST = "400";
	String UNAUTHROISED = "401";
	String NOT_FOUND = "404";
	String TIME_OUT = "412";
	String PRECONDITION = "412";
	String INTERNALSERVERERROR = "500"; 
	List<String> DIRECTION = new ArrayList<String>(Arrays.asList("asc", "desc"));
	List<String> OPTION = new ArrayList<String>(Arrays.asList("legalDate"));

	String SORT = "legalDate";
	String ORDER = "desc";

	// Custom Error Codes
	String TIMEOUT_ERROR_CODE = "1001";
	String API_ACCESS_ERROR_CODE = "1002";
	String NULL_EDOSSIERID_CODE = "1003";
	String TOC_SERVERERROR_CODE = "1500";
	String NOTIFICATION_SERVERERROR_CODE = "1500";
	String WRONG_INPUT_CODE = "10400";
	String AUTHENTICATION_FAILED_CODE = "10401";
	String WRONG_KERBOROS_GRP_CODE = "10403";
	String RESOURCE_NOTFOUND_CODE = "10404";
	String UNACCEPTABLE_RESOURCE_FORMAT_CODE = "10406";
	String VERSION_NOTSUPPORTED_CODE = "10415";
	String UNKNOWN_NUMBER_CODE = "10422";
	String THIRDPARTY_ERROR_CODE = "10500";
	String THIRDPARTY_SERVICEERROR_CODE = "10503";
	String BAD_REQUEST_CODE = "1400";
	String NOTIFICATION_CREATED_CODE = "1201";
	String NOTIFICATION_UPDATED_CODE = "1202";
	String NOTIFICATION_DELETED_CODE = "1203";
	
	String USER_NOTIFICATION_CREATED_CODE="1301";
	// Error Details
	String TIMEOUT_ERROR_DETAILS = "timeoutErrorDetail";
	String API_ACCESS_ERROR_DETAILS = "apiErrorAccessDetail";
	String NULL_EDOSSIERID_DETAILS = "nullEdossierIdDetail ";
	String TOC_SERVERERROR_DETAILS = "tocServerErrorDetail";
	String NOTIFICATION_SERVERERROR_DETAILS="notification_servererror_details";
	String WRONG_INPUT_DETAILS = "wrongInputDetail"; 
	String AUTHENTICATION_FAILED_DETAILS = "authenticationFailedDetail";
	String WRONG_KERBOROS_GRP_DETAILS = "wrongKerborosgrpDetail";
	String RESOURCE_NOTFOUND_DETAILS = "resourceNotFoundDetail";
	String UNACCEPTABLE_RESOURCE_FORMAT_DETAILS = "unacceptableResourceFormatDetail";
	String VERSION_NOTSUPPORTED_DETAILS = "versionNotSupportedDetail";
	String UNKNOWN_NUMBER_DETAILS = "unknownNumberDetail";
	String THIRDPARTY_ERROR_DETAILS = "thirdPartyErrorDetail";
	String THIRDPARTY_SERVICEERROR_DETAILS = "thirdPartyServiceErrorDetail";
	String BAD_REQUEST_DETAILS = "badRequestDetail";
	String NOTIFICATION_CREATE_DETAILS = "notificationCreateDetail";
	String NOTIFICATION_UPDATE_DETAILS = "notificationUpdateDetail";
	String NOTIFICATION_DELETE_DETAILS = "notificationDeleteDetail";
	String DATABASE_ERROR_DETAILS = "databaseErrorDetail";
	String CREATE_USER_NOTIFICATION_DETAILS="createUserNotificationDetail";
	
	// Timeout details
	Integer TIMEOUT_TIME = 2000;

	// Prepublication Data
	String ABSTRACT = "Abstract";
	String CLAIMS = "Claims";
	String DESCRIPTION = "Description";
	String DRAWING = "Drawings";

	// Third Party Api names
	String LAL = "LAL";
	String DSL = "DSL";

	String SYSTEM = "SYSTEM";
	String ACTIVE = "A";

	String SELF_URL = "http://localhost:8088/notificationsWS/UserNotification/user";
	String SELF_SYSTEM_URL = "http://localhost:8088/notificationsWS/Notification/system";
	String DOC_LINK = "http://linkdoc/";

	// Exception handling codes
	String DATA_ACCESS_EXCEPTION = "3001";
	String FILE_NOT_FOUND_EXCEPTION = "3002";
	String UNSUPPORTED_ENCODING_EXCEPTION = "3003";
	String WRITER_EXCEPTION = "3004";
	String IO_EXCEPTION = "3005";
	String DOCUMENT_EXCEPTION = "3006";
	String UNKNOWN_EXCEPTION= "5001";
	
	String DATETIME = "dateTime";
	
	String YES = "Y";
	String NO = "N";
	int ZERO = 0;
	int ONE =  1;
	String DESCENDING_ORDER = "desc";  
	String ASCENDING_ORDER = "asc";
	
	String USER_NOTIFICATION_DEFAULT_SORT = "notificationDate";
	String USER_NOTIFICATION__DEFAULT_SORT_ORD = DESCENDING_ORDER;
	List<String> USER_NOTIFICATION__SORT_DIRECTION = new ArrayList<String>(Arrays.asList(DESCENDING_ORDER, DESCENDING_ORDER));
	List<String> USER_NOTIFICATION__SORT_OPTION = new ArrayList<String>(Arrays.asList("notificationDate"));
	
	 
	String RECIEVER_ID="receiverId";
	String DIALOG_ID="dialogId";
	String NOTIFICATION_ID="notificationId";
	
}
