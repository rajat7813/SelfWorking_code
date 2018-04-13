package org.epo.exception;

import org.springframework.dao.DataAccessException;

public class DAODataAccessException extends DataAccessException {

	private static final long serialVersionUID = -8305772462686521908L;

	public DAODataAccessException(String msg) {
		super(msg);
	}

	public DAODataAccessException(String msg, Throwable cause) {
		super(msg, cause);
	}

}
