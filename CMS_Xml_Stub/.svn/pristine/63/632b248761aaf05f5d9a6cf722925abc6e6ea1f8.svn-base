
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
    "_links",
    "filter",
    "dynamicschema",
    "paging",
    "sorting",
    "_embedded"
})
public class ListUserAccounts {

    @JsonProperty("_links")
    private Links links;
    @JsonProperty("filter")
    private List<Filter> filter = null;
    @JsonProperty("dynamicschema")
    private Dynamicschema dynamicschema;
    @JsonProperty("paging")
    private Paging paging;
    @JsonProperty("sorting")
    private Sorting sorting;
    @JsonProperty("_embedded")
    private Embedded embedded;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("_links")
    public Links getLinks() {
        return links;
    }

    @JsonProperty("_links")
    public void setLinks(Links links) {
        this.links = links;
    }

    @JsonProperty("filter")
    public List<Filter> getFilter() {
        return filter;
    }

    @JsonProperty("filter")
    public void setFilter(List<Filter> filter) {
        this.filter = filter;
    }

    @JsonProperty("dynamicschema")
    public Dynamicschema getDynamicschema() {
        return dynamicschema;
    }

    @JsonProperty("dynamicschema")
    public void setDynamicschema(Dynamicschema dynamicschema) {
        this.dynamicschema = dynamicschema;
    }

    @JsonProperty("paging")
    public Paging getPaging() {
        return paging;
    }

    @JsonProperty("paging")
    public void setPaging(Paging paging) {
        this.paging = paging;
    }

    @JsonProperty("sorting")
    public Sorting getSorting() {
        return sorting;
    }

    @JsonProperty("sorting")
    public void setSorting(Sorting sorting) {
        this.sorting = sorting;
    }

    @JsonProperty("_embedded")
    public Embedded getEmbedded() {
        return embedded;
    }

    @JsonProperty("_embedded")
    public void setEmbedded(Embedded embedded) {
        this.embedded = embedded;
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
