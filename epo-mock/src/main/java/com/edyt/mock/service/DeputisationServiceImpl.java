package com.edyt.mock.service;

import com.edyt.mock.domain.deputisation.AccountRoleStatusCode;
import com.edyt.mock.domain.deputisation.Deputisation;
import com.edyt.mock.domain.deputisation.FunctionalRoleFromData;
import com.edyt.mock.domain.deputisation.FunctionalRoleFromRequest;
import com.edyt.mock.domain.deputisation.FunctionalRolesList;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class DeputisationServiceImpl implements DeputisationService {

    private FunctionalRolesList functionalRolesStorage;

    public DeputisationServiceImpl() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        ClassPathResource functionalRolesRes = new ClassPathResource("bi/account/deputised-to-me.json");
        functionalRolesStorage = mapper.readValue(functionalRolesRes.getInputStream(), FunctionalRolesList.class);
    }

    private FunctionalRoleFromData getFunctionalRole(FunctionalRoleFromRequest role, String roleId) {
        return new FunctionalRoleFromData(role.getRoleName(), role.getStartDate(), role.getEndDate(),
                role.getRoleDetail(), role.getStatus(), role.getOrigDirectorate(), role.getStatusCode(), role.getRoleAssignor(),
                new FunctionalRoleFromData.TypedField( roleId == null ? getRandomId() : roleId, "number"),
                new FunctionalRoleFromData.TypedField( roleId == null ? getRandomId() : roleId, "number"), new FunctionalRoleFromData.TypedField( roleId == null ? getRandomId() : roleId, "number"));
    }

    @Override
    public void assignRole(FunctionalRoleFromRequest role) {
        functionalRolesStorage.getFunctionalRoles().getEmbedded().getResults().add(new FunctionalRolesList.FunctionalRoleWrapper(getFunctionalRole(role, null)));
    }

    @Override
    public void revokeRole(FunctionalRoleFromRequest role, String roleId) {
        FunctionalRoleFromData dataRole = getFunctionalRole(role, roleId);
        functionalRolesStorage.getFunctionalRoles().getEmbedded().getResults().remove(new FunctionalRolesList.FunctionalRoleWrapper(dataRole));
        role.setStatus("NActive");
        functionalRolesStorage.getFunctionalRoles().getEmbedded().getResults().add(new FunctionalRolesList.FunctionalRoleWrapper(dataRole));
    }

    @Override
    public String getFunctionalRolesResponse() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        return mapper.writeValueAsString(functionalRolesStorage);
    }

    @Override
    public void saveDeputisation(Deputisation deputisation) {
        Deputisation copy = deputisation.copy();
        if (deputisation.getAccountroleid() == null) {
            //add deputisation
            copy.setAccountroleid(getRandomId());
            //TODO add to storage
        } else {
            Integer deputisationIdx = findDeputisationIndexInStorage(copy.getAccountroleid());
            if(deputisationIdx != null) {
                //TODO update deputisation
            }
        }
    }

    public String getRandomId() {
        return "" + (int) (Math.random() * 10000);
    }

    @Override
    //this may not be what happens in the real system - we just want any change to see that the UI is being updated
    public void updateDeputisation(String accountroleid, AccountRoleStatusCode action) {
        switch (action) {
            case AM_ASS_Rejected:
            case AM_ASS_Revoked:
                removeDeputistation(accountroleid);
            case AM_ASS_Accepted:
                acceptDeputisation(accountroleid);
        }
    }

    private void removeDeputistation(String accountroleid) {
        Integer deputisationIdx = findDeputisationIndexInStorage(accountroleid);
        if (deputisationIdx != null) {
            //TODO remove from storage
        }
    }

    private void acceptDeputisation(String accountroleid) {
        Integer deputisationIdx = findDeputisationIndexInStorage(accountroleid);
        if (deputisationIdx != null) {
            // TODO update status 'Accepted'
        }
    }
    private Integer findDeputisationIndexInStorage(String accountroleid) {
        // TODO
        return null;
    }
}
