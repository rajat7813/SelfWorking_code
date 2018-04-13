package com.edyt.mock.controllers.lal;

import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by przemekd on 22.11.16.
 */
@RestController
public class TocController {

    private List<String> notScannedDocuments = Arrays.asList("E121535100F5C4P1","E1115AF0A6BCDBP1");

    private Map<String, String> uploadedFilePaths = new HashMap<>();

    @RequestMapping(path = "/lal/tableofcontents/{applicationNumber}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getToc(@PathVariable String applicationNumber,
                                                    @RequestParam("includeBlobs") boolean includeBlobs,
                                                    @RequestParam(name = "omniaDocumentaIudex", defaultValue = "false") boolean showOmniaToc,
                                                    @RequestParam(name = "includeComments", defaultValue = "true") boolean comments) {
        ClassPathResource resource;
        //Used in e2e tests, should get full set of data
        String e2eDossierNumber = "EPA    16189610";

        if (!e2eDossierNumber.equals(applicationNumber.trim()) && applicationNumber.hashCode() %2 == 0) {
            resource = new ClassPathResource("lal/tocWithoutPamphlets.json");
        } else if (showOmniaToc) {
            resource = new ClassPathResource("lal/tocWithOmnia.json");
        } else if (includeBlobs) {
            resource = new ClassPathResource("lal/tocWithBlobs.json");
        } else {
            resource = new ClassPathResource("lal/toc.json");
        }

        return new ResponseEntity<>(resource, HttpStatus.OK);
    }

    @RequestMapping(path = "/lal/tableofcontents/image/{packageId}/{page}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getImage(@PathVariable("packageId") String packageId,
                                                      @RequestParam(required = false) String eye, @PathVariable String page) {

        if (notScannedDocuments.contains(packageId)){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        int pageNumber = (Integer.parseInt(page) % 2) + 1;
        ClassPathResource resource;
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();

        if ("true".equalsIgnoreCase(eye)) {
            resource = new ClassPathResource("lal/images/page" + pageNumber + ".png");
            responseHeaders.put("Content-Type", Collections.singletonList("image/png"));
        } else {
            resource = new ClassPathResource("lal/images/page" + pageNumber + ".tiff");
            responseHeaders.put("Content-Type", Collections.singletonList("image/tiff"));
        }

        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "/lal/tableofcontents/image/{applicationNumber}/{documentCode}/{contentType}",
            method = RequestMethod.POST)
    public ResponseEntity<String> uploadDocument(MultipartHttpServletRequest request,
                                                 @PathVariable String applicationNumber,
                                                 @PathVariable String documentCode,
                                                 @PathVariable String contentType,
                                                 @RequestParam(name = "annotation", required = false) String annotation) throws IOException {
        handleUploadedDocument(request.getFileMap().values(), applicationNumber, applicationNumber + documentCode + contentType + annotation);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(path = "/lal/tableofcontents/bin/{applicationNumber}/{documentCode}",
            method = RequestMethod.POST)
    public ResponseEntity<String> uploadBinary(MultipartHttpServletRequest request,
                                               @PathVariable String applicationNumber,
                                               @PathVariable String documentCode,
                                               @RequestParam(name = "annotation", required = false) String annotation) throws IOException {
        handleUploadedDocument(request.getFileMap().values(), applicationNumber, applicationNumber + documentCode + annotation);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(path = "/lal/getuploadedfile/{applicationNumber}", method = RequestMethod.GET)
    public ResponseEntity<UrlResource> getUploadedFileForIntegrationTests(@PathVariable String applicationNumber) throws Exception {
        String filePath = uploadedFilePaths.get(applicationNumber);
        if (filePath == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            MultiValueMap<String, String> responseHeaders = new HttpHeaders();
            // we assume that we will only return PDFs here
            responseHeaders.put("Content-Type", Collections.singletonList("application/pdf"));
            return new ResponseEntity<>(new UrlResource("file:///" + filePath), responseHeaders, HttpStatus.OK);
        }
    }

    @RequestMapping(path = "/lal/tableofcontents/image/{packageId}/{page}/{numberOfPages}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getPagesInPdf(@PathVariable String packageId,
                                                           @PathVariable Integer page,
                                                           @PathVariable Integer numberOfPages,
                                                           @RequestParam(required = false) Boolean printable,
                                                           @RequestParam(required = false) String title,
                                                           @RequestParam(required = false) String documentName) {

        if (notScannedDocuments.contains(packageId)){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put("Content-Type", Collections.singletonList("application/pdf"));

        ClassPathResource resource = new ClassPathResource("lal/pdf/kerberos.pdf");

        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    @RequestMapping(path = "/lal/tableofcontents/bin/{packageId}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getBinary(@PathVariable String packageId) {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        ClassPathResource resource;

        if ("E1214A5335191PNG".equalsIgnoreCase(packageId)) {
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("image/png"));
            resource = new ClassPathResource("lal/images/cinol.png");
        } else if ("E1214A5335191JPG".equalsIgnoreCase(packageId)) {
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("image/jpeg"));
            resource = new ClassPathResource("lal/images/cinol.jpg");
        } else if ("E1214A5335191ABL".equalsIgnoreCase(packageId)) {
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/pdf"));
            resource = new ClassPathResource("lal/pdf/ep.pdf");
        } else if ("E1214A4444191ABL".equalsIgnoreCase(packageId)) {
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/pdf"));
            resource = new ClassPathResource("lal/pdf/tracking-code.pdf");
        } else if (packageId.hashCode() % 3 != 0) {
            responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList("application/zip"));
            resource = new ClassPathResource("lal/zip/kerberos.zip");
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(resource, responseHeaders, HttpStatus.OK);
    }

    private void handleUploadedDocument(Collection<MultipartFile> files, String applicationNumber, String filename) throws IOException {
        String tmpLocation = System.getProperty("java.io.tmpdir", "/tmp");
        File tmpDir = new File(tmpLocation);
        for (MultipartFile multipartFile : files) {
            File file = new File(tmpDir, filename);
            uploadedFilePaths.put(applicationNumber, file.getAbsolutePath());
            IOUtils.copy(multipartFile.getInputStream(), new FileOutputStream(file));
        }
    }
}
