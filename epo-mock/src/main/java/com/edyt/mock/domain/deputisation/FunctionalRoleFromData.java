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
public class FunctionalRoleFromData {
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
    @JsonProperty("_id")
    private TypedField id;
    @JsonProperty("FunctionalRoleRecordId")
    private TypedField recordId;
    @JsonProperty("refCaseID")
    private TypedField refCaseId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FunctionalRoleFromData that = (FunctionalRoleFromData) o;

        if (roleName != null ? !roleName.equals(that.roleName) : that.roleName != null) return false;
        if (startDate != null ? !startDate.equals(that.startDate) : that.startDate != null) return false;
        if (endDate != null ? !endDate.equals(that.endDate) : that.endDate != null) return false;
        if (roleDetail != null ? !roleDetail.equals(that.roleDetail) : that.roleDetail != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (origDirectorate != null ? !origDirectorate.equals(that.origDirectorate) : that.origDirectorate != null)
            return false;
        if (statusCode != null ? !statusCode.equals(that.statusCode) : that.statusCode != null) return false;
        if (roleAssignor != null ? !roleAssignor.equals(that.roleAssignor) : that.roleAssignor != null) return false;
        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (recordId != null ? !recordId.equals(that.recordId) : that.recordId != null) return false;
        return refCaseId != null ? refCaseId.equals(that.refCaseId) : that.refCaseId == null;

    }

    @Override
    public int hashCode() {
        int result = roleName != null ? roleName.hashCode() : 0;
        result = 31 * result + (startDate != null ? startDate.hashCode() : 0);
        result = 31 * result + (endDate != null ? endDate.hashCode() : 0);
        result = 31 * result + (roleDetail != null ? roleDetail.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (origDirectorate != null ? origDirectorate.hashCode() : 0);
        result = 31 * result + (statusCode != null ? statusCode.hashCode() : 0);
        result = 31 * result + (roleAssignor != null ? roleAssignor.hashCode() : 0);
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (recordId != null ? recordId.hashCode() : 0);
        result = 31 * result + (refCaseId != null ? refCaseId.hashCode() : 0);
        return result;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class TypedField {
        @JsonProperty("#text")
        private String value;
        @JsonProperty("@type")
        private String type;
    }


}
