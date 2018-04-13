package com.sopra.readingdata;

import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ReadingExcel {

	
	public static ArrayList<String> ar = new ArrayList<String>();
	@SuppressWarnings({ "unchecked", "deprecation", "rawtypes" })
	public static void main(String[] args) throws InvalidFormatException, IOException {

		ObjectMapper mapper = new ObjectMapper();

//		FileInputStream inp = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\CR3-TrackerSummary.xlsx");
		FileInputStream inp = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\Stats.xls");
		
		Workbook workbook = WorkbookFactory.create(inp);

		// for retrieving data from excel

		/*
		 * System.out.println("Workbook has " + workbook.getNumberOfSheets() +
		 * " Sheets : "); // SheetIterator poi-ooxml version 3.15
		 * Iterator<Sheet> sheetIterator = workbook.sheetIterator();
		 * System.out.println("Retrieving Sheets using Iterator"); while
		 * (sheetIterator.hasNext()) { Sheet sheet = sheetIterator.next();
		 * System.out.println("=> " + sheet.getSheetName()); }
		 * 
		 * // Getting the Sheet at index zero Sheet sheet =
		 * workbook.getSheetAt(1);
		 * 
		 * // Create a DataFormatter to format and get each cell's value as
		 * String DataFormatter dataFormatter = new DataFormatter();
		 * 
		 * // 1. You can obtain a rowIterator and columnIterator and iterate
		 * over // them System.out.
		 * println("\n\nIterating over Rows and Columns using Iterator\n");
		 * Iterator<Row> rowIterator = sheet.rowIterator(); while
		 * (rowIterator.hasNext()) { Row row = rowIterator.next();
		 * 
		 * // Now let's iterate over the columns of the current row
		 * Iterator<Cell> cellIterator = row.cellIterator();
		 * 
		 * while (cellIterator.hasNext()) { Cell cell = cellIterator.next();
		 * String cellValue = dataFormatter.formatCellValue(cell);
		 * System.out.print(cellValue + "\t"); } System.out.println(); }
		 */
		
		

		Sheet sheet = workbook.getSheetAt(2);

		// Start constructing JSON.
		JSONObject json = new JSONObject();

		// Iterate through the rows.
		JSONArray rows = new JSONArray();
		for (Iterator<Row> rowsIT = sheet.rowIterator(); rowsIT.hasNext();) {
			Row row = rowsIT.next();
			JSONObject jRow = new JSONObject();

			// Iterate through the cells.
			JSONArray cells = new JSONArray();
			for (Iterator<Cell> cellsIT = row.cellIterator(); cellsIT.hasNext();) {
				Cell cell = cellsIT.next();
				if (cell.getColumnIndex() == 1)
				{
					cells.add(cell.getRichStringCellValue());
					jRow.put("head", cells);
					
					continue;
				}
				else if(cell.getCellType()==0 ){
					
					cells.add(cell.getNumericCellValue());	
				
				}else if(cell.getCellType()==1 ){
					
					cells.add(cell.getStringCellValue());	
				
				}
				else
				{
					cells.add(cell.getCellType());
					cells.addAll(ar);
					}
					ar.add(cell.getStringCellValue());
					//cells.addAll(ar);
			}
		
			jRow.put("cell", cells);
			rows.add(jRow);
			
		}
		json.put("rows", rows);
		
		Date date = new Date(System.currentTimeMillis());
		
/*		List lst = workbook.getAllPictures();
		for (Iterator it = lst.iterator(); it.hasNext(); ) {
		    PictureData pict = (PictureData)it.next();
		    String ext = pict.suggestFileExtension();
		    byte[] data = pict.getData();
		    if (ext.equals("jpg")){
		      FileOutputStream out = new FileOutputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\sample"+date.toString()+"pict.jpg");
		      out.write(data);
		      out.close();
		    }
		}
		*/
		System.out.println(ar);
		
		
		// Create a new FileWriter object
		FileWriter fileWriter = new FileWriter("D:\\Users\\raarora\\Desktop\\Mydocument\\sample"+date.toString()+".json");

		// Writting the jsonObject into sample.json
		//fileWriter.write(json);
		fileWriter.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(json));
		fileWriter.close();

		System.out.println("JSON File Sucessfully created");

		System.out.println(json.toJSONString());

		System.out.println(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(json));

		// System.out.println(json.toJSONString().);
		workbook.close();

	}
}
