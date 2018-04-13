
package org.epo.readDossier;

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
    "ID06ReadDossier"
})
public class Example {

    @JsonProperty("ID06ReadDossier")
    private List<ID06ReadDossier> iD06ReadDossier = null;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("ID06ReadDossier")
    public List<ID06ReadDossier> getID06ReadDossier() {
        return iD06ReadDossier;
    }

    @JsonProperty("ID06ReadDossier")
    public void setID06ReadDossier(List<ID06ReadDossier> iD06ReadDossier) {
        this.iD06ReadDossier = iD06ReadDossier;
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
