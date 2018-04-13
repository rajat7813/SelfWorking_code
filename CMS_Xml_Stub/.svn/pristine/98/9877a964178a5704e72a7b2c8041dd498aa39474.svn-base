
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
    "ProductOrderTypeAttributeName",
    "ProductOrderTypeAttributeValue"
})
public class ProductOrderAttribute {

    @JsonProperty("ProductOrderTypeAttributeName")
    private String productOrderTypeAttributeName;
    @JsonProperty("ProductOrderTypeAttributeValue")
    private String productOrderTypeAttributeValue;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("ProductOrderTypeAttributeName")
    public String getProductOrderTypeAttributeName() {
        return productOrderTypeAttributeName;
    }

    @JsonProperty("ProductOrderTypeAttributeName")
    public void setProductOrderTypeAttributeName(String productOrderTypeAttributeName) {
        this.productOrderTypeAttributeName = productOrderTypeAttributeName;
    }

    @JsonProperty("ProductOrderTypeAttributeValue")
    public String getProductOrderTypeAttributeValue() {
        return productOrderTypeAttributeValue;
    }

    @JsonProperty("ProductOrderTypeAttributeValue")
    public void setProductOrderTypeAttributeValue(String productOrderTypeAttributeValue) {
        this.productOrderTypeAttributeValue = productOrderTypeAttributeValue;
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
        return new ToStringBuilder(this).append("productOrderTypeAttributeName", productOrderTypeAttributeName).append("productOrderTypeAttributeValue", productOrderTypeAttributeValue).append("additionalProperties", additionalProperties).toString();
    }

}
