package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 05.05.16.
 */
@Getter
@Setter
@NoArgsConstructor
public class AnnotationsMetaLinks {

    @JsonProperty("annotation:content")
    private Href annotationsContent = new Href("http://kimeapi-i.internal.epo.org/api/tei/annotation/{id}");
    private Href parent;
    private Href self;
}
