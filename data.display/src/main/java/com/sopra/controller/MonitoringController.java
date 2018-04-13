package com.sopra.controller;

import java.io.IOException;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sopra.pojo.FinalA;
import com.sopra.readingdata.MonitoringTrackerSheetService;



@RestController
public class MonitoringController {
	
	@Autowired
	private MonitoringTrackerSheetService monitoringTrackerSheetService;
	
    @RequestMapping(value = "/restServices/defaultFilters", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<FinalA> getDefaultFilters() throws EncryptedDocumentException, InvalidFormatException, IOException {
    	//String abc = "hello";
    	
    	 
    	FinalA rowData = monitoringTrackerSheetService.MonitoringTaskApi();
    	
    	//List<FinalA> abc = new ArrayList<FinalA>();
    	//return abc;
    	
    	return new ResponseEntity<FinalA>(rowData,  HttpStatus.OK);
    	//return new ResponseEntity List<FinalA>(abc, HttpStatus.OK);
      //  return ResponseUtil.serveJsonResource("Json/Sheet20_03_18_17.json");
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity getDefaultFilterss() throws EncryptedDocumentException, InvalidFormatException, IOException {
    	//String abc = "hello";
    	
    	 
    	FinalA rowData = monitoringTrackerSheetService.MonitoringTaskApi();
    	
    	//List<FinalA> abc = new ArrayList<FinalA>();
    	//return abc;
    	
    	return new ResponseEntity<FinalA>("abc", HttpStatus.OK);
    	//return new ResponseEntity List<FinalA>(abc, HttpStatus.OK);
      //  return ResponseUtil.serveJsonResource("Json/Sheet20_03_18_17.json");
    }
    
    


    @RequestMapping(path= "/greet/{name}",method=RequestMethod.GET)    
    public String greet(@PathVariable String name, ModelMap model){
        String greet =" Hello !!!" + name + " How are You?";
        model.addAttribute("greet", greet);
        System.out.println(greet);
        
        return "greet";
    }
    
    
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String sayHelloAgain(ModelMap model) {
        model.addAttribute("greeting", "Hello World Again, from Spring 4 MVC");
        return "welcome";
    }
    
    
	@SuppressWarnings("rawtypes")
	@GetMapping("/customers")
	public List getCustomers() throws EncryptedDocumentException, InvalidFormatException, IOException {
		
		FinalA data = monitoringTrackerSheetService.MonitoringTaskApi();
		return (List) data;
	}
    

}
