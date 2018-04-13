package com.sopra.pojo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

public class FinalA {
	
	List<ClassB> row;
	@JsonInclude(Include.NON_NULL)
	List<TrackingRemarks> trackRem;
	
	
	
	List<TrackingRemarksApi> trackRemapi;
	List<Tracker_9_Feb> track_mnth;

	public List<Tracker_9_Feb> getTrack_mnth() {
		return track_mnth;
	}

	public void setTrack_mnth(List<Tracker_9_Feb> track_mnth) {
		this.track_mnth = track_mnth;
	}

	public List<TrackingRemarksApi> getTrackRemapi() {
		return trackRemapi;
	}

	public void setTrackRemapi(List<TrackingRemarksApi> trackRemapi) {
		this.trackRemapi = trackRemapi;
	}

	public List<TrackingRemarks> getTrackRem() {
		return trackRem;
	}

	public void setTrackRem(List<TrackingRemarks> trackRem) {
		this.trackRem = trackRem;
	}

	public List<ClassB> getRow() {
		return row;
	}

	public void setRow(List<ClassB> row) {
		this.row = row;
	}

}
