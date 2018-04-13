package com.edyt.mock.controllers.dsl;

import com.edyt.mock.domain.standoff.StandOff;
import com.edyt.mock.dto.Annotation;
import com.edyt.mock.dto.AnnotationsEmbedded;
import com.edyt.mock.dto.AnnotationsListResponse;
import com.edyt.mock.dto.Href;
import com.edyt.mock.dto.Links;
import com.edyt.mock.service.AnnotationService;
import com.edyt.mock.util.ResponseUtil;
import com.edyt.mock.xmlmapper.StandOffXmlMapper;
import lombok.SneakyThrows;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
public class AnnotationController {
    private List<String> allowedBodyContentTypes = new ArrayList<>(Arrays.asList("application/xml", "text/plain"));
    private List<String> allowedAttachmentContentTypes = new ArrayList<>(Arrays.asList("image/tiff", "image/png", "application/pdf"));
    private String storageLocation = Paths.get(System.getProperty("java.io.tmpdir", "/tmp"), "annotation-attachments-" + UUID.randomUUID()).toString();

    @Autowired
    private AnnotationService annotationService;

    @RequestMapping(path = "/api/pre-publication/{applicationRID}/{appNum}/annotations", method = RequestMethod.GET)
    public ResponseEntity<AnnotationsListResponse> listAnnotations(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID,
                                                   @RequestParam(required = false, name = "type") String type
    ) {

        return listAnnotationsInternal(request, applicationRID, type, false);
    }

    private ResponseEntity<AnnotationsListResponse> listAnnotationsInternal(HttpServletRequest request, String applicationRID, String type, boolean published) {
        String serviceLocation = ResponseUtil.getServiceUrl(request);

        List<Annotation> annotations = new ArrayList<>();
        Map<String, String> filters = new HashMap<>();
        if (null != type) {
            filters.put("type", type);
        }
        filters.put("published", String.valueOf(published));
        List<StandOff> annotationsList = annotationService.getAnnotationsList(applicationRID, filters);
        for (StandOff annotation : annotationsList) {
            Links links = new Links(
                    new Href(serviceLocation + "/tei/annotation/" + annotation.getId()),
                    new Href(serviceLocation + "/annotation/" + annotation.getId())
            );
            annotations.add(new Annotation(links, annotation.getId()));
        }

        if ("annotation".equals(type) && "RIDFRA     1670195".equals(applicationRID)) {
            //inject ansera annotation here

            String anseraId = "ansera_amazing_underline";
            Links links = new Links(
              new Href(serviceLocation + "/tei/annotation/" + anseraId),
              new Href(serviceLocation + "/annotation/" + anseraId)
            );
            annotations.add(new Annotation(links, anseraId));
        }

        if (annotations.size() == 0) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        AnnotationsListResponse response = new AnnotationsListResponse();
        response.setRecords(annotations.size());
        response.setEmbedded(new AnnotationsEmbedded(annotations));
        response.getLinks().setAnnotationsContent(new Href(serviceLocation + "/tei/annotation/{id}"));
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping(path = "/api/tei/annotation/ansera_amazing_underline", produces = "application/xml", method = RequestMethod.GET)
    public ResponseEntity<Resource> getAnseraAnnotation() {

        return new ResponseEntity<>(new ClassPathResource("dsl/annotations/anseraUnderline.xml"), HttpStatus.OK);
    }

    @RequestMapping(path = "/api/publication/{applicationRID}/annotations", method = RequestMethod.GET)
    public ResponseEntity<AnnotationsListResponse> listPublicationAnnotations(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID,
                                                   @RequestParam(required = false, name = "type") String type ) {
        return listAnnotationsInternal(request, applicationRID, type, true);
    }


    private String generateSuccessResponse(String okValue) {
        String responseFormat = "{\"ok\":\"%s\"}";
        return String.format(responseFormat, okValue);
    }

    private String generateFailureResponse(String description, int status) {
        String responseFormat = "{\"error\": {\n" +
                "   \"ok\": \"false\",\n" +
                "   \"message\": \"%s\",\n" +
                "   \"status\": %d\n" +
                "}}";
        return String.format(responseFormat, description, status);
    }

    @RequestMapping(path = "/api/pre-publication/{applicationRID}/{appNum}/annotations", method = RequestMethod.POST,
            consumes = {"application/xml", "text/xml"},
            produces = "application/json"
    )
    public ResponseEntity<String> saveAnnotationForPrepublication(@PathVariable("applicationRID") String applicationRID, @RequestBody StandOff annotation) {
        StandOff standOff = annotationService.saveAnnotation(applicationRID, annotation);

        return new ResponseEntity<>(generateSuccessResponse(standOff.getId()), HttpStatus.OK);
    }

    @RequestMapping(path = "/api/publication/{applicationRID}/annotations", method = RequestMethod.POST,
      consumes = {"application/xml", "text/xml"},
      produces = "application/json"
    )
    public ResponseEntity<String> saveAnnotationForPublication(@PathVariable("applicationRID") String applicationRID, @RequestBody StandOff annotation) {
        StandOff standOff = annotationService.saveAnnotation(applicationRID, annotation, true);

        return new ResponseEntity<>(generateSuccessResponse(standOff.getId()), HttpStatus.OK);
    }

    private StandOff deserializeAnnotationBody(Collection<MultipartFile> files) throws IOException {
        StandOffXmlMapper xmlMapper = new StandOffXmlMapper();
        StandOff standOff = null;
        for (MultipartFile file : files) {
            String contentType = getFileContent(file);
            if ("body.xml".equals(file.getOriginalFilename()) && allowedBodyContentTypes.contains(contentType)) {
                standOff = xmlMapper.readValue(file.getInputStream(), StandOff.class);
            }
        }

        return standOff;
    }

    private String getFileContent(MultipartFile file) {
        String contentType = file.getContentType();
        if (contentType.contains(";")) {
            //strip character encoding info
            contentType = contentType.substring(0, contentType.indexOf(";"));
        }
        return contentType;
    }

    @RequestMapping(path = "/api/pre-publication/{applicationRID}/{appNum}/annotations", method = RequestMethod.POST,
            produces = "application/json"
    )
    public ResponseEntity<String> saveAnnotationWithImagesForPrepublished(@PathVariable("applicationRID") String applicationRID, String annotationId, MultipartHttpServletRequest request) throws IOException {

        return saveAnnotationWithImageInternal(applicationRID, annotationId, request, false);
    }

    @RequestMapping(path = "/api/publication/{applicationRID}/annotations", method = RequestMethod.POST,
      produces = "application/json"
    )
    public ResponseEntity<String> saveAnnotationWithImagesForPublished(@PathVariable("applicationRID") String applicationRID, String annotationId, MultipartHttpServletRequest request) throws IOException {

        return saveAnnotationWithImageInternal(applicationRID, annotationId, request, true);
    }

    private ResponseEntity<String> saveAnnotationWithImageInternal(@PathVariable("applicationRID") String applicationRID, String annotationId, MultipartHttpServletRequest request, boolean published) throws IOException {
        StandOff standOff;

        Collection<MultipartFile> files = request.getFileMap().values();

        standOff = deserializeAnnotationBody(files);

        if (standOff == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        standOff.setId(annotationId);
        standOff = annotationService.saveAnnotation(applicationRID, standOff);

        List<File> uploadedFiles = new ArrayList<>();

        if (handleAnnotationAttachments(standOff, uploadedFiles, files))
            return new ResponseEntity<>(generateFailureResponse(
              "Unsupported media type (valid types are: [image/tiff, image/png, application/pdf])",
              400
            ), HttpStatus.BAD_REQUEST);

        annotationService.attachFilesToAnnotation(applicationRID, standOff.getId(), uploadedFiles);
        return new ResponseEntity<>(generateSuccessResponse(standOff.getId()), HttpStatus.OK);
    }

    private boolean handleAnnotationAttachments(StandOff standOff, List<File> uploadedFiles, Collection<MultipartFile> files) throws IOException {
        for (MultipartFile file : files) {
            String contentType = getFileContent(file);
            if (allowedAttachmentContentTypes.contains(contentType)) {
                File location = new File(storageLocation + "/" + standOff.getId());
                location.mkdirs();
                File uploadedFile = new File(location, file.getOriginalFilename());
                uploadedFiles.add(uploadedFile);
                IOUtils.copy(file.getInputStream(), new FileOutputStream(uploadedFile));
            } else if (!allowedBodyContentTypes.contains(contentType)) {
                //attachment is not an xml, png, tiff or pdf
                return true;
            }
        }
        return false;
    }

    @RequestMapping(path = "/api/tei/annotation/{annotationId}", produces = "application/xml", method = RequestMethod.GET)
    public ResponseEntity<StandOff> getAnnotation(@PathVariable("annotationId") String annotationId) {
        StandOff annotationById = annotationService.getAnnotationById(annotationId);
        if (null == annotationById)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        else
            return new ResponseEntity<>(annotationById, HttpStatus.OK);
    }

    @RequestMapping(path = "/api/tei/annotation/{annotationId}", method = RequestMethod.PUT,
            produces = "application/json"
    )
    public ResponseEntity<String> updateAnnotationWithImages(@PathVariable("annotationId") String annotationId, MultipartHttpServletRequest request) throws IOException {
        String applicationId = annotationService.getApplicationIdByAnnotationId(annotationId);
        return saveAnnotationWithImagesForPrepublished(applicationId, annotationId, request);
    }

    @RequestMapping(path = "/api/tei/annotation/{annotationId}", method = RequestMethod.PUT,
            consumes = {"application/xml", "text/xml"},
            produces = "application/json"
    )
    public ResponseEntity<String> updateAnnotation(@PathVariable("annotationId") String annotationId,
                                                   @RequestBody StandOff annotation) {
        annotation.setId(annotationId);
        String applicationId = annotationService.getApplicationIdByAnnotationId(annotationId);
        annotationService.saveAnnotation(applicationId, annotation);

        return new ResponseEntity<>(generateSuccessResponse("true"), HttpStatus.OK);
    }

    @RequestMapping(path = "/api/annotation/{annotationId}/attachment/{fileName:.+}", method = RequestMethod.GET)
    @SneakyThrows(IOException.class)
    public ResponseEntity<InputStreamResource> getAnnotationAttachment(@PathVariable("annotationId") String annotationId,
                                                                       @PathVariable("fileName") String fileName) {
        StandOff annotation = annotationService.getAnnotationById(annotationId);
        if (null == annotation) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        File attachmentFile = new File(storageLocation + "/" + annotationId + "/" + fileName);
        if (attachmentFile.exists()) {
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_TYPE, Files.probeContentType(attachmentFile.toPath()));
            return new ResponseEntity<>(new InputStreamResource(new FileInputStream(attachmentFile)), headers, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(path = "/api/annotation/{annotationId}/attachment/{fileName:.+}", method = RequestMethod.PUT)
    public ResponseEntity<Void> updateAnnotationAttachment(@RequestBody byte[] imageData,
                                                           @PathVariable("annotationId") String annotationId,
                                                           @PathVariable("fileName") String fileName
    ) throws IOException {
        File attachmentFile = new File(storageLocation + "/" + annotationId + "/" + fileName);
        FileOutputStream outputStream = new FileOutputStream(attachmentFile, false);
        IOUtils.copyLarge(new ByteArrayInputStream(imageData), outputStream);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(path = "/api/tei/annotation/{annotationId}", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteAnnotation(@PathVariable("annotationId") String annotationId) {
        annotationService.deleteAnnotation(annotationId);
        FileUtils.deleteQuietly(new File(storageLocation + "/" + annotationId + "/"));
        return new ResponseEntity<>("Annotation deleted", HttpStatus.OK);
    }

    @RequestMapping(path = "/api/tei/annotation/ALL", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteAnnotations() {
        annotationService.deleteAllAnnotations();
        FileUtils.deleteQuietly(new File(storageLocation));
        return new ResponseEntity<>("Annotations deleted", HttpStatus.OK);
    }

}
