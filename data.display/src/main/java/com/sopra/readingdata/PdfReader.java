package com.sopra.readingdata;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

public class PdfReader {
	
	
	public void convertingPdf(){
	 PDDocument pd;
	 BufferedWriter wr;
	 try {
	         File input = new File("D:\\Users\\raarora\\Desktop\\Mydocument\\PerformanceBacklog.pdf");  // The PDF file from where you would like to extract
	         File output = new File("D:\\Users\\raarora\\Desktop\\Mydocument\\pdf" + 2 + ".txt"); // The text file where you are going to store the extracted data
	         pd = PDDocument.load(input);
	         System.out.println(pd.getNumberOfPages());
	         System.out.println(pd.isEncrypted());
	         pd.save("CopyOfPdfFile.pdf"); // Creates a copy called	"pdfFile.pdf"
	         PDFTextStripper stripper = new PDFTextStripper();
	         wr = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(output)));
	         stripper.writeText(pd, wr);
	         if (pd != null) {
	             pd.close();
	         }
	        // I use close() to flush the stream.
	        wr.close();
	 } catch (Exception e){
	         e.printStackTrace();
	        } 
	     }

}

