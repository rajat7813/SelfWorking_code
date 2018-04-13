package com.edyt.mock.controllers.bi;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.edyt.mock.domain.transactions.AllocationPayload;
import com.edyt.mock.domain.transactions.AllocationRequest;
import com.edyt.mock.service.CommentService;
import com.edyt.mock.util.ResponseUtil;

/**
 * Created by piotrekw on 23/12/16.
 */
@RestController
public class AllocationController {
    private String examiner1Suggestion = "EDOEX10";
    private String examiner2Suggestion = "AP51110";
    private String chairSuggestion = "JS23053";

    @Autowired
    private CommentService commentService;

    @RequestMapping(path = "/restServices/ui/BPRSearch/Preallocate/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> preallocate(@RequestBody AllocationPayload payload) throws IOException {
        return new ResponseEntity<>("", HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/Undopreallocation/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> undoPreallocate(@RequestBody AllocationPayload payload) throws IOException {
        return new ResponseEntity<>("", HttpStatus.OK);
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/assignexaminersandchairman/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> assignExaminersAndChairman(@RequestBody AllocationPayload payload) throws IOException {
        return handleAllocation(payload);
    }

    @RequestMapping(path = "/restServices/ui/BPRSearch/reallocation/{caseId}", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> reallocate(@RequestBody AllocationPayload payload) throws IOException {
        return handleAllocation(payload);
    }

    private ResponseEntity<String> handleAllocation(@RequestBody AllocationPayload payload) throws IOException {
        AllocationRequest allocation;
        if (payload.getContent() == null) {
            allocation = new AllocationRequest("", "", "", true, true, true, false, false, false, "", "false", "comment");
        } else {
            allocation = payload.getContent().getAllocation();
        }
        String comment = allocation.getComment();
        if (!StringUtils.isEmpty(comment)) {
            commentService.createComment(comment);
        }
        if (payload.isSubmitted() && payload.isFilled() && payload.isCorrect()) {
            this.examiner1Suggestion = allocation.getExaminer1();
            if (!allocation.isAutosuggestion() || !allocation.isBatch()) {
                this.examiner2Suggestion = allocation.getExaminer2();
                this.chairSuggestion = allocation.getChairman();
            }
            return ResponseUtil.serveStringValue("");
        }
        StringBuilder response = new StringBuilder(AllocationController.RESPONSE_HEADER);
        if (allocation.isAdvanced()) {
            response.append(String.format(AllocationController.PREVIOUS_ADVANCED, "true"));
            response.append(AllocationController.ADVANCED);
            response.append(AllocationController.DIRECTORATS);
        } else {
            response.append(String.format(AllocationController.PREVIOUS_ADVANCED, "false"));
        }
        if (allocation.isAutosuggestion()) {
            response.append(AllocationController.AUTOSUGGESTION_TRUE);
        }
        if (allocation.isBatch()) {
            response.append(AllocationController.BATCH_ALLOCATION_TRUE);
        }
        if (allocation.isBatch() && !allocation.isSubmit()) {
            response.append(AllocationController.TECHNICAL_FIELD);
        }
        if (allocation.isFilterExaminer1()) {
            response.append(String.format(AllocationController.EXAMINER_1_FILTERED_LIST, this.examiner1Suggestion));
        } else {
            response.append(String.format(AllocationController.EXAMINER_1_LIST, this.examiner1Suggestion));
        }
        if (allocation.isFilterExaminer2()) {
            response.append(String.format(AllocationController.EXAMINER_2_FILTERED_LIST, this.examiner2Suggestion));
        } else {
            response.append(String.format(AllocationController.EXAMINER_2_LIST, this.examiner2Suggestion));
        }
        if (allocation.isFilterChairman()) {
            response.append(String.format(AllocationController.CHAIRMAN_FILTERED_LIST, this.chairSuggestion));
        } else {
            response.append(String.format(AllocationController.CHAIRMAN_LIST, this.chairSuggestion));
        }
        response.append(AllocationController.FILTERS);
        if ((payload.isSubmitted() && !payload.isFilled()) || !payload.isCorrect()) {
            response.append(AllocationController.ERRORS);
        }
        response.append(AllocationController.RESPONSE_FOOTER);
        return ResponseUtil.serveStringValue(response.toString());
    }

    private static final String RESPONSE_HEADER = "{\n"+
            "  \"formresponse\": {\n"+
            "    \"missing\": {\n"+
            "      \"anchor\": {\n"+
            "        \"@class\": \"array\",\n"+
            "        \"anchor\": {\n"+
            "          \"objectid\": \"Assign_examiners_and_stockmanager\",\n"+
            "          \"element\": [\n" +
            "            {\n" +
            "              \"elementid\": \"DossierDirectorate\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"1603 - Lefebvre\"\n" +
            "              }\n" +
            "            },";

    private static final String RESPONSE_FOOTER = "]\n" +
            "        }\n" +
            "      }\n" +
            "    }\n" +
            "  }\n" +
            "}";

    private static final String BATCH_ALLOCATION_TRUE = "{\n" +
            "              \"elementid\": \"BatchAllocation\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String AUTOSUGGESTION_TRUE = "{\n" +
            "              \"elementid\": \"Autosuggestion\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String TECHNICAL_FIELD = " {\n" +
            "              \"elementid\": \"TechnicalField\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"F41G11/00\"\n" +
            "              }\n" +
            "            },";

    private static final String PREVIOUS_ADVANCED = "\n{\n"+
            "              \"elementid\": \"previous_AdvancedAllocation\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String ADVANCED ="\n{\n"+
            "              \"elementid\": \"AdvancedAllocation\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String DIRECTORATS = "\n{\n"+
            "              \"elementid\": \"DirectorateExaminer1\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"1360\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"1302\",\n" +
            "                  \"label\": \"1302 - Deffner\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1308\",\n" +
            "                  \"label\": \"1308 - Herrera S.\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1354\",\n" +
            "                  \"label\": \"1354 - Georgiou\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1358\",\n" +
            "                  \"label\": \"1358 - Weaver\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1360\",\n" +
            "                  \"label\": \"1360 - Nissen\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },\n" +
            "            {\n" +
            "              \"elementid\": \"DirectorateExaminer2\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"1308\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"1302\",\n" +
            "                  \"label\": \"1302 - Deffner\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1308\",\n" +
            "                  \"label\": \"1308 - Herrera S.\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1354\",\n" +
            "                  \"label\": \"1354 - Georgiou\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1358\",\n" +
            "                  \"label\": \"1358 - Weaver\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1360\",\n" +
            "                  \"label\": \"1360 - Nissen\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },\n" +
            "            {\n" +
            "              \"elementid\": \"DirectorateChairman\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"1358\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"1302\",\n" +
            "                  \"label\": \"1302 - Deffner\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1308\",\n" +
            "                  \"label\": \"1308 - Herrera S.\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1354\",\n" +
            "                  \"label\": \"1354 - Georgiou\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1358\",\n" +
            "                  \"label\": \"1358 - Weaver\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"1360\",\n" +
            "                  \"label\": \"1360 - Nissen\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String FILTERS = "\n{\n"+
            "              \"elementid\": \"FilterExaminer1\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            }," +
            "            {\n" +
            "              \"elementid\": \"FilterExaminer1Team\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            }," +
            "            {\n" +
            "              \"elementid\": \"FilterExaminer2\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },\n" +
            "            {\n" +
            "              \"elementid\": \"FilterChairman\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"true\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"true\",\n" +
            "                  \"label\": \"true\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"false\",\n" +
            "                  \"label\": \"false\"\n" +
            "                }\n" +
            "              ]\n" +
            "            }";

    private static final String EXAMINER_1_LIST = "\n{\n"+
            "              \"elementid\": \"Examiner1\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"AL21814\",\n" +
            "                  \"label\": \"AL21814\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"AP51110\",\n" +
            "                  \"label\": \"AP51110\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"BM22195\",\n" +
            "                  \"label\": \"BM22195\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"BN23785\",\n" +
            "                  \"label\": \"BN23785\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"JS23053\",\n" +
            "                  \"label\": \"JS23053\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"LP23308\",\n" +
            "                  \"label\": \"LP23308\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"PS23924\",\n" +
            "                  \"label\": \"PS23924\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String EXAMINER_1_FILTERED_LIST = "\n" +
            "            {\n" +
            "              \"elementid\": \"Examiner1\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String EXAMINER_2_LIST = "\n{\n"+
            "              \"elementid\": \"Examiner2\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"AP51110\",\n" +
            "                  \"label\": \"AP51110\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"AL21814\",\n" +
            "                  \"label\": \"AL21814\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"BM22195\",\n" +
            "                  \"label\": \"BM22195\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"BN23785\",\n" +
            "                  \"label\": \"BN23785\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"JS23053\",\n" +
            "                  \"label\": \"JS23053\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"LP23308\",\n" +
            "                  \"label\": \"LP23308\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"PS23924\",\n" +
            "                  \"label\": \"PS23924\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String EXAMINER_2_FILTERED_LIST = "\n{\n"+
            "              \"elementid\": \"Examiner2\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"AP51110\",\n" +
            "                  \"label\": \"AP51110\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"PS23924\",\n" +
            "                  \"label\": \"PS23924\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String CHAIRMAN_LIST = "\n{\n"+
            "              \"elementid\": \"Chairman\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"JS23053\",\n" +
            "                  \"label\": \"JS23053\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"AL21814\",\n" +
            "                  \"label\": \"AL21814\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"AP51110\",\n" +
            "                  \"label\": \"AP51110\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"BM22195\",\n" +
            "                  \"label\": \"BM22195\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"LP23308\",\n" +
            "                  \"label\": \"LP23308\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"PS23924\",\n" +
            "                  \"label\": \"PS23924\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String CHAIRMAN_FILTERED_LIST = "\n{\n" +
            "              \"elementid\": \"Chairman\",\n" +
            "              \"suggestion\": {\n" +
            "                \"@class\": \"array\",\n" +
            "                \"suggestion\": \"%s\"\n" +
            "              },\n" +
            "              \"dynamicschema\": [\n" +
            "                {\n" +
            "                  \"code\": \"PS23924\",\n" +
            "                  \"label\": \"PS23924\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"EDOEX10\",\n" +
            "                  \"label\": \"Test Examiner 10\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"code\": \"VF23718\",\n" +
            "                  \"label\": \"VF23718\"\n" +
            "                }\n" +
            "              ]\n" +
            "            },";

    private static final String ERRORS = ",\n"+
            "            {\n"+
            "              \"elementid\": \"ErrorMessage\",\n"+
            "              \"suggestion\": [\"secondExaminerAndChairmanMayNotBeAssignedToSameUser\"]\n"+
            "           }";
}
