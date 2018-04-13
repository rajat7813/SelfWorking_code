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
public class SERequest {

    @JsonProperty("ApplicationNumber")
    private String applicationNumber;
    @JsonProperty("Text")
    private String text;

}
