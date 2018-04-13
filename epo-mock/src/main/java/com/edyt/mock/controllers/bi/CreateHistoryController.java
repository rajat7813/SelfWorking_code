package com.edyt.mock.controllers.bi;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.dto.HistoryPayload;

/**
 * Create History Controller
 */
@RestController
public class CreateHistoryController {

    /**
    * Create History
    *
    * @return HTTP status
     */
    @RequestMapping(path = "/restServices/ui/BPRSearch/CreateHistory/{caseid}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> createHistory(@RequestBody HistoryPayload payload) {
        return new ResponseEntity<>("", HttpStatus.OK);
    }
}