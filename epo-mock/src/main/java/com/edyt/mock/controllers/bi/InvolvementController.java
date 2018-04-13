package com.edyt.mock.controllers.bi;

import com.edyt.mock.util.ResponseUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class InvolvementController {

    @RequestMapping(path = "/restServices/dossierinvolvement/{lalTaskId}/{proposed}", method = RequestMethod.GET)
    public ResponseEntity<ClassPathResource> getDossierInvolvement(@PathVariable String lalTaskId, @PathVariable String proposed) {
        return ResponseUtil.serveJsonResource("bi/dossierInvolvement.json");
    }
}
