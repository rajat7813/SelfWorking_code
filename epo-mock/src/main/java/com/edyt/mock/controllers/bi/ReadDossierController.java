package com.edyt.mock.controllers.bi;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.UUID;

@RestController
public class ReadDossierController {

    @RequestMapping(path = "/restServices/ReadDossier/{ApplicationNumber}/{AccountID}/{Context}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> listWorkM1(@PathVariable("ApplicationNumber") String applicationNumber, @PathVariable("AccountID") String accountId,
                                                        @PathVariable("Context") String context) {

        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put("Set-Cookie", Collections.singletonList(String.format("JSESSIONID=%s.edfs-stock_test_0", UUID.randomUUID().toString())));
        headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        int hash = applicationNumber.hashCode();
        if((Math.abs(hash) % 2) == 0) {
            return new ResponseEntity<>(new ClassPathResource("bi/m1-readDossier.json"), headers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new ClassPathResource("bi/m1-readDossierUnread.json"), headers, HttpStatus.OK);
        }

    }
}
