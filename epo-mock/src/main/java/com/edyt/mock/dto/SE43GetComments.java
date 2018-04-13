package com.edyt.mock.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class SE43GetComments {

    @JsonProperty(value = "SE43_Result")
    private String result;
    @JsonProperty(value = "SE43_Explanation")
    private String explanation;
    @JsonProperty(value = "AuthorId")
    private String authorId;
    @JsonProperty(value = "CreatedDateTime")
    private String createdDateTime;
    @JsonProperty(value = "Text")
    private String text;
    @JsonProperty(value = "RelatedTransaction")
    private String relatedTransaction;
    @JsonProperty(value = "DOSSIERNUMBER")
    private String dossierNumber;
    @JsonProperty(value = "APPLICATIONNUMBER")
    private String applicationNumber;
    @JsonProperty(value = "CaseId")
    private String caseId;
    @JsonProperty(value = "CMT_ID")
    private String cmtId;
}