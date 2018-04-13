
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
    "stringfilter",
    "choicefilter"
})
public class Filter {

    @JsonProperty("stringfilter")
    private Stringfilter stringfilter;
    @JsonProperty("choicefilter")
    private Choicefilter choicefilter;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("stringfilter")
    public Stringfilter getStringfilter() {
        return stringfilter;
    }

    @JsonProperty("stringfilter")
    public void setStringfilter(Stringfilter stringfilter) {
        this.stringfilter = stringfilter;
    }

    @JsonProperty("choicefilter")
    public Choicefilter getChoicefilter() {
        return choicefilter;
    }

    @JsonProperty("choicefilter")
    public void setChoicefilter(Choicefilter choicefilter) {
        this.choicefilter = choicefilter;
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
