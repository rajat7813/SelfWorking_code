package com.edyt.mock.controllers.bi;

import com.edyt.mock.util.ResponseUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
public class RoleController {

    @RequestMapping(path = "/restServices/ui/RoleManagement/RoleManagementCase", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getRoleManagementCase() {
        return ResponseUtil.serveJsonResource("bi/role/role-management-case.json");
    }

    @RequestMapping(path = "/restServices/ui/RoleManagement/REG_Role_Management_caseview/{caseId}/RolesAndPermissions", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getRolesAndPermissions(@PathVariable String caseId) {
        return ResponseUtil.serveJsonResource("bi/role/roles-and-permissions.json");
    }

    @RequestMapping(path = "/restServices/ui/RoleManagement/RolesAndPermissions", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getAssociatedRolesAndPermissions() {
        return ResponseUtil.serveJsonResource("bi/role/associated-roles-and-permissions.json");
    }

    @RequestMapping(path = "/restServices/ListNewAccountRoles/{caseId}/{userId}", produces = "application/json", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> listNewAccountRoles(@PathVariable String caseId, @PathVariable String userId) throws IOException {
        if (caseId.hashCode() % 3 == 0) {
            return ResponseUtil.serveJsonResource("bi/role/list-new-account-roles-error.json", HttpStatus.BAD_REQUEST);
        }
        return ResponseUtil.serveJsonResource("bi/role/list-new-account-roles.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ViewFunctionalRoleHistory",
            produces = "application/json", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> viewFunctionalRoleHistory(@RequestParam("sourcerolerecordid") String recordId) {
        return ResponseUtil.serveJsonResource("bi/role/view-functional-role-history.json");
    }
}
