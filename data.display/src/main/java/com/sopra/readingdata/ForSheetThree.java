package com.sopra.readingdata;

import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
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
import com.sopra.pojo.FinalA;
import com.sopra.pojo.Tracker_9_Feb;

public class ForSheetThree {

	@SuppressWarnings({ "unchecked", "deprecation" })
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {

		int i = 0, j = 0;
		ObjectMapper mapper = new ObjectMapper();

		FileInputStream inp = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\CR3-TrackerSummary.xlsx");
		Workbook workbook = WorkbookFactory.create(inp);

		Sheet sheet = workbook.getSheetAt(2);

		// Start constructing JSON.
		JSONObject json = new JSONObject();

		// Iterate through the rows.
		JSONArray rows = new JSONArray();

		List<Tracker_9_Feb> row1 = new ArrayList<Tracker_9_Feb>();

		Iterator<Row> rowIterator = sheet.iterator();
		while (rowIterator.hasNext()) {

			i++;

			Tracker_9_Feb tF = new Tracker_9_Feb();

			Row row = rowIterator.next();
			JSONObject jRow = new JSONObject();
			// For each row, iterate through all the columns
			Iterator<Cell> cellIterator = row.cellIterator();
			JSONArray cells = new JSONArray();
			while (cellIterator.hasNext()) {
				j++;

				Cell cell = cellIterator.next();

				if (i == 1) {
					if (j == 8) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_NUMERIC:

							if (cell.getCellStyle().getDataFormatString().contains("/")) {

								// System.out.println("date cahnged");

								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setEfforts_in_mandays(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
							} else {
								cells.add(cell.getNumericCellValue() + "");
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setEfforts_in_mandays(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								// tR.setKey_Reason_for_display_on_date(cell.getNumericCellValue()
								// + "");
							}
							break;

						default:

							cells.add("");
							tF.setEfforts_in_mandays("");
							break;
						}
					} else if (j == 16) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_NUMERIC:

							if (cell.getCellStyle().getDataFormatString().contains("/")) {

								// System.out.println("date cahnged");

								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setDelivery_Date(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
							} else {
								cells.add(cell.getNumericCellValue() + "");
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());

								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setDelivery_Date(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								// tR.setKey_Reason_for_display_on_date(cell.getNumericCellValue()
								// + "");
							}
							break;

						default:

							cells.add("");
							tF.setDelivery_Date("");
							break;
						}
					}
				} else if (i >= 1) {
					if (j == 1) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setEpic(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setEpic(cell.getNumericCellValue() + "");
							break;
						case Cell.CELL_TYPE_BLANK:

							// tR.setS_No("");
							break;

						default:

							cells.add("");
							tF.setEpic("");
							break;
						}
					} else if (j == 2) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setNo_of_User_Stories(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setNo_of_User_Stories(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setNo_of_User_Stories("");
							break;
						}
					} else if (j == 3) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setuS_S_No(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setuS_S_No(cell.getNumericCellValue() + "");
							break;
						case Cell.CELL_TYPE_BLANK:

							tF.setuS_S_No(cell.getNumericCellValue() + "");
							break;

						case Cell.CELL_TYPE_FORMULA:

							tF.setuS_S_No(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setuS_S_No("");
							break;
						}
					} else if (j == 4) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setUser_Story_Title(cell.getStringCellValue());

							break;

						case Cell.CELL_TYPE_NUMERIC:

							if (cell.getCellStyle().getDataFormatString().contains("/")) {

								// System.out.println("date cahnged");
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());
								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setUser_Story_Title(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
							}
							break;

						default:

							cells.add("");
							tF.setUser_Story_Title("");
							break;
						}
					} else if (j == 5) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setApproved_On(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setApproved_On(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setApproved_On("");
							break;
						}
					} else if (j == 6) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setLatest_Wireframe_Available_On(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setLatest_Wireframe_Available_On(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setLatest_Wireframe_Available_On("");
							break;
						}
					} else if (j == 7) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setLatest_Design_Document_Available_On(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setLatest_Design_Document_Available_On(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setLatest_Design_Document_Available_On("");
							break;
						}
					} else if (j == 8) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setOriginal_Budget(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setOriginal_Budget(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setOriginal_Budget("");
							break;
						}
					} else if (j == 9) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setActuals_AsonDate(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setActuals_AsonDate(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setActuals_AsonDate("");
							break;
						}
					} else if (j == 10) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setPercentage_completed(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setPercentage_completed(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setPercentage_completed("");
							break;
						}
					} else if (j == 11) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setEarned_Value(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setEarned_Value(cell.getNumericCellValue() + "");
							break;

						case Cell.CELL_TYPE_FORMULA:

							tF.setEarned_Value(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setEarned_Value("");
							break;
						}
					} else if (j == 12) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setCost_Performance_Index(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setCost_Performance_Index(cell.getNumericCellValue() + "");
							break;
						case Cell.CELL_TYPE_FORMULA:

							tF.setCost_Performance_Index(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setCost_Performance_Index("");
							break;
						}
					} else if (j == 13) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setEstimate_at_Completion(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setEstimate_at_Completion(cell.getNumericCellValue() + "");
							break;

						case Cell.CELL_TYPE_FORMULA:

							tF.setEstimate_at_Completion(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setEstimate_at_Completion("");
							break;
						}
					} else if (j == 14) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setEstimate_to_Complete(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setEstimate_to_Complete(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setEstimate_to_Complete("");
							break;
						}
					} else if (j == 15) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							} else if (cell.getCellStyle().getDataFormatString().contains("%")) {

								// Detect Percent Values
								Double value = cell.getNumericCellValue();

								cells.add(value.toString() + "%");
								tF.setProductivity(value.toString() + "%");
							} else {
								cells.add(cell.getStringCellValue());
								tF.setProductivity(cell.getStringCellValue());
							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							if (cell.getCellStyle().getDataFormatString().contains("%")) {

								// Detect Percent Values
								Double value = cell.getNumericCellValue();

								cells.add(value.toString() + "%");
								tF.setProductivity(value.toString() + "%");
							} else {
								tF.setProductivity(cell.getNumericCellValue() + "");
							}
							break;

						case Cell.CELL_TYPE_FORMULA:
							Double value = (cell.getNumericCellValue() * 100);
							tF.setProductivity(value.toString() + "%");
							break;

						default:

							cells.add("");
							tF.setProductivity("");
							break;
						}
					} else if (j == 16) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setOriginal(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:
							if (cell.getCellStyle().getDataFormatString().contains("/")) {

								// System.out.println("date cahnged");
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());
								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setOriginal(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
							} else {
								tF.setOriginal(cell.getNumericCellValue() + "");
							}
							break;

						default:

							cells.add("");
							tF.setOriginal("");
							break;
						}
					} else if (j == 17) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setRevised(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:
							if (cell.getCellStyle().getDataFormatString().contains("/")) {

								// System.out.println("date cahnged");
								Date javaDate = DateUtil.getJavaDate((double) cell.getNumericCellValue());
								cells.add(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
								tF.setRevised(new SimpleDateFormat("MM/dd/yyyy").format(javaDate));
							} else {
								tF.setRevised(cell.getNumericCellValue() + "");
							}
							break;

						default:

							cells.add("");
							tF.setRevised("");
							break;
						}
					} else if (j == 18) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setStatus(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setStatus(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setStatus("");
							break;
						}
					} else if (j == 19) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setComment(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setComment(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setComment("");
							break;
						}
					} else if (j == 20) {
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_STRING:

							cells.add(cell.getStringCellValue());
							tF.setAssigned_To(cell.getStringCellValue());

							if (cell.getCellStyle().getDataFormatString().contains("Total")) {

							}
							break;

						case Cell.CELL_TYPE_NUMERIC:

							tF.setAssigned_To(cell.getNumericCellValue() + "");
							break;

						default:

							cells.add("");
							tF.setAssigned_To("");
							break;
						}
					}

				}

			}
			j = 0;

			/*
			 * if (tR.getKey_Reason_for_display_on_date() != "Null" ) {
			 * row1.add(tR.getKey_Reason_for_display_on_date()); }
			 */

			row1.add(tF);

		}

		FinalA f = new FinalA();
		f.setTrack_mnth(row1);

		FileWriter fileWriter2 = new FileWriter("D:\\Users\\raarora\\Desktop\\Mydocument\\Sheet20_03_18_17.json");

		// Writting the jsonObject into sample.json
		fileWriter2.write(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(f));
		fileWriter2.close();

		System.out.println("Json created sucessfully");
	}

}
