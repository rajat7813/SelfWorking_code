package org.epo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(CustomException.class)
	public ResponseEntity<ExceptionHandlerBean> customExceptionHandler(
			CustomException customException) {
		ExceptionHandlerBean exceptionHandlerBean = customException
				.getExceptionHandlerBean();

		return new ResponseEntity<ExceptionHandlerBean>(exceptionHandlerBean,
				HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
