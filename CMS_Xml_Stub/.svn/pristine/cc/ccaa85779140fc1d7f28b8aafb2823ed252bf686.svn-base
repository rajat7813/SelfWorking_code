
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
    "sampledCaseCheck",
    "applicationType",
    "productType",
    "writtenOpinion",
    "currentWorkflowStatus",
    "currentTaskName",
    "signOff",
    "nextActor",
    "nextRole",
    "actorId",
    "communicationType",
    "action"
})
public class ProcessDetails {

    @JsonProperty("sampledCaseCheck")
    private String sampledCaseCheck;
    @JsonProperty("applicationType")
    private String applicationType;
    @JsonProperty("productType")
    private Object productType;
    @JsonProperty("writtenOpinion")
    private String writtenOpinion;
    @JsonProperty("currentWorkflowStatus")
    private String currentWorkflowStatus;
    @JsonProperty("currentTaskName")
    private String currentTaskName;
    @JsonProperty("signOff")
    private Object signOff;
    @JsonProperty("nextActor")
    private Object nextActor;
    @JsonProperty("nextRole")
    private Object nextRole;
    @JsonProperty("actorId")
    private Object actorId;
    @JsonProperty("communicationType")
    private String communicationType;
    @JsonProperty("action")
    private Object action;
    @JsonIgnore
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("sampledCaseCheck")
    public String getSampledCaseCheck() {
        return sampledCaseCheck;
    }

    @JsonProperty("sampledCaseCheck")
    public void setSampledCaseCheck(String sampledCaseCheck) {
        this.sampledCaseCheck = sampledCaseCheck;
    }

    @JsonProperty("applicationType")
    public String getApplicationType() {
        return applicationType;
    }

    @JsonProperty("applicationType")
    public void setApplicationType(String applicationType) {
        this.applicationType = applicationType;
    }

    @JsonProperty("productType")
    public Object getProductType() {
        return productType;
    }

    @JsonProperty("productType")
    public void setProductType(Object productType) {
        this.productType = productType;
    }

    @JsonProperty("writtenOpinion")
    public String getWrittenOpinion() {
        return writtenOpinion;
    }

    @JsonProperty("writtenOpinion")
    public void setWrittenOpinion(String writtenOpinion) {
        this.writtenOpinion = writtenOpinion;
    }

    @JsonProperty("currentWorkflowStatus")
    public String getCurrentWorkflowStatus() {
        return currentWorkflowStatus;
    }

    @JsonProperty("currentWorkflowStatus")
    public void setCurrentWorkflowStatus(String currentWorkflowStatus) {
        this.currentWorkflowStatus = currentWorkflowStatus;
    }

    @JsonProperty("currentTaskName")
    public String getCurrentTaskName() {
        return currentTaskName;
    }

    @JsonProperty("currentTaskName")
    public void setCurrentTaskName(String currentTaskName) {
        this.currentTaskName = currentTaskName;
    }

    @JsonProperty("signOff")
    public Object getSignOff() {
        return signOff;
    }

    @JsonProperty("signOff")
    public void setSignOff(Object signOff) {
        this.signOff = signOff;
    }

    @JsonProperty("nextActor")
    public Object getNextActor() {
        return nextActor;
    }

    @JsonProperty("nextActor")
    public void setNextActor(Object nextActor) {
        this.nextActor = nextActor;
    }

    @JsonProperty("nextRole")
    public Object getNextRole() {
        return nextRole;
    }

    @JsonProperty("nextRole")
    public void setNextRole(Object nextRole) {
        this.nextRole = nextRole;
    }

    @JsonProperty("actorId")
    public Object getActorId() {
        return actorId;
    }

    @JsonProperty("actorId")
    public void setActorId(Object actorId) {
        this.actorId = actorId;
    }

    @JsonProperty("communicationType")
    public String getCommunicationType() {
        return communicationType;
    }

    @JsonProperty("communicationType")
    public void setCommunicationType(String communicationType) {
        this.communicationType = communicationType;
    }

    @JsonProperty("action")
    public Object getAction() {
        return action;
    }

    @JsonProperty("action")
    public void setAction(Object action) {
        this.action = action;
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
        return new ToStringBuilder(this).append("sampledCaseCheck", sampledCaseCheck).append("applicationType", applicationType).append("productType", productType).append("writtenOpinion", writtenOpinion).append("currentWorkflowStatus", currentWorkflowStatus).append("currentTaskName", currentTaskName).append("signOff", signOff).append("nextActor", nextActor).append("nextRole", nextRole).append("actorId", actorId).append("communicationType", communicationType).append("action", action).append("additionalProperties", additionalProperties).toString();
    }

}
