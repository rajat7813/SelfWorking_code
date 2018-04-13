
package org.epo.userDetails;

import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "List_user_accounts"
})
public class AcountDetails {

    @JsonProperty("List_user_accounts")
    private ListUserAccounts listUserAccounts;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("List_user_accounts")
    public ListUserAccounts getListUserAccounts() {
        return listUserAccounts;
    }

    @JsonProperty("List_user_accounts")
    public void setListUserAccounts(ListUserAccounts listUserAccounts) {
        this.listUserAccounts = listUserAccounts;
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
