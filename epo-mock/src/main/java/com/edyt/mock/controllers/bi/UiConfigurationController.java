package com.edyt.mock.controllers.bi;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.util.Collections;
import java.util.UUID;

/**
 * Created by przemekd on 02.05.16.
 */
@RestController
public class UiConfigurationController {
    private static String EXAMINER_ROLE = "examiner";
    private boolean isExaminer = false;

    @RequestMapping(path = "/restServices/Mock/userRole/{role}", method = RequestMethod.POST)
    public ResponseEntity<String> setMockUserRole(@PathVariable String role) {
        this.isExaminer = EXAMINER_ROLE.equals(role);
        return new ResponseEntity<>("", HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/Account/getUserRolesEx", method = RequestMethod.GET)
    public ResponseEntity<Resource> getUserRoles(){
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put("Set-Cookie", Collections.singletonList(String.format("JSESSIONID=%s.edfs-uiconfig_test_0", UUID.randomUUID().toString())));
        return new ResponseEntity<>(new ClassPathResource("bi/uiconfiguration/userRoles.json"), headers, HttpStatus.OK);
    }

    @RequestMapping(path = "/resources/uicomponentsService", method = RequestMethod.GET)
    public ResponseEntity<Resource> getUiComponents(@RequestParam("roles") String roles){
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put("Set-Cookie", Collections.singletonList(String.format("JSESSIONID=%s.edfs-uiconfig_test_0", UUID.randomUUID().toString())));

        String responsePath = System.getProperty("uicomponentServiceResponse");
        if (null != responsePath && !responsePath.isEmpty() && new File(responsePath).exists()) {
            return new ResponseEntity<>(new FileSystemResource(responsePath), HttpStatus.OK);
        }
        if (this.isExaminer) {
            return new ResponseEntity<>(new ClassPathResource("bi/uiconfiguration/uicomponentsExaminer.json"), headers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new ClassPathResource("bi/uiconfiguration/uicomponents.json"), headers, HttpStatus.OK);
        }
    }

}
