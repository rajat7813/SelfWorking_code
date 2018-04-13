package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create History Payload
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HistoryPayload {
    @JsonProperty("objects")
    private HistoryContent historyContent;
}
