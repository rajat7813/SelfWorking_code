package com.edyt.mock.controllers.bi;

import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Collections;
import java.util.Scanner;
import java.io.IOException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.edyt.mock.util.ResponseUtil;

@RestController
public class SettingsController {
    private String fontSize = "10";
    private String warningMessage = "true";

    @RequestMapping(path = "/restServices/ui/AccountManagement/ListUserDefaultSettings", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getDefaultSettings() {
          return ResponseUtil.serveJsonResource("bi/settings/defaultSettings.json");
    }

    @RequestMapping(path = "/restServices/ui/AccountManagement/ListUserPreferredSettings", method = RequestMethod.GET)
    public ResponseEntity<String> getPreferredSettings(@RequestParam(name = "UserID") String userId) throws IOException {
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.put(HttpHeaders.CONTENT_TYPE, Collections.singletonList(MediaType.APPLICATION_JSON_VALUE));
        ClassPathResource resource = new ClassPathResource("bi/settings/preferredSettings.json");
        Scanner s = new Scanner(resource.getInputStream()).useDelimiter("\\A");
        String result = s.hasNext() ? s.next() : "";
        if (userId == null || userId.length() == 0) {
            userId = "string";
        }
        return new ResponseEntity<>(String.format(result, userId, this.fontSize, this.warningMessage), headers, HttpStatus.OK);
    }


    @RequestMapping(path = "/restServices/ui/AccountManagement/ModifyUserPreferredSetting", method = RequestMethod.POST,
          consumes = "application/json")
    public ResponseEntity<String> setPreferredSetting(@RequestBody String body) {
        DocumentContext payload = JsonPath.parse(body);
        String setting = payload.read("$.objects.Request_data.KindType");
        String value = payload.read("$.objects.Request_data.ValueText");
        if ("FontSize".equals(setting)) {
            this.fontSize = value;
        } else if ("WarningMessage".equals(setting)) {
            this.warningMessage = value;
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @RequestMapping(path = "/restServices/ui/AccountManagement/ResetAllUserPreferredSettings", method = RequestMethod.POST,
          consumes = "application/json")
    public ResponseEntity<String> resetPreferredSetting() {
        this.fontSize = "18";
        this.warningMessage = "true";
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
