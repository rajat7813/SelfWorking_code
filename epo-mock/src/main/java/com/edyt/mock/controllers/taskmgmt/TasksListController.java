package com.edyt.mock.controllers.taskmgmt;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;

@RestController
public class TasksListController {

    @RequestMapping(path = "/Tasks/{module}/{trayKey}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> dossierList(HttpServletRequest request, @PathVariable("module") String module,
                                                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
        ClassPathResource resource;
        if ("DIRECTOR".equals(module)) {
            resource = new ClassPathResource("bi/dossierlist/DossierListEmpty.json");
        } else if(page % 2 == 1){
            resource = new ClassPathResource("bi/dossierlist/DossierList.json");
        } else {
            resource = new ClassPathResource("bi/dossierlist/DossierListOdd.json");
        }
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("application/hal+json"));
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }
}
