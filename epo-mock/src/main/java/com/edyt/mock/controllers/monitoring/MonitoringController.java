package com.edyt.mock.controllers.monitoring;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
public class MonitoringController {

    @RequestMapping(path = "/monitoring/monitoring.js", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getMonitoringScript() {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/javascript"));
        ClassPathResource resource = new ClassPathResource("monitoring/monitoring.js");
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }
}
