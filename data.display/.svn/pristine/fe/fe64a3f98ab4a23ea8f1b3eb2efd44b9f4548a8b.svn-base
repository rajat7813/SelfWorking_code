package com.sopra.readingdata;

import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ExcelData {

	@SuppressWarnings({ "deprecation", "unchecked", "static-access" })
	public static void main(String[] args) throws InvalidFormatException, IOException {
		// TODO Auto-generated method stub

		ObjectMapper mapper = new ObjectMapper();

		FileInputStream inp = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\CR3-TrackerSummary.xlsx");
		Workbook workbook = WorkbookFactory.create(inp);

		// Commented to debug the issue
		// for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
		// Get the first Sheet.
		Sheet sheet = workbook.getSheetAt(2);

		// Start constructing JSON.
		JSONObject json = new JSONObject();

		// Iterate through the rows.
		JSONArray rows = new JSONArray();

		Iterator<Row> rowIterator = sheet.iterator();
		while (rowIterator.hasNext()) {
			int count = 0;

			Row row = rowIterator.next();
			JSONObject jRow = new JSONObject();
			// For each row, iterate through all the columns
			Iterator<Cell> cellIterator = row.cellIterator();
			JSONArray cells = new JSONArray();
			while (cellIterator.hasNext()) {

				Cell cell = cellIterator.next();
				// Check the cell type and format accordingly
				switch (cell.getCellType()) {

				case Cell.CELL_TYPE_STRING:

					cells.add(cell.getStringCellValue());
					break;

				case Cell.CELL_TYPE_NUMERIC:
					count++;
					if (cell.getCellStyle().getDataFormatString().contains("/")) {

						// System.out.println("date cahnged");

						Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

						cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
					}

					else if (cell.getNumericCellValue() == 0) {
						cells.add(0);
					} else {
						cells.add(cell.getNumericCellValue() + "");
					}
					break;

				case Cell.CELL_TYPE_FORMULA:
					// System.out.println(cell);
					// System.out.println("ankit\t"+cell);
					// String formula_result[]=cell.toString().split("I3+N3");
					// System.out.println("splitting1\t"+formula_result[0]);
					// String
					// formula_result2[]=formula_result[1].split("H3/M3");
					// System.out.println("final\t\t"+formula_result2[0]);

					switch (cell.getCellTypeEnum()) {

					case NUMERIC:

						if (cell.getCellStyle().getDataFormatString().contains("%")) {

							// Detect Percent Values
							Double value = cell.getNumericCellValue() * 100;

							cells.add(value.toString() + "%");
						} else {
							/*
							 * System.out.println(cell.getNumericCellValue());
							 */
							cells.add(cell.getNumericCellValue());
						}
						break;
					case BOOLEAN:
						cells.add(cell.getBooleanCellValue());
						break;
					case ERROR:
						cells.add(cell.getErrorCellValue());
						break;
					case FORMULA:
						System.out.println(cell);
						if (cell.toString().contains("+") && !cell.toString().contains("REF") && !cell.toString().contains("SUM")) {
							if (cell.getCellType() == 2) {
								System.out.println(cell.getNumericCellValue());
							}else if (cell.toString().contains("+")){
								System.out.println(cell);
							}

						}

						// System.out.println(cell.getNumericCellValue());
						/*
						 * switch (cell.getCachedFormulaResultType()) {
						 * 
						 * case Cell.CELL_TYPE_NUMERIC:
						 * System.out.print(cell.getNumericCellValue()); //case
						 * Cell.CELL_TYPE_STRING:
						 * System.out.print(cell.getStringCellValue().replaceAll
						 * ("'", "")); }
						 */
						// System.out.print(cell.getCellFormula());
						break;

					default:
						// System.out.println("default formula cell");
						cells.add("Some_Raw Data");
					}
					break;

				case Cell.CELL_TYPE_BLANK:

					cells.add(null);
					break;

				}
			}
			jRow.put("cell", cells);
			rows.add(jRow);

			System.out.println("");
		}
		json.put("rows", rows);
		// Create a new FileWriter object
		FileWriter fileWriter = new FileWriter("D:\\Users\\raarora\\Desktop\\Mydocument\\Sheet" + 12 + ".json");

		// Writting the jsonObject into sample.json
		fileWriter.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(json));

		fileWriter.close();

		System.out.println("JSON Object Successfully written to the file!!");

	}
}
