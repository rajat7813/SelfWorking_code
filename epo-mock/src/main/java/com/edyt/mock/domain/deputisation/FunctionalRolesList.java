package com.edyt.mock.domain.deputisation;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class FunctionalRolesList {

    @JsonProperty("Functional_roles___Deputised_to_me")
    private FunctionalRoles functionalRoles;

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class FunctionalRoles {
        @JsonProperty("_embedded")
        private Embedded embedded;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Embedded {
        @JsonProperty("results")
        private List<FunctionalRoleWrapper> results;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class FunctionalRoleWrapper {
        @JsonProperty("Functional_Role")
        private FunctionalRoleFromData functionalRole;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            FunctionalRoleWrapper that = (FunctionalRoleWrapper) o;

            if (!functionalRole.equals(that.functionalRole)) return false;

            return true;
        }

        @Override
        public int hashCode() {
            return functionalRole.hashCode();
        }
    }


}


