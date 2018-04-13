package com.edyt.mock.controllers.bi;

import com.edyt.mock.util.ResponseUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.Collections;

@RestController
public class AutosuggestionController {

    @RequestMapping("/restServices/ui/AccountManagement/formUpdateAllocationWeightsCase")
    public ResponseEntity<ClassPathResource> saveAutosuggestionConfig(@RequestParam("ID") String userCaseId) {
        if (userCaseId.length() >= 5) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            ClassPathResource resource = new ClassPathResource("bi/autosuggestion/updateAllocationWeightsErrorResponse.json");

            MultiValueMap<String, String> responseHeaders = new HttpHeaders();
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));

            return new ResponseEntity<>(resource, responseHeaders, HttpStatus.BAD_REQUEST);

        }
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/AutosuggestionConfig", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> getAutosuggestionConfig() throws IOException {
        return ResponseUtil.serveJsonResource("bi/autosuggestion/AutosuggestionConfig.json");
    }
}
