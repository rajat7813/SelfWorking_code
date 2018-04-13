
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
    "ApplicationProcedureBiblioAttributeName",
    "ApplicationProcedureBiblioAttributeValue"
})
public class ApplicationProcedureBiblioAttribute {

    @JsonProperty("ApplicationProcedureBiblioAttributeName")
    private String applicationProcedureBiblioAttributeName;
    @JsonProperty("ApplicationProcedureBiblioAttributeValue")
    private String applicationProcedureBiblioAttributeValue;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("ApplicationProcedureBiblioAttributeName")
    public String getApplicationProcedureBiblioAttributeName() {
        return applicationProcedureBiblioAttributeName;
    }

    @JsonProperty("ApplicationProcedureBiblioAttributeName")
    public void setApplicationProcedureBiblioAttributeName(String applicationProcedureBiblioAttributeName) {
        this.applicationProcedureBiblioAttributeName = applicationProcedureBiblioAttributeName;
    }

    @JsonProperty("ApplicationProcedureBiblioAttributeValue")
    public String getApplicationProcedureBiblioAttributeValue() {
        return applicationProcedureBiblioAttributeValue;
    }

    @JsonProperty("ApplicationProcedureBiblioAttributeValue")
    public void setApplicationProcedureBiblioAttributeValue(String applicationProcedureBiblioAttributeValue) {
        this.applicationProcedureBiblioAttributeValue = applicationProcedureBiblioAttributeValue;
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
        return new ToStringBuilder(this).append("applicationProcedureBiblioAttributeName", applicationProcedureBiblioAttributeName).append("applicationProcedureBiblioAttributeValue", applicationProcedureBiblioAttributeValue).append("additionalProperties", additionalProperties).toString();
    }

}
