package com.edyt.mock.controllers.steria;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@RestController
public class SteriaController {

    @RequestMapping(path = "dossiers/{applicationNumber}/documents/tracking-sheet", method = RequestMethod.POST)
    public ResponseEntity<ClassPathResource> getTrackingSheet(@PathVariable("applicationNumber") String applicationNumber) {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/pdf"));
        ClassPathResource resource = new ClassPathResource("steria/uploaddocument/qrcode/trackingsheet/generatedTrackingsheet.pdf");
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "documents/reference-data/doccodes/Upload", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getDocCode() {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        ClassPathResource resource = new ClassPathResource("steria/uploaddocument/qrcode/doccode/trackingsheet.json");
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }
}
