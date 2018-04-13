package com.edyt.mock.controllers.bi;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.UUID;
import java.util.Scanner;
import java.io.IOException;
import java.lang.StringBuilder;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RestController
public class DossierKeyMappingsController {

    @RequestMapping(path = "/restServices/ui/BPRSearch/DossierKeyMappings", method = RequestMethod.GET)
    public ResponseEntity<String> getDossierKeys(@RequestParam(name = "TrimmedApplicationNumber") String trimmedNumber)
                                                  throws IOException {
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        ClassPathResource resource = new ClassPathResource("bi/DossierKeyMappings.json");
        Scanner s = new Scanner(resource.getInputStream()).useDelimiter("\\A");
        String result = s.hasNext() ? s.next() : "";
        Pattern pattern = Pattern.compile("([A-Z]+)([0-9]+)");
        Matcher matcher = pattern.matcher(trimmedNumber);
        if (matcher.matches()) {
            StringBuilder applicationNumber = new StringBuilder(matcher.group(1));
            String digitPart = matcher.group(2);
            for (int i = 0; trimmedNumber.length() + i < 15; i++) {
                applicationNumber.append(" ");
            }
            String caseId = digitPart;
            if (digitPart.length() > 7) {
                caseId = digitPart.substring(digitPart.length() - 7);
            }
            applicationNumber.append(digitPart);
            return new ResponseEntity<>(String.format(result, applicationNumber.toString(), trimmedNumber, caseId),
                    headers, HttpStatus.OK);
        }
        return new ResponseEntity<>(result, headers, HttpStatus.OK);
    }
}
