
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
    "totalresults",
    "pagesize",
    "param",
    "currentpage",
    "maxpages"
})
public class Paging {

    @JsonProperty("totalresults")
    private Totalresults totalresults;
    @JsonProperty("pagesize")
    private Pagesize pagesize;
    @JsonProperty("param")
    private String param;
    @JsonProperty("currentpage")
    private Currentpage currentpage;
    @JsonProperty("maxpages")
    private Maxpages maxpages;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("totalresults")
    public Totalresults getTotalresults() {
        return totalresults;
    }

    @JsonProperty("totalresults")
    public void setTotalresults(Totalresults totalresults) {
        this.totalresults = totalresults;
    }

    @JsonProperty("pagesize")
    public Pagesize getPagesize() {
        return pagesize;
    }

    @JsonProperty("pagesize")
    public void setPagesize(Pagesize pagesize) {
        this.pagesize = pagesize;
    }

    @JsonProperty("param")
    public String getParam() {
        return param;
    }

    @JsonProperty("param")
    public void setParam(String param) {
        this.param = param;
    }

    @JsonProperty("currentpage")
    public Currentpage getCurrentpage() {
        return currentpage;
    }

    @JsonProperty("currentpage")
    public void setCurrentpage(Currentpage currentpage) {
        this.currentpage = currentpage;
    }

    @JsonProperty("maxpages")
    public Maxpages getMaxpages() {
        return maxpages;
    }

    @JsonProperty("maxpages")
    public void setMaxpages(Maxpages maxpages) {
        this.maxpages = maxpages;
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
