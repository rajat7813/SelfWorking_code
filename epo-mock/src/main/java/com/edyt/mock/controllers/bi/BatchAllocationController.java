package com.edyt.mock.controllers.bi;

import com.edyt.mock.util.ResponseUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RestController
public class BatchAllocationController {

    @RequestMapping(path = "/restServices/getAutosuggestedCandidates/{1stExaminerField}/{1stExaminer}/{FilterExaminer2}/{FilterExaminer2Team}/{FilterChairman}/{FilterChairmanTeam}/{caseIds}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> getAutoSuggestedCandidates(HttpServletRequest request) throws IOException {
        return ResponseUtil.serveJsonResource("bi/dynamicForms/getAutosuggestedCandidates.json");
    }
}
