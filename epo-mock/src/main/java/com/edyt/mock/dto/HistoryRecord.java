package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create History Record
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HistoryRecord {
    @JsonProperty("TypeOfLog")
    private String log;
    @JsonProperty("Description")
    private String description;
}
