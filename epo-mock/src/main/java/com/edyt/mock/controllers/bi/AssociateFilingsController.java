package com.edyt.mock.controllers.bi;

import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.util.ResponseUtil;

@RestController
public class AssociateFilingsController {

    @RequestMapping(path = "/restServices/GetAssociatedFilings/{lalCaseId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getAssociatedFilings(
            @PathVariable String lalCaseId) throws IOException {
        return ResponseUtil.serveJsonResource("bi/associatedfilings.json");
    }
}
