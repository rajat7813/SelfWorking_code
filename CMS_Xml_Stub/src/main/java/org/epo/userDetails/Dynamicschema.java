
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
    "PreferredLanguage",
    "RoleName",
    "location"
})
public class Dynamicschema {

    @JsonProperty("PreferredLanguage")
    private List<PreferredLanguage> preferredLanguage = null;
    @JsonProperty("RoleName")
    private List<RoleName> roleName = null;
    @JsonProperty("location")
    private List<Location> location = null;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("PreferredLanguage")
    public List<PreferredLanguage> getPreferredLanguage() {
        return preferredLanguage;
    }

    @JsonProperty("PreferredLanguage")
    public void setPreferredLanguage(List<PreferredLanguage> preferredLanguage) {
        this.preferredLanguage = preferredLanguage;
    }

    @JsonProperty("RoleName")
    public List<RoleName> getRoleName() {
        return roleName;
    }

    @JsonProperty("RoleName")
    public void setRoleName(List<RoleName> roleName) {
        this.roleName = roleName;
    }

    @JsonProperty("location")
    public List<Location> getLocation() {
        return location;
    }

    @JsonProperty("location")
    public void setLocation(List<Location> location) {
        this.location = location;
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
