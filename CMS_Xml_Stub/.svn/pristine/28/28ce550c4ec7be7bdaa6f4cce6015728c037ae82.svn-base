package org.epo.exception;

import org.springframework.http.HttpStatus;

/**
 * 
 * @author amigarg
 *
 */

public class HttpCode {
	
	/**
	 * 
	 * @param httpCodeStatus
	 * @return
	 */
	public static HttpStatus getHttpCode(int httpCodeStatus) {

		switch (httpCodeStatus) {
			case 201:
				return HttpStatus.CREATED;
			case 400:
				return HttpStatus.BAD_REQUEST;
			case 401:
				return HttpStatus.UNAUTHORIZED;		
			case 404:
				return HttpStatus.NOT_FOUND;
			case 412:
				return HttpStatus.PRECONDITION_FAILED;
			case 500:
				return HttpStatus.INTERNAL_SERVER_ERROR;
			default:
				return HttpStatus.CONFLICT;
		}

	}


}
