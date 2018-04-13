
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
    "TimeLimitTypeDesc",
    "BusinessTaskId",
    "TimeLimitValue",
    "LimitDateType"
})
public class TimeLimit {

    @JsonProperty("TimeLimitTypeDesc")
    private String timeLimitTypeDesc;
    @JsonProperty("BusinessTaskId")
    private String businessTaskId;
    @JsonProperty("TimeLimitValue")
    private String timeLimitValue;
    @JsonProperty("LimitDateType")
    private String limitDateType;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("TimeLimitTypeDesc")
    public String getTimeLimitTypeDesc() {
        return timeLimitTypeDesc;
    }

    @JsonProperty("TimeLimitTypeDesc")
    public void setTimeLimitTypeDesc(String timeLimitTypeDesc) {
        this.timeLimitTypeDesc = timeLimitTypeDesc;
    }

    @JsonProperty("BusinessTaskId")
    public String getBusinessTaskId() {
        return businessTaskId;
    }

    @JsonProperty("BusinessTaskId")
    public void setBusinessTaskId(String businessTaskId) {
        this.businessTaskId = businessTaskId;
    }

    @JsonProperty("TimeLimitValue")
    public String getTimeLimitValue() {
        return timeLimitValue;
    }

    @JsonProperty("TimeLimitValue")
    public void setTimeLimitValue(String timeLimitValue) {
        this.timeLimitValue = timeLimitValue;
    }

    @JsonProperty("LimitDateType")
    public String getLimitDateType() {
        return limitDateType;
    }

    @JsonProperty("LimitDateType")
    public void setLimitDateType(String limitDateType) {
        this.limitDateType = limitDateType;
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
        return new ToStringBuilder(this).append("timeLimitTypeDesc", timeLimitTypeDesc).append("businessTaskId", businessTaskId).append("timeLimitValue", timeLimitValue).append("limitDateType", limitDateType).append("additionalProperties", additionalProperties).toString();
    }

}
