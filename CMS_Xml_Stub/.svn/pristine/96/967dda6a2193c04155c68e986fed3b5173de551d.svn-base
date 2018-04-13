
package org.epo.readDossier;

import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import org.apache.commons.lang.builder.ToStringBuilder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "InvolvementRole",
    "InvolvementUser",
    "ProposedFlag"
})
public class ProductOrderInvolvement {

    @JsonProperty("InvolvementRole")
    private String involvementRole;
    @JsonProperty("InvolvementUser")
    private String involvementUser;
    @JsonProperty("ProposedFlag")
    private String proposedFlag;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("InvolvementRole")
    public String getInvolvementRole() {
        return involvementRole;
    }

    @JsonProperty("InvolvementRole")
    public void setInvolvementRole(String involvementRole) {
        this.involvementRole = involvementRole;
    }

    @JsonProperty("InvolvementUser")
    public String getInvolvementUser() {
        return involvementUser;
    }

    @JsonProperty("InvolvementUser")
    public void setInvolvementUser(String involvementUser) {
        this.involvementUser = involvementUser;
    }

    @JsonProperty("ProposedFlag")
    public String getProposedFlag() {
        return proposedFlag;
    }

    @JsonProperty("ProposedFlag")
    public void setProposedFlag(String proposedFlag) {
        this.proposedFlag = proposedFlag;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("involvementRole", involvementRole).append("involvementUser", involvementUser).append("proposedFlag", proposedFlag).append("additionalProperties", additionalProperties).toString();
    }

}
