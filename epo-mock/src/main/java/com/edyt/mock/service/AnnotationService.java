package com.edyt.mock.service;

import com.edyt.mock.domain.standoff.StandOff;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * Created by przemekd on 03.03.16.
 */
public interface AnnotationService {

    List<StandOff> getAnnotationsList(String applicationId);
    List<StandOff> getAnnotationsList(String applicationId, Map<String,String> filters);
    StandOff getAnnotationById(String annotationId);
    void deleteAllAnnotations();
    void deleteAnnotation(String annotationId);
    StandOff saveAnnotation(String applicationId, StandOff standOff);
    StandOff saveAnnotation(String applicationId, StandOff standOff, boolean published);
    String getApplicationIdByAnnotationId(String annotationId);
    StandOff attachFilesToAnnotation(String applicationId, String annotationId, Collection<File> files);

}
