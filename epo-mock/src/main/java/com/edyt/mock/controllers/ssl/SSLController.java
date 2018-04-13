package com.edyt.mock.controllers.ssl;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;

@RestController
@RequestMapping("/ssl/api")
public class SSLController {

  private  MultiValueMap<String,String> jsonResponseHeaders(){
    MultiValueMap<String,String> responseHeaders = new HttpHeaders();
    responseHeaders.put("Content-Type", Collections.singletonList("application/json"));
    return responseHeaders;
  }

  @RequestMapping("/stic/users/{userName}/applications/lookup/{appNum}")
  public ResponseEntity<String> lookupApplication(
      @PathVariable("userName") String username, @PathVariable("appNum") String appNum) {

    String responseJson = String.format("{ \"application\": \"/stic/users/%s/applications/%s\"}", username,
        Math.abs(appNum.hashCode()));

    return new ResponseEntity<>(responseJson, jsonResponseHeaders(), HttpStatus.OK);
  }

  @RequestMapping("/stic/users/{userName}/applications/{applicationNumber}/system/TRI")
  public ResponseEntity<Resource> getDrawers(@RequestParam(name = "client", required = false) String client, @RequestParam(name = "withNumbers", required = false, defaultValue = "true") boolean withNumbers) {
    return new ResponseEntity<>(new ClassPathResource("ssl/drawers.json"), jsonResponseHeaders(), HttpStatus.OK);
  }

  @RequestMapping("/v1/api/retrieve/families")
  public ResponseEntity<Resource> retrieveFamilies(@RequestParam("publicationNumberPart") String publicationNumberPart) {
    Resource body = new ClassPathResource("ssl/families.json");
    return new ResponseEntity<>(body, jsonResponseHeaders(), HttpStatus.OK);
  }
}
