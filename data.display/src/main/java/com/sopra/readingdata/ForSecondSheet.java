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
import org.apache.poi.xssf.streaming.SXSSFRow.CellIterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ForSecondSheet {

	public static Object fileWriter;

	@SuppressWarnings({ "unchecked", "deprecation" })
	public static void main(String[] args) throws InvalidFormatException, IOException {/*

		// TODO Auto-generated method stub
		PdfReader pdf = new PdfReader();

		ObjectMapper mapper = new ObjectMapper();
		// DataFormatter formatter = new DataFormatter();
		FileInputStream inp = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\CR3-TrackerSummary.xlsx");
		Workbook workbook = WorkbookFactory.create(inp);

		// Commented to debug the issue
		//for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
			// Get the first Sheet.
			Sheet sheet = workbook.getSheetAt(1);

			// Start constructing JSON.
			JSONObject json = new JSONObject();

			// Iterate through the rows.
			JSONArray rows = new JSONArray();

			Iterator<Cell> cellIterator  = sheet.iterator();
			while (cellIterator.hasNext()) {

				Row cell = CellIterator.next();
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

						if (cell.getCellStyle().getDataFormatString().contains("Total")) {

						}
						break;

					case Cell.CELL_TYPE_NUMERIC:

						if (cell.getCellStyle().getDataFormatString().contains("/")) {

							// System.out.println("date cahnged");

							Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

							cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
						}

						else if (cell.getCellStyle().getDataFormatString().contains("%")) {

							// Detect Percent Values
							Double value = cell.getNumericCellValue();

							cells.add(value.toString() + "%");
						} else if (cell.getCellStyle().getDataFormatString().contains("mmm")) {

							// Detect Percent Values
							Date javaDate1 = cell.getDateCellValue();
							cells.add(new SimpleDateFormat("dd/MM/yyyy").format(javaDate1));
						}

						else if (cell.getNumericCellValue() == 0) {
							cells.add(0);
						}

						else {
							cells.add(cell.getNumericCellValue() + "");
						}
						break;

					case Cell.CELL_TYPE_FORMULA:

						switch (cell.getCellTypeEnum()) {

						case STRING:

							cells.add(cell.getRichStringCellValue().getString());
							break;
						case FORMULA:

							if (cell.toString().contains("+") && !cell.toString().contains("REF")
									&& !cell.toString().contains("1)") && !cell.toString().contains("+7")) {
								if (cell.getCellType() == 2) {
									cells.add(cell.getNumericCellValue());
								}

							} else if (cell.getCellStyle().getDataFormatString().contains("%")) {

								Double value = cell.getNumericCellValue() * 100;

								cells.add(value.toString() + "%");
							} else if (cell.toString().contains(":")) {
								System.out.println(cell.getNumericCellValue());
								cells.add(cell.getNumericCellValue());
							} else if (cell.toString().contains("+7")) {

								// Detect Percent Values
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

								cells.add(new SimpleDateFormat("dd/MM/yyyy").format(javaDate));
							}
							break;
						case BOOLEAN:
							cells.add(cell.getBooleanCellValue());
							break;
						case ERROR:
							cells.add(cell.getErrorCellValue());
							break;
						default:
							// System.out.println("default formula cell");
							cells.add("Some_Raw Data");
						}
						break;

					case Cell.CELL_TYPE_BLANK:

						cells.add("");
						break;

					}
				}
				jRow.put("cell", cells);
				rows.add(jRow);

				System.out.println("");
			}
			json.put("rows", rows);
			// Create a new FileWriter object
			FileWriter fileWriter = new FileWriter("D:\\Users\\raarora\\Desktop\\Mydocument\\Sheet" + 1255 + ".json");

			// Writting the jsonObject into sample.json
			fileWriter.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(json));

			fileWriter.close();

			System.out.println("JSON Object Successfully written to the file!!");

			System.out.println("Calling change for pdf");

			pdf.convertingPdf();

			
			 * ClassB classb=new ClassB(); classb.setEpic("epic");
			 * classb.setNo_of_User_Stories(1); List<ClassB> row=new
			 * ArrayList<ClassB>();
			 * 
			 * ClassB classb2=new ClassB(); classb2.setEpic("epic2");
			 * classb2.setNo_of_User_Stories(2);
			 * 
			 * row.add(classb); row.add(classb2);
			 * 
			 * FinalA f=new FinalA(); f.setRow(row);
			 * 
			 * 
			 * FileWriter fileWriter2 = new
			 * FileWriter("D:\\Users\\raarora\\Desktop\\Mydocument\\Sheet12" +
			 * 11 + ".json");
			 * 
			 * // Writting the jsonObject into sample.json
			 * fileWriter2.write(mapper.writerWithDefaultPrettyPrinter().
			 * writeValueAsString(f)); fileWriter2.close();
			 * 
			 * 
			 
		*/}
	}

