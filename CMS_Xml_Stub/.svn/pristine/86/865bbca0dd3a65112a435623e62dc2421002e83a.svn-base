
package org.epo.userDetails;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "_id",
    "_links",
    "OrganisationID",
    "Organisation",
    "PreferredLanguage",
    "CASENAME",
    "UserID",
    "ID",
    "givenName",
    "familyName",
    "RoleName",
    "location",
    "email",
    "telephoneNumber"
})
public class UserAccount {

    @JsonProperty("_id")
    private Id id;
    @JsonProperty("_links")
    private Links_ links;
    @JsonProperty("OrganisationID")
    private String organisationID;
    @JsonProperty("Organisation")
    private String organisation;
    @JsonProperty("PreferredLanguage")
    private String preferredLanguage;
    @JsonProperty("CASENAME")
    private String cASENAME;
    @JsonProperty("UserID")
    private String userID;
    @JsonProperty("ID")
    private Id iD;
    @JsonProperty("givenName")
    private String givenName;
    @JsonProperty("familyName")
    private String familyName;
    @JsonProperty("RoleName")
    private List<String> roleName = null;
    @JsonProperty("location")
    private String location;
    @JsonProperty("email")
    private Object email;
    @JsonProperty("telephoneNumber")
    private String telephoneNumber;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("_id")
    public Id getId() {
        return id;
    }

    @JsonProperty("_id")
    public void setId(Id id) {
        this.id = id;
    }

    @JsonProperty("_links")
    public Links_ getLinks() {
        return links;
    }

    @JsonProperty("_links")
    public void setLinks(Links_ links) {
        this.links = links;
    }

    @JsonProperty("OrganisationID")
    public String getOrganisationID() {
        return organisationID;
    }

    @JsonProperty("OrganisationID")
    public void setOrganisationID(String organisationID) {
        this.organisationID = organisationID;
    }

    @JsonProperty("Organisation")
    public String getOrganisation() {
        return organisation;
    }

    @JsonProperty("Organisation")
    public void setOrganisation(String organisation) {
        this.organisation = organisation;
    }

    @JsonProperty("PreferredLanguage")
    public String getPreferredLanguage() {
        return preferredLanguage;
    }

    @JsonProperty("PreferredLanguage")
    public void setPreferredLanguage(String preferredLanguage) {
        this.preferredLanguage = preferredLanguage;
    }

    @JsonProperty("CASENAME")
    public String getCASENAME() {
        return cASENAME;
    }

    @JsonProperty("CASENAME")
    public void setCASENAME(String cASENAME) {
        this.cASENAME = cASENAME;
    }

    @JsonProperty("UserID")
    public String getUserID() {
        return userID;
    }

    @JsonProperty("UserID")
    public void setUserID(String userID) {
        this.userID = userID;
    }

   

    public Id getiD() {
		return iD;
	}

	public void setiD(Id iD) {
		this.iD = iD;
	}

	@JsonProperty("givenName")
    public String getGivenName() {
        return givenName;
    }

    @JsonProperty("givenName")
    public void setGivenName(String givenName) {
        this.givenName = givenName;
    }

    @JsonProperty("familyName")
    public String getFamilyName() {
        return familyName;
    }

    @JsonProperty("familyName")
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    @JsonProperty("RoleName")
    public List<String> getRoleName() {
        return roleName;
    }

    @JsonProperty("RoleName")
    public void setRoleName(List<String> roleName) {
        this.roleName = roleName;
    }

    @JsonProperty("location")
    public String getLocation() {
        return location;
    }

    @JsonProperty("location")
    public void setLocation(String location) {
        this.location = location;
    }

    @JsonProperty("email")
    public Object getEmail() {
        return email;
    }

    @JsonProperty("email")
    public void setEmail(Object email) {
        this.email = email;
    }

    @JsonProperty("telephoneNumber")
    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    @JsonProperty("telephoneNumber")
    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

}
