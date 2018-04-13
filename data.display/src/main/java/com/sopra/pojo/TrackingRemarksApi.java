package com.sopra.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class TrackingRemarksApi {
	
	@JsonInclude(Include.NON_NULL)
	String s_No;

	public void setS_No(String s_No) {
		this.s_No = s_No;
	}
	@JsonInclude(Include.NON_NULL)
	String epic_Name;
	@JsonInclude(Include.NON_NULL)
	String user_Story_Title;
	@JsonInclude(Include.NON_NULL)
	String remarks_Received_On;

	public String getS_No() {
		return s_No;
	}

	public void setRemarks_Received_On(String remarks_Received_On) {
		this.remarks_Received_On = remarks_Received_On;
	}
	
	@JsonInclude(Include.NON_NULL)
	String tracking_Remarks;
	@JsonInclude(Include.NON_NULL)
	String impact_Area;
	@JsonInclude(Include.NON_NULL)
	String impact_in_man_days;

	public String getRemarks_Received_On() {
		return remarks_Received_On;
	}

	public void setImpact_in_man_days(String impact_in_man_days) {
		this.impact_in_man_days = impact_in_man_days;
	}
	
	@JsonInclude(Include.NON_NULL)
	String key_Reason_for_display;
	@JsonInclude(Include.NON_NULL)
	String key_Reason_for_display_on_date;

	public String getKey_Reason_for_display_on_date() {
		return key_Reason_for_display_on_date;
	}

	public void setKey_Reason_for_display_on_date(String key_Reason_for_display_on_date) {
		this.key_Reason_for_display_on_date = key_Reason_for_display_on_date;
	}

	public String getEpic_Name() {
		return epic_Name;
	}

	public void setEpic_Name(String epic_Name) {
		this.epic_Name = epic_Name;
	}

	public String getUser_Story_Title() {
		return user_Story_Title;
	}

	public void setUser_Story_Title(String user_Story_Title) {
		this.user_Story_Title = user_Story_Title;
	}

	public String getTracking_Remarks() {
		return tracking_Remarks;
	}

	public void setTracking_Remarks(String tracking_Remarks) {
		this.tracking_Remarks = tracking_Remarks;
	}

	public String getImpact_Area() {
		return impact_Area;
	}

	public void setImpact_Area(String impact_Area) {
		this.impact_Area = impact_Area;
	}

	public String getKey_Reason_for_display() {
		return key_Reason_for_display;
	}

	public void setKey_Reason_for_display(String key_Reason_for_display) {
		this.key_Reason_for_display = key_Reason_for_display;
	}
}
