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
public class AllocationPayload {
    @JsonProperty("objects")
    private Content content;

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Content {
        @JsonProperty("AS_SUBMIT")
        private SubmitRequest submit;

        @JsonProperty("Assign_examiners_and_stockmanager")
        private AllocationRequest allocation;
    }

    public boolean isSubmitted() {
        if (this.content != null && this.content.getAllocation() != null && this.content.getAllocation().isBatch()) {
            return this.content.getSubmit() != null && this.content.getAllocation().isSubmit();
        }
        return this.content != null && this.content.getSubmit() != null;
    }

    public boolean isFilled() {
        if (this.content != null && this.content.getAllocation() != null) {
            return this.content.getAllocation().isFilled();
        } else {
            return false;
        }
    }

    public boolean isFiltered() {
        if (this.content != null && this.content.getAllocation() != null) {
            return this.content.getAllocation().isFiltered();
        } else {
            return false;
        }
    }

    public boolean isCorrect() {
        if (this.content != null && this.content.getAllocation() != null) {
            return this.content.getAllocation().isCorrect();
        } else {
            return true;
        }
    }

    public boolean isAdvanced() {
        return this.content != null && this.content.getAllocation() != null && this.content.getAllocation()
                .isAdvanced();
    }
}
