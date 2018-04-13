package com.edyt.mock.controllers.steria;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
public class SteriaDossierHistoryController {

    @RequestMapping(path = "dossiers/{applicationNumber}/history", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getDossierHistory(@PathVariable String applicationNumber, @RequestParam("sort") String sort) {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        ClassPathResource resource = new ClassPathResource("steria/dossierhistory/dossierHistory.json");
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "dossiers/{applicationNumber}/history", method = RequestMethod.POST)
    public ResponseEntity<ClassPathResource> saveDossierHistory() {
        ClassPathResource resource = new ClassPathResource("steria/dossierhistory/saveHistoryResponse.json");
        return new ResponseEntity<>(resource, HttpStatus.OK);
    }

    @RequestMapping(path = "dossiers/{applicationNumber}/source", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getHistoryEventTypes() {
        ClassPathResource resource = new ClassPathResource("steria/dossierhistory/eventTypes.json");
        return new ResponseEntity<>(resource, HttpStatus.OK);
    }
}
