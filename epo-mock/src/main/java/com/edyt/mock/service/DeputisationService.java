package com.edyt.mock.service;

import com.edyt.mock.domain.deputisation.AccountRoleStatusCode;
import com.edyt.mock.domain.deputisation.Deputisation;
import com.edyt.mock.domain.deputisation.FunctionalRoleFromRequest;

import java.io.IOException;

public interface DeputisationService {
    void saveDeputisation(Deputisation deputisation);
    void updateDeputisation(String accountroleid, AccountRoleStatusCode action);
    void assignRole(FunctionalRoleFromRequest role);
    void revokeRole(FunctionalRoleFromRequest role, String roleId);
    String getFunctionalRolesResponse() throws IOException;
}
