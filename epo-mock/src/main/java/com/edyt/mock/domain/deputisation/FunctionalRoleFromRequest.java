package com.edyt.mock.domain.deputisation;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class FunctionalRoleFromRequest {
    @JsonProperty("RoleName")
    private String roleName;
    @JsonProperty("StartDateAssignmentType")
    private String startDate;
    @JsonProperty("EndDateAssignmentType")
    private String endDate;
    @JsonProperty("AssignmentRoleDetail")
    private String roleDetail;
    @JsonProperty("StatusAccountRole")
    private String status;
    @JsonProperty("OriDirectorateID")
    private String origDirectorate;
    @JsonProperty("RoleAssignmentStatus")
    private String statusCode;
    @JsonProperty("RoleAssignor")
    private String roleAssignor;
}
