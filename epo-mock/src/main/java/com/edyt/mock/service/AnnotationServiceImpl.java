package com.edyt.mock.service;

import com.edyt.mock.domain.facsimile.Facsimile;
import com.edyt.mock.domain.facsimile.Graphic;
import com.edyt.mock.domain.standoff.StandOff;
import com.edyt.mock.domain.tei.Biblio;
import com.edyt.mock.domain.tei.Creation;
import com.edyt.mock.domain.tei.Date;
import com.edyt.mock.domain.tei.FileDesc;
import com.edyt.mock.domain.tei.Idno;
import com.edyt.mock.domain.tei.ProfileDesc;
import com.edyt.mock.domain.tei.TeiHeader;
import com.edyt.mock.domain.tei.TitleStmt;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Created by przemekd on 03.03.16.
 */
@Service
public class AnnotationServiceImpl implements AnnotationService {

    Map<String, List<StandOff>> storage = new HashMap<>();
    Map<String, Boolean> publishedMap = new HashMap<>();

    private static String shortDatePattern = "yyyy-MM-dd'T'HH:mm:ssZZ";
    private static DateTimeFormatter dateFormatter =
            DateTimeFormat.forPattern(shortDatePattern);

    @Override
    public List<StandOff> getAnnotationsList(String applicationId) {
        List<StandOff> list = storage.get(applicationId);
        return null == list ? new ArrayList<>() : list;
    }

    @Override
    public List<StandOff> getAnnotationsList(String applicationId, Map<String, String> filters) {
        List<StandOff> annotationsList = getAnnotationsList(applicationId);
        //for now mock supports only filtering by type
        if (!filters.isEmpty()) {

            String type = filters.get("type");
            String published = filters.get("published");
            boolean publishedFlag = Boolean.valueOf(published);

            return annotationsList.stream()
              .filter(standOff -> type == null || standOff.getStandOff().getType().equals(type))
              .filter(standOff -> publishedFlag == publishedMap.get(standOff.getId())).collect(Collectors.toList());
        } else {
            return annotationsList;
        }
    }

    @Override
    public StandOff getAnnotationById(String annotationId) {
        for (Map.Entry<String, List<StandOff>> entry : storage.entrySet()) {
            for (StandOff standOff : entry.getValue()) {
                if (annotationId.equals(standOff.getId()))
                    return standOff;
            }
        }
        return null;

    }

    @Override
    public void deleteAllAnnotations() {
        storage.clear();
    }

    @Override
    public void deleteAnnotation(String annotationId) {
        for (Map.Entry<String, List<StandOff>> entry : storage.entrySet()) {
            Iterator<StandOff> iterator = entry.getValue().iterator();
            if (removeStandOffFromList(annotationId, iterator))
                break;
        }
    }

    private void deleteAnnotation(String applicationId, String annotationId){
        List<StandOff> annotations = storage.get(applicationId);
        Iterator<StandOff> iterator = annotations.iterator();
        removeStandOffFromList(annotationId, iterator);
    }

    private boolean removeStandOffFromList(String annotationId, Iterator<StandOff> iterator) {
        while (iterator.hasNext()){
            StandOff standOff= iterator.next();
            if (annotationId.equals(standOff.getId())) {
                iterator.remove();
                return true;
            }
        }
        return false;
    }

    @Override
    public StandOff saveAnnotation(String applicationId, StandOff standOff) {
        return saveAnnotation(applicationId, standOff, false);
    }

    @Override
    public StandOff saveAnnotation(String applicationId, StandOff standOff, boolean published) {
        List<StandOff> annotations = storage.get(applicationId);
        if (annotations == null){
            annotations = new ArrayList<>();
            storage.put(applicationId, annotations);
        }
        if (standOff.getId() == null || standOff.getId().isEmpty()) {
            UUID uuid = UUID.randomUUID();
            standOff.setId(uuid.toString());
            if (standOff.getStandOff().getTeiHeader().getProfileDesc() == null){
                standOff.getStandOff().getTeiHeader().setProfileDesc(new ProfileDesc());
            }
            final DateTime currentDateTime = DateTime.now();
            standOff.getStandOff().getTeiHeader().getProfileDesc().setCreation(new Creation(new Date(dateFormatter.print(currentDateTime), "" + currentDateTime.getMillis()/1000L)));
            standOff.getStandOff().getTeiHeader().getFileDesc().getTitleStmt().setBiblio(new Biblio("annotation", new Idno("annotationID", uuid.toString())));
            annotations.add(standOff);
            publishedMap.put(uuid.toString(), published);

        }else{
            StandOff oldAnnotation = getAnnotationById(standOff.getId());

            if (null == standOff.getStandOff().getTeiHeader()){
                standOff.getStandOff().setTeiHeader(new TeiHeader());
            }
            if (null == standOff.getStandOff().getTeiHeader().getProfileDesc()){
                standOff.getStandOff().getTeiHeader().setProfileDesc(new ProfileDesc());
            }
            if (null == standOff.getStandOff().getTeiHeader().getFileDesc()){
                standOff.getStandOff().getTeiHeader().setFileDesc(new FileDesc());
            }
            if (null == standOff.getStandOff().getTeiHeader().getFileDesc().getTitleStmt()){
                standOff.getStandOff().getTeiHeader().getFileDesc().setTitleStmt(new TitleStmt());
            }
            //copy metadata from old annotation
            standOff.getStandOff().getTeiHeader().getProfileDesc().setCreation(oldAnnotation.getStandOff().getTeiHeader().getProfileDesc().getCreation());
            standOff.getStandOff().getTeiHeader().getFileDesc().getTitleStmt().setBiblio(oldAnnotation.getStandOff().getTeiHeader().getFileDesc().getTitleStmt().getBiblio());

            deleteAnnotation(applicationId, standOff.getId());
            annotations.add(standOff);
        }

        return standOff;
    }

    @Override
    public String getApplicationIdByAnnotationId(String annotationId){
        for (Map.Entry<String, List<StandOff>> entry : storage.entrySet()) {
            for (StandOff standOff : entry.getValue()) {
                if (annotationId.equals(standOff.getId()))
                    return entry.getKey();
            }
        }
        return null;
    }

    @Override
    public StandOff attachFilesToAnnotation(String applicationId, String annotationId, Collection<File> files) {
        List<StandOff> standOffs = storage.get(applicationId);
        if (null == standOffs)
            throw new IllegalArgumentException("No annotations for give application id were found");
        StandOff standOffToUpdate = null;

        for (StandOff standOff : standOffs) {
            if (annotationId.equals(standOff.getId())){
                standOffToUpdate = standOff;
                if (standOff.getStandOff() != null) {
                    //get the nested standoff
                    standOffToUpdate = standOff.getStandOff();
                }
                break;
            }
        }

        if (null == standOffToUpdate) {
            return null;
        }

        if (null == standOffToUpdate.getFacsimile()) {
            throw new IllegalArgumentException("Facsimiles list cannot be empty when adding an attachment");
        }

        //kime-api expects a list of facsimiles with filenames
        //after saving in dsl filename is going to be changed to an URL
        for (Facsimile facsimile : standOffToUpdate.getFacsimile()) {
            Graphic graphic = facsimile.getSurface().get(0).getGraphic();
            for (File file : files) {
                if (file.getName().equals(graphic.getUrl())){
                    graphic.setUrl("/api/annotation/" + annotationId + "/attachment/" + file.getName());
                }
            }
        }

        return null;
    }
}
