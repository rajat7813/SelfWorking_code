
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
import org.apache.commons.lang.builder.ToStringBuilder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "dossierDetail",
    "productOrderInvolvement",
    "applicationProcedureBiblioAttribute",
    "productOrderAttribute",
    "timeLimit",
    "productTypeAttribute"
})
public class DossierInfo {

    @JsonProperty("dossierDetail")
    private DossierDetail dossierDetail;
    @JsonProperty("productOrderInvolvement")
    private List<ProductOrderInvolvement> productOrderInvolvement = null;
    @JsonProperty("applicationProcedureBiblioAttribute")
    private List<ApplicationProcedureBiblioAttribute> applicationProcedureBiblioAttribute = null;
    @JsonProperty("productOrderAttribute")
    private List<ProductOrderAttribute> productOrderAttribute = null;
    @JsonProperty("timeLimit")
    private List<TimeLimit> timeLimit = null;
    @JsonProperty("productTypeAttribute")
    private List<ProductTypeAttribute> productTypeAttribute = null;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("dossierDetail")
    public DossierDetail getDossierDetail() {
        return dossierDetail;
    }

    @JsonProperty("dossierDetail")
    public void setDossierDetail(DossierDetail dossierDetail) {
        this.dossierDetail = dossierDetail;
    }

    @JsonProperty("productOrderInvolvement")
    public List<ProductOrderInvolvement> getProductOrderInvolvement() {
        return productOrderInvolvement;
    }

    @JsonProperty("productOrderInvolvement")
    public void setProductOrderInvolvement(List<ProductOrderInvolvement> productOrderInvolvement) {
        this.productOrderInvolvement = productOrderInvolvement;
    }

    @JsonProperty("applicationProcedureBiblioAttribute")
    public List<ApplicationProcedureBiblioAttribute> getApplicationProcedureBiblioAttribute() {
        return applicationProcedureBiblioAttribute;
    }

    @JsonProperty("applicationProcedureBiblioAttribute")
    public void setApplicationProcedureBiblioAttribute(List<ApplicationProcedureBiblioAttribute> applicationProcedureBiblioAttribute) {
        this.applicationProcedureBiblioAttribute = applicationProcedureBiblioAttribute;
    }

    @JsonProperty("productOrderAttribute")
    public List<ProductOrderAttribute> getProductOrderAttribute() {
        return productOrderAttribute;
    }

    @JsonProperty("productOrderAttribute")
    public void setProductOrderAttribute(List<ProductOrderAttribute> productOrderAttribute) {
        this.productOrderAttribute = productOrderAttribute;
    }

    @JsonProperty("timeLimit")
    public List<TimeLimit> getTimeLimit() {
        return timeLimit;
    }

    @JsonProperty("timeLimit")
    public void setTimeLimit(List<TimeLimit> timeLimit) {
        this.timeLimit = timeLimit;
    }

    @JsonProperty("productTypeAttribute")
    public List<ProductTypeAttribute> getProductTypeAttribute() {
        return productTypeAttribute;
    }

    @JsonProperty("productTypeAttribute")
    public void setProductTypeAttribute(List<ProductTypeAttribute> productTypeAttribute) {
        this.productTypeAttribute = productTypeAttribute;
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
        return new ToStringBuilder(this).append("dossierDetail", dossierDetail).append("productOrderInvolvement", productOrderInvolvement).append("applicationProcedureBiblioAttribute", applicationProcedureBiblioAttribute).append("productOrderAttribute", productOrderAttribute).append("timeLimit", timeLimit).append("productTypeAttribute", productTypeAttribute).append("additionalProperties", additionalProperties).toString();
    }

}
