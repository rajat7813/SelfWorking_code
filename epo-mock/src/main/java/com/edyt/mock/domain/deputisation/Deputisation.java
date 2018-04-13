package com.edyt.mock.domain.deputisation;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class Deputisation {
    private String accountroleaccount;
    private String accountroleassignmenttype;
    private String accountrolestartdate;
    private String accountroleenddate;
    private String assigneeroles;
    private String assignorroles;
    private String accountroledetailroletype;
    private String assignorfullname;
    private String assigneefullname;
    private String accountroledetailtype;
    private String accountroleid;
    private String accountrolestatuscode;

    public Deputisation copy() {
        return new Deputisation(accountroleaccount, accountroleassignmenttype, accountrolestartdate, accountroleenddate, assigneeroles,
                assignorroles, accountroledetailroletype, assignorfullname, assigneefullname, accountroledetailtype, accountroleid,
                accountrolestatuscode);
    }

    public Deputisation(DeputisationRequest request) {
        this.accountroleid = request.getAccountroleid();
        this.accountroleaccount = request.getAccountRoleAccount();
        this.accountroleassignmenttype = request.getAccountRoleAssignmentType();
        this.accountrolestartdate = request.getAccountRoleStartDate();
        this.accountroleenddate = request.getAccountRoleEndDate();
        this.accountrolestatuscode = request.getAccountRoleStatusCode();
    }
}
