package com.edyt.mock.controllers.dsl.npl;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/kime-npm")
public class NPLController {

  @RequestMapping("/tei/npls/{techId}")
  public ResponseEntity<Resource> getNplTeiBody(@PathVariable("techId") String techId) {
    if (techId.hashCode() % 2 == 0) {
      return new ResponseEntity<>(new ClassPathResource("dsl/npl/fakePriorArt.xml"), HttpStatus.OK);
    } else {
      return new ResponseEntity<>(new ClassPathResource("dsl/npl/fakePriorArt2.xml"), HttpStatus.OK);
    }
  }
}
