package com.edyt.mock.util;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;

public class ResponseUtil {

    public static ResponseEntity<ClassPathResource> serveJsonResource(String fileName) {
        return serveJsonResource(fileName, HttpStatus.OK);
    }

    public static ResponseEntity<ClassPathResource> serveJsonResource(String fileName, HttpStatus status) {
        ClassPathResource resource = new ClassPathResource(fileName);
        return new ResponseEntity<>(resource, getResponseHeaders(), status);
    }

    private static MultiValueMap<String, String> getResponseHeaders() {
        MultiValueMap<String, String> responseHeaders = new HttpHeaders();
        responseHeaders.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        return responseHeaders;
    }

    public static ResponseEntity<String> serveStringValue(String value) {
        return new ResponseEntity<>(value, getResponseHeaders(), HttpStatus.OK);
    }

    public static String getServiceUrl(HttpServletRequest request){
        String scheme = request.getScheme();
        String hostName = request.getServerName();
        String applicationContext = request.getContextPath();
        String port = "";
        if (request.getServerPort() != 80 && request.getServerPort() != 443){
            port = ":" + request.getServerPort();
        }
        String suffix = applicationContext.equals("/") ? "api" : "/api";

        return scheme + "://" + hostName + port + applicationContext + suffix;
    }
}
