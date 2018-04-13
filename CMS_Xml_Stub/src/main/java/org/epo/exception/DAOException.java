package org.epo.exception;

import org.springframework.dao.DataAccessException;

/**
 * 
 * @author dbawa
 *
 */
public class DAOException extends DataAccessException {

	public DAOException(String msg) {
		super(msg);
	}

	public DAOException(String msg, Throwable cause) {
		super(msg, cause);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -8305772462686521908L;
	
}
