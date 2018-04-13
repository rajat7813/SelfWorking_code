package com.edyt.mock.controllers.bi;

import com.edyt.mock.dto.MissingObject;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import org.apache.log4j.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


/**
 * Created by przemekd on 05.04.16.
 */
@RestController
public class TasksController {
    private Logger logger = Logger.getLogger(TasksController.class);

    @RequestMapping(path = "restServices/ui/BPRSearch/MarkReadOrUnread", method = RequestMethod.POST)
    public ResponseEntity<String> updateTask(@RequestBody String body) throws IOException {
        Configuration configuration = Configuration.defaultConfiguration().addOptions(Option.DEFAULT_PATH_LEAF_TO_NULL, Option.SUPPRESS_EXCEPTIONS);
        DocumentContext payload = JsonPath.using(configuration).parse(body);

        String lalTaskId = payload.read("$.objects.SE_Request.LAL_taskId");
        String action = payload.read("$.objects.SE_Request.Action");
        String accountId = payload.read("$.objects.SE_Request.AccountID");

        boolean hasError = false;

        ClassPathResource errorResponseJson = new ClassPathResource("bi/UpdateTask.json");
        DocumentContext errorResponseDocument = JsonPath.parse(errorResponseJson.getInputStream());

        if (null == lalTaskId) {
            errorResponseDocument.add("$.formresponse.missing.anchor", new MissingObject("SE_Request", "LAL_taskId"));
            hasError = true;
        }
        if (null == action) {
            errorResponseDocument.add("$.formresponse.missing.anchor", new MissingObject("SE_Request", "Action"));
            hasError = true;
        }
        if (hasError) {
            return new ResponseEntity<>(errorResponseDocument.jsonString(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("", HttpStatus.OK);
        }
    }
}
