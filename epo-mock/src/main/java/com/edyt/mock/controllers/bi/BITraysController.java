package com.edyt.mock.controllers.bi;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

/**
 * Created by Tomasz Kopczynski on 30.03.16.
 */
@RestController
public class BITraysController {

    @RequestMapping(path = "/restServices/GetTrayList/STOCKMANAGER")
    public ResponseEntity<ClassPathResource> listStockmanagerTrays() {
        return getTraysResponse("STOCKMANAGER");
    }

    @RequestMapping(path = "/restServices/GetTrayList/WORKMANAGER")
    public ResponseEntity<ClassPathResource> listWorkmanagerTrays() {
        return getTraysResponse("WORKMANAGER");
    }

    @RequestMapping(path = "/restServices/GetTrayList/ESTORE_PERSONAL")
    public ResponseEntity<ClassPathResource> listEstorePersonalTrays() {
        return getTraysResponse("ESTORE_PERSONAL");
    }

    @RequestMapping(path = "/restServices/GetTrayList/ESTORE_DIRECTORATE")
    public ResponseEntity<ClassPathResource> listEstoreDirectorateTrays() {
        return getTraysResponse("ESTORE_DIRECTORATE");
    }

    @RequestMapping(path = "/restServices/GetTrayList/FOWORKMANAGER_TEAM")
    public ResponseEntity<ClassPathResource> listFoWorkmanagerTeamTrays() {
        return getTraysResponse("FOWORKMANAGER");
    }

    @RequestMapping(path = "/restServices/GetTrayList/FOWORKMANAGER_DIRECTORATE")
    public ResponseEntity<ClassPathResource> listFoWorkmanagerDirectorateTrays() {
        return getTraysResponse("FOWORKMANAGER");
    }

    @RequestMapping(path = "/restServices/GetTrayList/DIRECTOR")
    public ResponseEntity<ClassPathResource> listDirectorTrays() {
        return getTraysResponse("DIRECTOR");
    }

    private ResponseEntity<ClassPathResource> getTraysResponse(String module) {
        ClassPathResource resource = new ClassPathResource(String.format("taskmgmt/trays/%s.json", module));

        if (resource.exists()) {
            MultiValueMap<String, String> responseHeaders = new HttpHeaders();
            responseHeaders.put("Content-Type", Collections.singletonList("application/json"));
            return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}