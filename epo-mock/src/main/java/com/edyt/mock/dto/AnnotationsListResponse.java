package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 04.05.16.
 */
@NoArgsConstructor
@Getter
@Setter
public class AnnotationsListResponse {
    private int pages = 1;
    private int length = 100;
    private int page = 0;
    private int records;

    @JsonProperty("_links")
    AnnotationsMetaLinks links = new AnnotationsMetaLinks();

    @JsonProperty("_embedded")
    private AnnotationsEmbedded embedded = new AnnotationsEmbedded();
}
