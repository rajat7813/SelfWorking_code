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

import com.edyt.mock.util.ResponseUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Collections;

@RestController
public class DossierListController {

    @RequestMapping(path = "/restServices/ui/Work/DossierlistHeaders", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> dossierListHeaders() {
        ClassPathResource resource = new ClassPathResource("bi/dossierlist/DossierListHeaders.json");
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("application/hal+json"));
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/GetDossierList/{module}/{traykey}/{sortColumn}/{sortDirection}/{page}/{pageSize}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> dossierList(HttpServletRequest request, @PathVariable("module") String module, @PathVariable("page") Integer page) {
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
 
    @RequestMapping(path = "/restServices/sortingOptions", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getSortOptionsUrl() throws IOException {
        return ResponseUtil.serveJsonResource("bi/dossierlist/sorting-options.json");
    }
}
