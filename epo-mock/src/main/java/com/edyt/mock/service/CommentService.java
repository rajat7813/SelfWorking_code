package com.edyt.mock.service;

import java.util.List;

import com.edyt.mock.dto.SE43GetComments;

public interface CommentService {
     List<SE43GetComments> getMockedCommentList();
     void createComment(String comment);
}
