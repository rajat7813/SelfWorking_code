package com.edyt.mock.domain.deputisation;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FunctionalRoleSettingsPayload {
    @JsonProperty("objects")
    private Content content;

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Content {
        @JsonProperty("Functional_role_settings")
        private FunctionalRoleFromRequest role;
    }
}
