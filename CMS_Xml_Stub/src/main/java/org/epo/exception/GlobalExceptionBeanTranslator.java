package org.epo.exception;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.epo.controller.CmsStubController;
import org.epo.util.Constants;
import org.springframework.stereotype.Component;

/**
 * This class is used to populate the ExceptionHandlerBean while converting the required exceptions to CustomException
 * @author dbawa
 *
 */
@Component
public class GlobalExceptionBeanTranslator {
	
	private static final Logger LOGGER = LogManager.getLogger(CmsStubController.class);
	
	public ExceptionHandlerBean populateExceptionHandlerBean(int statusCode, String exceptionMsg) {
		ExceptionHandlerBean exceptionHandlerBean = new ExceptionHandlerBean();
		switch (statusCode) {
			case 3001:
				exceptionHandlerBean.setId(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
				
			case 3002:
				exceptionHandlerBean.setId(Constants.FILE_NOT_FOUND_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.FILE_NOT_FOUND_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
				
			case 3003:
				exceptionHandlerBean.setId(Constants.UNSUPPORTED_ENCODING_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.UNSUPPORTED_ENCODING_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
				
			case 3004:
				exceptionHandlerBean.setId(Constants.WRITER_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.WRITER_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
				
			case 3005:
				exceptionHandlerBean.setId(Constants.IO_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.IO_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
				
			case 3006:
				exceptionHandlerBean.setId(Constants.DOCUMENT_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.DOCUMENT_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;
			
			default:
				exceptionHandlerBean.setId(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setStatusCode(Constants.DATA_ACCESS_EXCEPTION);
				exceptionHandlerBean.setDetails(exceptionMsg);
				LOGGER.info(exceptionHandlerBean.getDetails());
				break;

		}
		return exceptionHandlerBean;
	}

}
