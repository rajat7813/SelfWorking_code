package com.edyt.mock.controllers.integrationlayer;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

/**
 * Created by przemekd on 25.02.16.
 */
@RestController
public class PatentsController {

    @RequestMapping(path = "/workmanager/AllPatents", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getAllPatents(@RequestParam(name = "userId") String userId, @RequestParam("role") String role,
                                                           @RequestParam(name = "page", required = false) String page){
        ClassPathResource resource = getDefaultAllPatentsResource(userId);
        if (page != null) {
            resource = new ClassPathResource("integrationlayer/allPatents/" + userId + "_" + page + ".json");
            if (!resource.exists()) {
                resource = getDefaultAllPatentsResource(userId);
            }
        } else {
            if (!resource.exists()) {
                //get first page, if no page is provided and mock has only paged json files
                resource = new ClassPathResource("integrationlayer/allPatents/" + userId + "_1" + ".json");
            }
        }

        MultiValueMap<String,String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("application/hal+json"));
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    private ClassPathResource getDefaultAllPatentsResource(String userId) {
        return new ClassPathResource("integrationlayer/allPatents/" + userId +  ".json");
    }

    @RequestMapping(path = "/workmanager/drawing", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getPatentDrawing(@RequestParam String drawingUrl){
        ClassPathResource resource = new ClassPathResource("integrationlayer/drawing/drawing.png");
        MultiValueMap<String,String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("image/png"));
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "/workmanager/pdm-metadata", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getPatentMetadata(@RequestParam String applicationNumber) {
        ClassPathResource json = new ClassPathResource("integrationlayer/pdm-metadata/publication-number.json");
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("application/json;charset=UTF-8"));
        return new ResponseEntity<>(json, responseHeaders, HttpStatus.OK);
    }

}
