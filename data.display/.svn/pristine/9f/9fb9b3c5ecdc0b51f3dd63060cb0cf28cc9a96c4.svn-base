package com.sopra.readingdata;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hslf.HSLFSlideShow;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.usermodel.SlideShow;

public class PptReader {



	@SuppressWarnings("rawtypes")
	public static void main(String[] args) throws FileNotFoundException, IOException {
/*		try {

			// create ppt slide

			SlideShow slideShow = new SlideShow();
			Slide slide1 = slideShow.createSlide();
			TextBox title = slide1.addTitle();
			title.setText("I am HADI, i like to do programming ");
			RichTextRun richtextrun = title.getTextRun().getRichTextRuns()[0];
			richtextrun.setFontSize(100);
			richtextrun.setFontName("Arial");
			richtextrun.setBold(true);
			richtextrun.setItalic(true);
			// richtextrun.setUnderlined(true);
			richtextrun.setFontColor(Color.blue);
			richtextrun.setAlignment(TextBox.AlignLeft);

			FileOutputStream out1 = new FileOutputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\Linux.ppt");
			slideShow.write(out1);
			out1.close();

			// convert ppt slide into image

			FileInputStream is = new FileInputStream("testing.ppt");
			SlideShow ppt = new SlideShow(is);
			is.close();

			Dimension pgsize = ppt.getPageSize();

			Slide[] slide = ppt.getSlides();
			for (int i = 0; i < slide.length; i++) {

				BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				// clear the drawing area
				graphics.setPaint(Color.white);
				// graphics.setBackground(Color.red);
				graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));

				// render
				slide[i].draw(graphics);

				// save the output
				FileOutputStream out = new FileOutputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\slide-" + (i + 1) + ".png");
				javax.imageio.ImageIO.write(img, "png", out);
				out.close();
			}

		} catch (Exception e) {
		}
		
		
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// TODO code application logic here
		FileInputStream is = new FileInputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\Linux.ppt");
		HSLFSlideShow show = new HSLFSlideShow(is);
		SlideShow ppt = new SlideShow(show);
		is.close();

		Dimension pgsize = ppt.getPageSize();

		Slide[] slide = ppt.getSlides();
		for (int i = 0; i < slide.length; i++) {

		BufferedImage img = new BufferedImage(pgsize.width, pgsize.height, 1);

		Graphics2D graphics = img.createGraphics();
		graphics.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
		RenderingHints.VALUE_INTERPOLATION_BICUBIC);
		graphics.setRenderingHint(RenderingHints.KEY_FRACTIONALMETRICS,
		RenderingHints.VALUE_FRACTIONALMETRICS_ON);

		graphics.setColor(Color.white);
		graphics.clearRect(0, 0, pgsize.width, pgsize.height);
		graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width, pgsize.height));

		// render
		slide[i].draw(graphics);

		// save the output
		FileOutputStream out = new FileOutputStream("D:\\Users\\raarora\\Desktop\\Mydocument\\slide-" + (i + 1) + ".png");
		javax.imageio.ImageIO.write(img, "png", out);
		out.close();
		}
		
		System.out.println("Images are created successfully");
	}
}
