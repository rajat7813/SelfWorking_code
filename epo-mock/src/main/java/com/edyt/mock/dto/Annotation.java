package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 04.05.16.
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Annotation {

    @JsonProperty("_links")
    private Links links;
    private String id;

}
