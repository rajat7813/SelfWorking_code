
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
    "ProductTypeAttributeName",
    "ProductTypeAttributeValue"
})
public class ProductTypeAttribute {

    @JsonProperty("ProductTypeAttributeName")
    private String productTypeAttributeName;
    @JsonProperty("ProductTypeAttributeValue")
    private String productTypeAttributeValue;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("ProductTypeAttributeName")
    public String getProductTypeAttributeName() {
        return productTypeAttributeName;
    }

    @JsonProperty("ProductTypeAttributeName")
    public void setProductTypeAttributeName(String productTypeAttributeName) {
        this.productTypeAttributeName = productTypeAttributeName;
    }

    @JsonProperty("ProductTypeAttributeValue")
    public String getProductTypeAttributeValue() {
        return productTypeAttributeValue;
    }

    @JsonProperty("ProductTypeAttributeValue")
    public void setProductTypeAttributeValue(String productTypeAttributeValue) {
        this.productTypeAttributeValue = productTypeAttributeValue;
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
        return new ToStringBuilder(this).append("productTypeAttributeName", productTypeAttributeName).append("productTypeAttributeValue", productTypeAttributeValue).append("additionalProperties", additionalProperties).toString();
    }

}
