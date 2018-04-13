
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
    "param",
    "currentpagesize",
    "option"
})
public class Pagesize {

    @JsonProperty("param")
    private String param;
    @JsonProperty("currentpagesize")
    private Currentpagesize currentpagesize;
    @JsonProperty("option")
    private List<Option_> option = null;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("param")
    public String getParam() {
        return param;
    }

    @JsonProperty("param")
    public void setParam(String param) {
        this.param = param;
    }

    @JsonProperty("currentpagesize")
    public Currentpagesize getCurrentpagesize() {
        return currentpagesize;
    }

    @JsonProperty("currentpagesize")
    public void setCurrentpagesize(Currentpagesize currentpagesize) {
        this.currentpagesize = currentpagesize;
    }

    @JsonProperty("option")
    public List<Option_> getOption() {
        return option;
    }

    @JsonProperty("option")
    public void setOption(List<Option_> option) {
        this.option = option;
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
