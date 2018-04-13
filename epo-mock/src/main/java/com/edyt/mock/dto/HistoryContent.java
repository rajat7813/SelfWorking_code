package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Create History Content
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class HistoryContent {
    @JsonProperty("Create_History_record")
    private HistoryRecord historyRecord;
}
