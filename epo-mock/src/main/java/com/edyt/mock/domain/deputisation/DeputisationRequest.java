package com.edyt.mock.domain.deputisation;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DeputisationRequest {
    private String accountroleid;
    private String accountRoleAccount;
    private String accountRoleAssignmentType;
    private String accountRoleStartDate;
    private String accountRoleEndDate;
    private String accountRoleStatusCode;
}
