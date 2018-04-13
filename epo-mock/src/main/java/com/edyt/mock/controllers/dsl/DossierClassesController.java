package com.edyt.mock.controllers.dsl;

import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.util.ResponseUtil;

@RestController
public class DossierClassesController {

    @RequestMapping(value = "/restServices/GetClasses/{applicationRID}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getclasses(@PathVariable("applicationRID") String applicationRID) throws IOException {
        return ResponseUtil.serveJsonResource("dsl/getClasses.json");
    }
}
