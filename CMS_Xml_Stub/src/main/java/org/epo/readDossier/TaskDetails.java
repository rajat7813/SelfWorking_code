
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
    "readIndicator",
    "opinionIndicator",
    "feesIndicator",
    "taskProvenance",
    "taskName",
    "workFlowStatus",
    "phaseIndicator",
    "dossierType",
    "dossierNumber",
    "proceduralLanguage",
    "dossierTitle",
    "applicantName",
    "preClassNo",
    "numberOfClaims",
    "independentClaims",
    "numberOfPages",
    "proceduralComments",
    "numberOfRelatedDossier",
    "stickers",
    "userGeneratedTag",
    "targetMonth",
    "priorityNumber",
    "publicationDate",
    "chairman",
    "firstExaminer",
    "secondExaminer",
    "legalMember",
    "limitDateType",
    "limitDate",
    "accountID",
    "directorate",
    "receiveDate",
    "urgency",
    "taskDescription",
    "lastActionDate",
    "lastActionActor",
    "lastActionResult",
    "lastActionComment",
    "allocatedRole",
    "allocatedUserId",
    "communicationType"
})
public class TaskDetails {

    @JsonProperty("readIndicator")
    private String readIndicator;
    @JsonProperty("opinionIndicator")
    private String opinionIndicator;
    @JsonProperty("feesIndicator")
    private Boolean feesIndicator;
    @JsonProperty("taskProvenance")
    private String taskProvenance;
    @JsonProperty("taskName")
    private String taskName;
    @JsonProperty("workFlowStatus")
    private String workFlowStatus;
    @JsonProperty("phaseIndicator")
    private String phaseIndicator;
    @JsonProperty("dossierType")
    private String dossierType;
    @JsonProperty("dossierNumber")
    private String dossierNumber;
    @JsonProperty("proceduralLanguage")
    private String proceduralLanguage;
    @JsonProperty("dossierTitle")
    private String dossierTitle;
    @JsonProperty("applicantName")
    private String applicantName;
    @JsonProperty("preClassNo")
    private String preClassNo;
    @JsonProperty("numberOfClaims")
    private String numberOfClaims;
    @JsonProperty("independentClaims")
    private String independentClaims;
    @JsonProperty("numberOfPages")
    private String numberOfPages;
    @JsonProperty("proceduralComments")
    private String proceduralComments;
    @JsonProperty("numberOfRelatedDossier")
    private String numberOfRelatedDossier;
    @JsonProperty("stickers")
    private List<String> stickers = null;
    @JsonProperty("userGeneratedTag")
    private List<String> userGeneratedTag = null;
    @JsonProperty("targetMonth")
    private String targetMonth;
    @JsonProperty("priorityNumber")
    private String priorityNumber;
    @JsonProperty("publicationDate")
    private String publicationDate;
    @JsonProperty("chairman")
    private String chairman;
    @JsonProperty("firstExaminer")
    private String firstExaminer;
    @JsonProperty("secondExaminer")
    private String secondExaminer;
    @JsonProperty("legalMember")
    private String legalMember;
    @JsonProperty("limitDateType")
    private String limitDateType;
    @JsonProperty("limitDate")
    private String limitDate;
    @JsonProperty("accountID")
    private String accountID;
    @JsonProperty("directorate")
    private String directorate;
    @JsonProperty("receiveDate")
    private String receiveDate;
    @JsonProperty("urgency")
    private String urgency;
    @JsonProperty("taskDescription")
    private String taskDescription;
    @JsonProperty("lastActionDate")
    private String lastActionDate;
    @JsonProperty("lastActionActor")
    private String lastActionActor;
    @JsonProperty("lastActionResult")
    private String lastActionResult;
    @JsonProperty("lastActionComment")
    private String lastActionComment;
    @JsonProperty("allocatedRole")
    private String allocatedRole;
    @JsonProperty("allocatedUserId")
    private String allocatedUserId;
    @JsonProperty("communicationType")
    private String communicationType;

    @JsonProperty("readIndicator")
    public String getReadIndicator() {
        return readIndicator;
    }

    @JsonProperty("readIndicator")
    public void setReadIndicator(String readIndicator) {
        this.readIndicator = readIndicator;
    }

    @JsonProperty("opinionIndicator")
    public String getOpinionIndicator() {
        return opinionIndicator;
    }

    @JsonProperty("opinionIndicator")
    public void setOpinionIndicator(String opinionIndicator) {
        this.opinionIndicator = opinionIndicator;
    }

    @JsonProperty("feesIndicator")
    public Boolean getFeesIndicator() {
        return feesIndicator;
    }

    @JsonProperty("feesIndicator")
    public void setFeesIndicator(Boolean feesIndicator) {
        this.feesIndicator = feesIndicator;
    }

    @JsonProperty("taskProvenance")
    public String getTaskProvenance() {
        return taskProvenance;
    }

    @JsonProperty("taskProvenance")
    public void setTaskProvenance(String taskProvenance) {
        this.taskProvenance = taskProvenance;
    }

    @JsonProperty("taskName")
    public String getTaskName() {
        return taskName;
    }

    @JsonProperty("taskName")
    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    @JsonProperty("workFlowStatus")
    public String getWorkFlowStatus() {
        return workFlowStatus;
    }

    @JsonProperty("workFlowStatus")
    public void setWorkFlowStatus(String workFlowStatus) {
        this.workFlowStatus = workFlowStatus;
    }

    @JsonProperty("phaseIndicator")
    public String getPhaseIndicator() {
        return phaseIndicator;
    }

    @JsonProperty("phaseIndicator")
    public void setPhaseIndicator(String phaseIndicator) {
        this.phaseIndicator = phaseIndicator;
    }

    @JsonProperty("dossierType")
    public String getDossierType() {
        return dossierType;
    }

    @JsonProperty("dossierType")
    public void setDossierType(String dossierType) {
        this.dossierType = dossierType;
    }

    @JsonProperty("dossierNumber")
    public String getDossierNumber() {
        return dossierNumber;
    }

    @JsonProperty("dossierNumber")
    public void setDossierNumber(String dossierNumber) {
        this.dossierNumber = dossierNumber;
    }

    @JsonProperty("proceduralLanguage")
    public String getProceduralLanguage() {
        return proceduralLanguage;
    }

    @JsonProperty("proceduralLanguage")
    public void setProceduralLanguage(String proceduralLanguage) {
        this.proceduralLanguage = proceduralLanguage;
    }

    @JsonProperty("dossierTitle")
    public String getDossierTitle() {
        return dossierTitle;
    }

    @JsonProperty("dossierTitle")
    public void setDossierTitle(String dossierTitle) {
        this.dossierTitle = dossierTitle;
    }

    @JsonProperty("applicantName")
    public String getApplicantName() {
        return applicantName;
    }

    @JsonProperty("applicantName")
    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    @JsonProperty("preClassNo")
    public String getPreClassNo() {
        return preClassNo;
    }

    @JsonProperty("preClassNo")
    public void setPreClassNo(String preClassNo) {
        this.preClassNo = preClassNo;
    }

    @JsonProperty("numberOfClaims")
    public String getNumberOfClaims() {
        return numberOfClaims;
    }

    @JsonProperty("numberOfClaims")
    public void setNumberOfClaims(String numberOfClaims) {
        this.numberOfClaims = numberOfClaims;
    }

    @JsonProperty("independentClaims")
    public String getIndependentClaims() {
        return independentClaims;
    }

    @JsonProperty("independentClaims")
    public void setIndependentClaims(String independentClaims) {
        this.independentClaims = independentClaims;
    }

    @JsonProperty("numberOfPages")
    public String getNumberOfPages() {
        return numberOfPages;
    }

    @JsonProperty("numberOfPages")
    public void setNumberOfPages(String numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    @JsonProperty("proceduralComments")
    public String getProceduralComments() {
        return proceduralComments;
    }

    @JsonProperty("proceduralComments")
    public void setProceduralComments(String proceduralComments) {
        this.proceduralComments = proceduralComments;
    }

    @JsonProperty("numberOfRelatedDossier")
    public String getNumberOfRelatedDossier() {
        return numberOfRelatedDossier;
    }

    @JsonProperty("numberOfRelatedDossier")
    public void setNumberOfRelatedDossier(String numberOfRelatedDossier) {
        this.numberOfRelatedDossier = numberOfRelatedDossier;
    }

    @JsonProperty("stickers")
    public List<String> getStickers() {
        return stickers;
    }

    @JsonProperty("stickers")
    public void setStickers(List<String> stickers) {
        this.stickers = stickers;
    }

    @JsonProperty("userGeneratedTag")
    public List<String> getUserGeneratedTag() {
        return userGeneratedTag;
    }

    @JsonProperty("userGeneratedTag")
    public void setUserGeneratedTag(List<String> userGeneratedTag) {
        this.userGeneratedTag = userGeneratedTag;
    }

    @JsonProperty("targetMonth")
    public String getTargetMonth() {
        return targetMonth;
    }

    @JsonProperty("targetMonth")
    public void setTargetMonth(String targetMonth) {
        this.targetMonth = targetMonth;
    }

    @JsonProperty("priorityNumber")
    public String getPriorityNumber() {
        return priorityNumber;
    }

    @JsonProperty("priorityNumber")
    public void setPriorityNumber(String priorityNumber) {
        this.priorityNumber = priorityNumber;
    }

    @JsonProperty("publicationDate")
    public String getPublicationDate() {
        return publicationDate;
    }

    @JsonProperty("publicationDate")
    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    @JsonProperty("chairman")
    public String getChairman() {
        return chairman;
    }

    @JsonProperty("chairman")
    public void setChairman(String chairman) {
        this.chairman = chairman;
    }

    @JsonProperty("firstExaminer")
    public String getFirstExaminer() {
        return firstExaminer;
    }

    @JsonProperty("firstExaminer")
    public void setFirstExaminer(String firstExaminer) {
        this.firstExaminer = firstExaminer;
    }

    @JsonProperty("secondExaminer")
    public String getSecondExaminer() {
        return secondExaminer;
    }

    @JsonProperty("secondExaminer")
    public void setSecondExaminer(String secondExaminer) {
        this.secondExaminer = secondExaminer;
    }

    @JsonProperty("legalMember")
    public String getLegalMember() {
        return legalMember;
    }

    @JsonProperty("legalMember")
    public void setLegalMember(String legalMember) {
        this.legalMember = legalMember;
    }

    @JsonProperty("limitDateType")
    public String getLimitDateType() {
        return limitDateType;
    }

    @JsonProperty("limitDateType")
    public void setLimitDateType(String limitDateType) {
        this.limitDateType = limitDateType;
    }

    @JsonProperty("limitDate")
    public String getLimitDate() {
        return limitDate;
    }

    @JsonProperty("limitDate")
    public void setLimitDate(String limitDate) {
        this.limitDate = limitDate;
    }

    @JsonProperty("accountID")
    public String getAccountID() {
        return accountID;
    }

    @JsonProperty("accountID")
    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    @JsonProperty("directorate")
    public String getDirectorate() {
        return directorate;
    }

    @JsonProperty("directorate")
    public void setDirectorate(String directorate) {
        this.directorate = directorate;
    }

    @JsonProperty("receiveDate")
    public String getReceiveDate() {
        return receiveDate;
    }

    @JsonProperty("receiveDate")
    public void setReceiveDate(String receiveDate) {
        this.receiveDate = receiveDate;
    }

    @JsonProperty("urgency")
    public String getUrgency() {
        return urgency;
    }

    @JsonProperty("urgency")
    public void setUrgency(String urgency) {
        this.urgency = urgency;
    }

    @JsonProperty("taskDescription")
    public String getTaskDescription() {
        return taskDescription;
    }

    @JsonProperty("taskDescription")
    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    @JsonProperty("lastActionDate")
    public String getLastActionDate() {
        return lastActionDate;
    }

    @JsonProperty("lastActionDate")
    public void setLastActionDate(String lastActionDate) {
        this.lastActionDate = lastActionDate;
    }

    @JsonProperty("lastActionActor")
    public String getLastActionActor() {
        return lastActionActor;
    }

    @JsonProperty("lastActionActor")
    public void setLastActionActor(String lastActionActor) {
        this.lastActionActor = lastActionActor;
    }

    @JsonProperty("lastActionResult")
    public String getLastActionResult() {
        return lastActionResult;
    }

    @JsonProperty("lastActionResult")
    public void setLastActionResult(String lastActionResult) {
        this.lastActionResult = lastActionResult;
    }

    @JsonProperty("lastActionComment")
    public String getLastActionComment() {
        return lastActionComment;
    }

    @JsonProperty("lastActionComment")
    public void setLastActionComment(String lastActionComment) {
        this.lastActionComment = lastActionComment;
    }

    @JsonProperty("allocatedRole")
    public String getAllocatedRole() {
        return allocatedRole;
    }

    @JsonProperty("allocatedRole")
    public void setAllocatedRole(String allocatedRole) {
        this.allocatedRole = allocatedRole;
    }

    @JsonProperty("allocatedUserId")
    public String getAllocatedUserId() {
        return allocatedUserId;
    }

    @JsonProperty("allocatedUserId")
    public void setAllocatedUserId(String allocatedUserId) {
        this.allocatedUserId = allocatedUserId;
    }

    @JsonProperty("communicationType")
    public String getCommunicationType() {
        return communicationType;
    }

    @JsonProperty("communicationType")
    public void setCommunicationType(String communicationType) {
        this.communicationType = communicationType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("readIndicator", readIndicator).append("opinionIndicator", opinionIndicator).append("feesIndicator", feesIndicator).append("taskProvenance", taskProvenance).append("taskName", taskName).append("workFlowStatus", workFlowStatus).append("phaseIndicator", phaseIndicator).append("dossierType", dossierType).append("dossierNumber", dossierNumber).append("proceduralLanguage", proceduralLanguage).append("dossierTitle", dossierTitle).append("applicantName", applicantName).append("preClassNo", preClassNo).append("numberOfClaims", numberOfClaims).append("independentClaims", independentClaims).append("numberOfPages", numberOfPages).append("proceduralComments", proceduralComments).append("numberOfRelatedDossier", numberOfRelatedDossier).append("stickers", stickers).append("userGeneratedTag", userGeneratedTag).append("targetMonth", targetMonth).append("priorityNumber", priorityNumber).append("publicationDate", publicationDate).append("chairman", chairman).append("firstExaminer", firstExaminer).append("secondExaminer", secondExaminer).append("legalMember", legalMember).append("limitDateType", limitDateType).append("limitDate", limitDate).append("accountID", accountID).append("directorate", directorate).append("receiveDate", receiveDate).append("urgency", urgency).append("taskDescription", taskDescription).append("lastActionDate", lastActionDate).append("lastActionActor", lastActionActor).append("lastActionResult", lastActionResult).append("lastActionComment", lastActionComment).append("allocatedRole", allocatedRole).append("allocatedUserId", allocatedUserId).append("communicationType", communicationType).toString();
    }

}
