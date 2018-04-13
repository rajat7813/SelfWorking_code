package com.edyt.mock.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.edyt.mock.dto.Comments;
import com.edyt.mock.dto.SE43GetComments;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CommentServiceImpl implements CommentService {

    private ObjectMapper objectMapper = new ObjectMapper();
    private List<SE43GetComments> mockedCommentList;

    public CommentServiceImpl() throws IOException {
        String response = IOUtils.toString(new ClassPathResource("bi/comments.json").getInputStream());
        mockedCommentList = objectMapper.readValue(response, Comments.class).getComments();
    }

    @Override
    public List<SE43GetComments> getMockedCommentList() {
        return mockedCommentList;
    }

    @Override
    public void createComment(String comment) {
        List<SE43GetComments> mockedCommentList = getMockedCommentList();
        SE43GetComments seGetComments = new SE43GetComments(null, null, "DummyUser", Long.toString(new Date().getTime()), comment, "", "", "", "", "3113116");
        mockedCommentList.add(seGetComments);
    }

}
