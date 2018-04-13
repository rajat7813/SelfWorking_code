package com.edyt.mock.controllers.bi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.dto.CommentRequest;
import com.edyt.mock.dto.SE43GetComments;
import com.edyt.mock.dto.SE43GetCommentsWrapper;
import com.edyt.mock.service.CommentService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class CommentsController {

    private List<CommentRequest> commentsList = new ArrayList<CommentRequest>();
    private ObjectMapper objectMapper = new ObjectMapper();
    @Autowired
    private CommentService commentService;

    @RequestMapping(path = "restServices/GetComments/{ApplicationNumber}", method = RequestMethod.GET)
    public ResponseEntity<String> getComments(@PathVariable("ApplicationNumber") String applicationNumber) throws IOException {
        List<SE43GetComments> mockedCommentList = commentService.getMockedCommentList();
        if (!commentsList.isEmpty()) {
             CommentRequest commentRequest = commentsList.get(commentsList.size()-1);
             commentService.createComment(commentRequest.getText());
             commentsList.remove(commentRequest);
        }
        return new ResponseEntity<>(objectMapper.writeValueAsString(new SE43GetCommentsWrapper(mockedCommentList)), HttpStatus.OK);
    }

    @RequestMapping(path = "restServices/ui/BPRSearch/CreateComment", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<CommentRequest>> createComment(@RequestBody CommentRequest comment) throws IOException {
        commentsList.add(comment);
        return new ResponseEntity<>(commentsList, HttpStatus.OK);
    }
}
