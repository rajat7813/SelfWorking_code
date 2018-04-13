package com.edyt.mock.domain.transactions;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AllocationRequest {
    @JsonProperty("Chairman")
    private String chairman;

    @JsonProperty("Examiner1")
    private String examiner1;

    @JsonProperty("Examiner2")
    private String examiner2;

    @JsonProperty("FilterChairman")
    private boolean filterChairman;

    @JsonProperty("FilterExaminer1")
    private boolean filterExaminer1;

    @JsonProperty("FilterExaminer2")
    private boolean filterExaminer2;

    @JsonProperty("AdvancedAllocation")
    private boolean advanced;

    @JsonProperty("Autosuggestion")
    private boolean autosuggestion;

    @JsonProperty("BatchAllocation")
    private boolean batch;

    @JsonProperty("TechnicalField")
    private String technicalField;

    @JsonProperty("SUBMIT")
    private String submit;
    
    @JsonProperty("Comment")
    private String comment;

    public boolean isFilled() {
        return getExaminer1() != null && (isAutosuggestion() || (getExaminer2() != null && getChairman() != null));
    }

    public boolean isFiltered() {
       return isFilterExaminer1() || isFilterExaminer2() || isFilterChairman();
    }

    public boolean isCorrect() {
        return getExaminer1() != null && !getExaminer1().equals(getExaminer2());
    }

    public boolean isSubmit() {
        if (submit == null) {
            return false;
        }

        return Boolean.valueOf(submit.toLowerCase());
    }

}
