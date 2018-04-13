package org.epo.util;

import java.util.Calendar;
import java.util.Random;

public class GenerateRandomNumber {
	private GenerateRandomNumber(){
		
	}

	public static String generateRandomNumber() {
		// Generate nine digit random number
		int rNumber = 100000000 + new Random().nextInt(999999999);
		String randomNumber = String.valueOf(rNumber);

		randomNumber = randomNumber.trim();
		return randomNumber;
	}
}
