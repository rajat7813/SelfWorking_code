package org.epo.util;

import java.util.HashMap;
import java.util.Map;

/**
 * This Enum for error codes used in project
 * 
 * @author gaurgarg
 */
public enum ResponseStatusCodeEnum {

  USER_NOTIFICATION_CREATED_CODE( Constants.CREATED, Constants.USER_NOTIFICATION_CREATED_CODE, Constants.NOTIFICATION_CREATE_DETAILS,  Constants.USER_NOTIFICATION_CREATED_CODE),
  //NOTIFICATION_CREATED_CODE(Constants.CREATED, Constants.NOTIFICATION_CREATED_CODE, Constants.NOTIFICATION_CREATE_DETAILS, Constants.CREATED),
  USER_NOTIFICATION_UPDATE_CODE(Constants.UPDATE, Constants.NOTIFICATION_UPDATED_CODE, Constants.NOTIFICATION_UPDATE_DETAILS, Constants.UPDATE),
  DATA_ACCESS_EXCEPTION_CODE( Constants.DATA_ACCESS_EXCEPTION, Constants.INTERNALSERVERERROR, Constants.DATABASE_ERROR_DETAILS, Constants.DATA_ACCESS_EXCEPTION),
  BAD_REQUEST_CODE(Constants.BADREQUEST,Constants.BAD_REQUEST_CODE,Constants.BAD_REQUEST_DETAILS,Constants.BADREQUEST),
  NOTIFICATION_SERVERERROR_CODE(Constants.INTERNALSERVERERROR,Constants.NOTIFICATION_SERVERERROR_CODE,Constants.NOTIFICATION_SERVERERROR_DETAILS,Constants.INTERNALSERVERERROR),
  
  
  /*TIMEOUT_ERROR_CODE("1001", "", "", ""),
  API_ACCESS_ERROR_CODE("1002","","",""),
  NULL_EDOSSIERID_CODE("1003","","",""),
  TOC_SERVERERROR_CODE("1500","","",""),
  WRONG_INPUT_CODE("10400","","",""),
  AUTHENTICATION_FAILED_CODE("10401","","",""),
  WRONG_KERBOROS_GRP_CODE("10403","","",""),
  RESOURCE_NOTFOUND_CODE("10404","","",""),
  UNACCEPTABLE_RESOURCE_FORMAT_CODE("10406","","",""),
  VERSION_NOTSUPPORTED_CODE("10415","","",""),
  UNKNOWN_NUMBER_CODE("10422","","",""),
  THIRDPARTY_ERROR_CODE("10500"),
  THIRDPARTY_SERVICEERROR_CODE("10503"),
  BAD_REQUEST_CODE("1400"),
  NOTIFICATION_CREATED_CODE("1201"),
  NOTIFICATION_UPDATED_CODE("1202"),
  NOTIFICATION_DELETED_CODE("1203"),*/

  UNKNOWN_CODE(Constants.UNKNOWN_EXCEPTION,Constants.INTERNALSERVERERROR,Constants.BAD_REQUEST_DETAILS,Constants.UNKNOWN_EXCEPTION);
  private String responseStatusCode;
  private String typeId;
  private String detailKey;
  
  private String mappingCode;
  private static Map<String, ResponseStatusCodeEnum> map = new HashMap<String, ResponseStatusCodeEnum>();

  /**
   * Loading all Error Codes Enum in static map where key is Error Code (integer value) and value is
   * related Enum.
   * This map is used in fromInt method
   */
  static {
    for (ResponseStatusCodeEnum enumObj : ResponseStatusCodeEnum.values()) {
      map.put(enumObj.mappingCode, enumObj);
    }
  }

  private ResponseStatusCodeEnum(String errorCode, String typeId, String detailKey, String mappingCode ) {
    this.responseStatusCode = errorCode;
    this.typeId = typeId;
    this.detailKey = detailKey;
    this.mappingCode = mappingCode;
  }

  public String getResponseStatusCode() {
    return responseStatusCode;
  }

  public String getTypeId() {
    return typeId;
  }

  public String getDetailKey() {
    return detailKey;
  }

  public String getMappingCode() {
    return mappingCode;
  }

  /**
   * Returns the ResponseStatusCodeEnum of related passed errorCode. It can be used when user need
   * ResponseStatusCodeEnum based on error code value.
   * 
   * @param errorCode value
   * @return ResponseStatusCodeEnum of related passed errorCode if passed error code value is not related
   *         with ResponseStatusCodeEnum return null
   */
  public static ResponseStatusCodeEnum getEnumFromMappingCode(String mappingCode) {
    ResponseStatusCodeEnum type = map.get(mappingCode);
    /*
     * if (type == null)
     * return UNKNOWN_CODE;
     */
    return type;
  }

}
