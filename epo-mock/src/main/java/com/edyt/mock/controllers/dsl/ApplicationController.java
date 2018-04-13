package com.edyt.mock.controllers.dsl;

import com.edyt.mock.service.BiblioService;
import com.edyt.mock.util.ResponseUtil;
import lombok.SneakyThrows;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.time.Clock;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.APPLICATION_XML;
import static org.springframework.http.MediaType.IMAGE_PNG;

@RestController
public class ApplicationController {
    private static final MediaType APPLICATION_PDF = new MediaType("application", "pdf");
    private static final MediaType IMAGE_TIFF = new MediaType("image", "tiff");
    private static final ClassPathResource CINOL_RESOURCE = new ClassPathResource("static/cinol2.png");

    private Logger logger = Logger.getLogger(ApplicationController.class);

    private final static String ridPrefix = "RID";

    private String prepareJson(HttpServletRequest request, String classpathResource, String applicationRID, String applicationNumber) throws IOException {
        String serviceUrl = ResponseUtil.getServiceUrl(request);
        return readClasspathResource(classpathResource).
                replaceAll("\\{applicationRID\\}", applicationRID).
                replaceAll("\\{serviceUrl\\}", serviceUrl).
                replaceAll("\\{applicationNumber\\}", applicationNumber);
    }

    private String substringAfter(String body, String prefix){
        if (body.contains(prefix)){
            return body.substring(prefix.length());
        }else{
            return body;
        }
    }

    private String readClasspathResource(String classpathResource) throws IOException {
        ClassPathResource resource = new ClassPathResource(classpathResource);
        StringWriter stringWriter = new StringWriter();
        IOUtils.copy(resource.getInputStream(), stringWriter);
        return stringWriter.toString();
    }

    @RequestMapping(value = "api/lookup/application", produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> lookup(HttpServletRequest request, @RequestParam("applicationNumber") String applicationNumber) throws IOException {
        String response = prepareJson(request, "dsl/lookup.application.json", ridPrefix + applicationNumber, applicationNumber);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping(value = "api/application/{applicationRID}", produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> application(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID) throws IOException {
        String responseContent;
        if (applicationRID.startsWith(ridPrefix + "PUB")) {
            responseContent = "dsl/publication/application.json";
        } else {
            responseContent = "dsl/application.json";
        }

        String response = prepareJson(request, responseContent, applicationRID, substringAfter(applicationRID, ridPrefix));
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping(value = "api/pre-publication/{applicationRID}/{applicationNumber}", produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<String> document(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID,
                                                      @PathVariable("applicationNumber") String applicationNumber) throws IOException {
        int hash = applicationNumber.hashCode();
        String response;
        if (hash % 2 == 0) {
            response = prepareJson(request, "dsl/document.json", applicationRID, applicationNumber);
        } else {
            response = prepareJson(request, "dsl/document2.json", applicationRID, applicationNumber);
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @RequestMapping("api/tei/pre-publication/{applicationRID}/{applicationNumber}")
    public ResponseEntity<ClassPathResource> pdm(@PathVariable("applicationRID") String applicationRID,
                                                 @PathVariable("applicationNumber") String applicationNumber)  throws IOException {
        int hash = applicationNumber.hashCode();
        int distributionVal = Math.abs(hash) % 3;
        if ("EPA    13003967".equals(applicationNumber)) {
          return addHttpHeaders(new ClassPathResource("dsl/pdm-2.xml"), APPLICATION_XML);
        }
        if ("versions".equals(applicationNumber) || "NLA     2017472".equals(applicationNumber)) {
            return addHttpHeaders(new ClassPathResource("dsl/pdm-versions.xml"), APPLICATION_XML);
        }
        if ("utf".equals(applicationNumber)) {
            return addHttpHeaders(new ClassPathResource("dsl/pdm-utf.xml"), APPLICATION_XML);
        }
        if (distributionVal == 1) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else if (distributionVal == 2) {
            return addHttpHeaders(new ClassPathResource("dsl/pdm-2.xml"), APPLICATION_XML);
        } else {
            return addHttpHeaders(new ClassPathResource("dsl/pdm.xml"), APPLICATION_XML);
        }
    }

    //mocked pdm file has been modified so that facsimileId is always equal to the section name.
    @RequestMapping("api/application/{applicationRID}/{applicationNumber}/facsimile/{facsimileId}/{pageNumber}")
    public ResponseEntity<ClassPathResource> facsimile(@PathVariable("applicationRID") String applicationRID,
                                       @PathVariable("facsimileId") String /*this is always equal to section name in the mocked pdm*/ facsimileId,
                                       @PathVariable("applicationNumber") String applicationNumber,
                                       @PathVariable("pageNumber") int pageNumber,
                                       @RequestParam(value = "format", defaultValue=MediaType.IMAGE_PNG_VALUE) String format) {
        HttpHeaders responseHeaders = new HttpHeaders();
        String type;
        try {
            format = URLDecoder.decode(format, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            logger.error("Unsupported encoding", e);
            // use the default;
        }
        if ("image/tiff".equals(format)) {
            responseHeaders.setContentType(IMAGE_TIFF);
            type = "tiff";
        } else if ("image/png".equals(format)){
            responseHeaders.setContentType(IMAGE_PNG);
            type = "png";
        } else {
            responseHeaders.setContentType(APPLICATION_PDF);
            type = "pdf";

        }
        ClassPathResource resource;
        resource = new ClassPathResource("dsl/facsimile/" + type + "/" + facsimileId + "/" + pageNumber + "." + type);
        if (!resource.exists()) {
            resource = new ClassPathResource("dsl/facsimile/" + type + "/" + facsimileId + "/" + "/1." + type);
        }
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping("api/pre-publication/{applicationRID}/{applicationNumber}/facsimile/{facsimileId}/{pageNumber}")
    public ResponseEntity<ClassPathResource> prePublicationFacsimile(@PathVariable("applicationRID") String applicationRID,
                                                       @PathVariable("facsimileId") String applicationNumber,
                                                       @PathVariable("applicationNumber") String facsimileId,
                                                       @PathVariable("pageNumber") int pageNumber,
                                                       @RequestParam(value = "format", defaultValue="image/png") String format) {
        return facsimile(applicationRID, applicationNumber, facsimileId, pageNumber, format);
    }

    @RequestMapping("api/publication/{applicationRID}/facsimiles/{facsimileId}/{pageNumber}")
    public ResponseEntity<ClassPathResource> publicationFacsimile(@PathVariable("applicationRID") String applicationRID,
                                                       @PathVariable("facsimileId") String facsimileId,
                                                       @PathVariable("pageNumber") int pageNumber,
                                                       @RequestParam(value = "format", defaultValue="image/png") String format) {
        return facsimile(applicationRID, "description", "", pageNumber, format);
    }

    @RequestMapping("api/pre-publication/{applicationRID}/{applicationNumber}/facsimiles/{facsimileId}/{pageNumber}")
    public ResponseEntity<ClassPathResource> prePublicationFacsimiles(@PathVariable("applicationRID") String applicationRID,
                                                                      @PathVariable("facsimileId") String applicationNumber,
                                                                      @PathVariable("applicationNumber") String facsimileId,
                                                                      @PathVariable("pageNumber") int pageNumber,
                                                                      @RequestParam(value = "format", defaultValue = "image/png") String format) {
        return facsimile(applicationRID, "description", applicationNumber, pageNumber, format);
    }

    @RequestMapping(path = "api/tei/pre-publication/{applicationRID}/{applicationNumber}/biblio")
    public ResponseEntity<String> getPatentDetails(@PathVariable String applicationNumber) throws Exception{
        //for testing
        if ("throwError".equals(applicationNumber))
            throw new RuntimeException("You have asked for it!");
        if ("emptyPayload".equals(applicationNumber))
            return new ResponseEntity<>(readClasspathResource("dsl/biblio/empty.xml"), HttpStatus.OK);
        if ("incorrectPayload".equals(applicationNumber))
            return new ResponseEntity<>(readClasspathResource("dsl/biblio/trash.trash"), HttpStatus.OK);
        if ("USW  2014053961".equals(applicationNumber))
            return new ResponseEntity<>(readClasspathResource("dsl/biblio/biblioDrawing.xml"), HttpStatus.OK);
        if ("EPA    13184495".equals(applicationNumber)){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(new BiblioService(applicationNumber).updateBiblioXML(), HttpStatus.OK);
    }

    @SneakyThrows(IOException.class)
    private ResponseEntity<ClassPathResource> addHttpHeaders(ClassPathResource res, MediaType mediaType) {
        long halfAnHourFromNow = Instant.now(Clock.systemDefaultZone()).plus(30, ChronoUnit.MINUTES).toEpochMilli();

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.setContentType(mediaType);
        responseHeaders.setContentLength(res.contentLength());
        responseHeaders.setExpires(halfAnHourFromNow);
        responseHeaders.setCacheControl("public, max-age=" + halfAnHourFromNow);
        responseHeaders.setLastModified(res.lastModified());

        return new ResponseEntity<>(res, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "/api/text/{someId1}/emi/{someId2}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getPdmEmbeddedGraphics(){
        return getStaticCinol();
    }

    @RequestMapping(path = "/api/drawings/{someId1}/{someId2}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getAbstractFigures(){
        return getStaticCinol();
    }

    private ResponseEntity<ClassPathResource> getStaticCinol() {
        return addHttpHeaders(CINOL_RESOURCE, IMAGE_PNG);
    }

    @RequestMapping(path = "/api/publication/{applicationRID}", method = RequestMethod.GET)
    public ResponseEntity<String> getPublication(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID) throws IOException {
        final String json = prepareJson(request, "dsl/publication/publication.json", applicationRID, substringAfter(applicationRID, ridPrefix));
        return new ResponseEntity<>(json, HttpStatus.OK);
    }

    @RequestMapping(path = "/api/tei/publication/{applicationRID}", method = RequestMethod.GET)
    public ResponseEntity<Resource> getPublicationContent(HttpServletRequest request, @PathVariable("applicationRID") String applicationRID) throws IOException {

        return new ResponseEntity<>(new ClassPathResource("dsl/publication/publicationContent1.xml"), HttpStatus.OK);
    }

}
