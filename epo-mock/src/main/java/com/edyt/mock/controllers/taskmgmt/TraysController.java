package com.edyt.mock.controllers.taskmgmt;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
public class TraysController {

    @RequestMapping(path = "/Trays/STOCKMANAGER")
    public ResponseEntity<ClassPathResource> listStockmanagerTrays() {
        return getTraysResponse("STOCKMANAGER");
    }

    @RequestMapping(path = "/Trays/WORKMANAGER")
    public ResponseEntity<ClassPathResource> listWorkmanagerTrays() {
        return getTraysResponse("WORKMANAGER");
    }

    @RequestMapping(path = "/Trays/ESTORE_PERSONAL")
    public ResponseEntity<ClassPathResource> listEstorePersonalTrays() {
        return getTraysResponse("ESTORE_PERSONAL");
    }

    @RequestMapping(path = "/Trays/ESTORE_DIRECTORATE")
    public ResponseEntity<ClassPathResource> listEstoreDirectorateTrays() {
        return getTraysResponse("ESTORE_DIRECTORATE");
    }

    @RequestMapping(path = "/Trays/FOWORKMANAGER_TEAM")
    public ResponseEntity<ClassPathResource> listFoWorkmanagerTeamTrays() {
        return getTraysResponse("FOWORKMANAGER");
    }

    @RequestMapping(path = "/Trays/FOWORKMANAGER_DIRECTORATE")
    public ResponseEntity<ClassPathResource> listFoWorkmanagerDirectorateTrays() {
        return getTraysResponse("FOWORKMANAGER");
    }

    @RequestMapping(path = "/Trays/DIRECTOR")
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
