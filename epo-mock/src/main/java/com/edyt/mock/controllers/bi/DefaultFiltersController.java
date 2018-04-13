package com.edyt.mock.controllers.bi;

import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.util.ResponseUtil;

@RestController
public class DefaultFiltersController {

    @RequestMapping(path = "/restServices/defaultFilters", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getDefaultFilters() throws IOException {
        return ResponseUtil.serveJsonResource("bi/defaultFilters.json");
    }
	
}
