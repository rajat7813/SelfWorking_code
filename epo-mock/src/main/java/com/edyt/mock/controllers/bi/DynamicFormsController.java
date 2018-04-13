package com.edyt.mock.controllers.bi;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.service.CommentService;
import com.edyt.mock.util.ResponseUtil;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;

/**
 * Created by Tomasz Kopczynski on 05.05.16.
 */
@RestController
public class DynamicFormsController {

    @Autowired
    private CommentService commentService;
    private ResponseEntity<ClassPathResource> serveResourceOrEmpty(String json, String resource) {
        String resourceToReturn = "bi/dynamicForms/empty.json";

        if ("{}".equals(json)) {
            resourceToReturn = resource;
        }

        return ResponseUtil.serveJsonResource(resourceToReturn);
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/BPR_Search/{caseId}/TestTasks", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> testTasks(@PathVariable("caseId") String caseId) throws IOException {
        if ("6051232".equals(caseId) || "5752462".equals(caseId)) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/testTasksReallocation.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/testTasks.json");
        }
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/technicalacceptance/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> redistribution(HttpEntity<String> httpEntity) throws IOException {
        String taBody = httpEntity.getBody();
        String comment = "";
        String className = null;
        try {
            DocumentContext payload = JsonPath.parse(taBody);
            comment = payload.read("$.objects.AS_TechnicalAcceptance_or_Redistribution.Comment"); 
            commentService.createComment(comment);
            className = payload.read("$.objects.AS_TechnicalAcceptance_or_Redistribution.Class");
        } catch (Exception e) {
            // ignore
        }
        if (className != null && className.equals("x")) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/redistributionInvalidClass.json");
        }
        if(!isDirectorateSet(taBody)) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/technicalAcceptanceNoDirectorateSet.json");
        } else if (!isSubmitted(taBody)) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/technicalAcceptanceDirectorateSet.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/empty.json");
        }
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/ta/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> technicalAcceptance(HttpEntity<String> httpEntity) throws IOException {
        if (isSubmitted(httpEntity.getBody())) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/empty.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/ta.json");
        }
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/MarkToInspectMenu/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> markToInspect(HttpEntity<String> httpEntity) throws IOException {
        if (isMarkAndUnmarkForInspection(httpEntity.getBody())) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/empty.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/markToInspect.json");
        }
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/OffLoad/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> offLoad(@PathVariable("caseId") String caseId, HttpEntity<String> httpEntity) throws IOException {
        if ("6051232".equals(caseId) || "5752462".equals(caseId)) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else if (isOffloadAndReload(httpEntity.getBody())) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/empty.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/offload.json");
        }
    }


    @RequestMapping(path = "/restServices/ui/BPRSearch/ReloadOffLoad/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> reload(HttpEntity<String> httpEntity) throws IOException {
        if (isOffloadAndReload(httpEntity.getBody())) {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/empty.json");
        } else {
            return ResponseUtil.serveJsonResource("bi/dynamicForms/offload.json");
        }
    }

    private boolean isMarkAndUnmarkForInspection(String taBody) {
        return taBody.contains("\"Mark_and_unmark_for_Inspection\":") && taBody.contains("\"InspectionComment\":");
    }

    private boolean isOffloadAndReload(String taBody) {
        return taBody.contains("\"Offload_and_reload\":") && taBody.contains("\"OffloadComment\":");
    }

    private boolean isDirectorateSet(String taBody) {
        return taBody.contains("\"Directorate\":");
    }

    private boolean isSubmitted(String taBody) {
        return taBody.contains("\"SUBMIT\"");
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/tempUpdateTimeLimit/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> tempUpdateTimeLimit(HttpEntity<String> httpEntity) throws IOException {
        return serveResourceOrEmpty(httpEntity.getBody(), "bi/dynamicForms/tempUpdateTimeLimit.json");
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/frmUpdateWorkflow/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<ClassPathResource> frmUpdateWorkflow(HttpEntity<String> httpEntity) throws IOException {
        return serveResourceOrEmpty(httpEntity.getBody(), "bi/dynamicForms/frmUpdateWorkflow.json");
    }
}
