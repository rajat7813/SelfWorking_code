package com.edyt.mock.controllers.bi;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
public class DocumentsController {

    @RequestMapping(path = "/restServices/DocumentsV3/{CMFDocumentId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> documentsV3(@PathVariable("CMFDocumentId") String cmfDocumentId) {
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/pdf"));

        return new ResponseEntity<>(new ClassPathResource("bi/document.pdf"), headers, HttpStatus.OK);
    }
}
