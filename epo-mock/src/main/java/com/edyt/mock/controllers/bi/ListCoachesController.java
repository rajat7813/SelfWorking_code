package com.edyt.mock.controllers.bi;

import com.edyt.mock.util.ResponseUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * Created by piotrekw on 08/02/17.
 */
@RestController
public class ListCoachesController {
    @RequestMapping(path = "/restServices/AM39ListCoaches/{UserCaseId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> getUserAvailableCoaches() throws IOException {
        return ResponseUtil.serveJsonResource("bi/autosuggestion/ListCoaches.json");
    }
}
