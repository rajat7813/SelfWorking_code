package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CommentRequest {

    @JsonProperty("objects")
    private Objects objects;

    public String getText() {
        return objects.getRequest().getText();  	
    }

    public String getApplicationNumber() {
        return objects.getRequest().getApplicationNumber();
    }
}
