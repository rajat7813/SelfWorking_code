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
public class RevokeRoleRequest {
    @JsonProperty("objects")
    private RevokeRolePayload objects;
}
