package com.edyt.mock.xmlmapper;

import com.edyt.mock.domain.standoff.StandOff;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.apache.commons.io.IOUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;

/**
 * Created by przemekd on 20.07.16.
 */
public class StandOffXmlMapper extends XmlMapper {

    private String getRawXmlAnnotationBody(String xmlBody) {
        try {
            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(false);
            DocumentBuilder builder = factory.newDocumentBuilder();
            ByteArrayInputStream input = new ByteArrayInputStream(
                    xmlBody.getBytes("UTF-8"));
            Document doc = builder.parse(input);

            XPath xPath = XPathFactory.newInstance().newXPath();
            Node node = (Node) xPath.compile("//standOff[listAnnotation]/listAnnotation/listAnnotation").evaluate(doc, XPathConstants.NODE);
            if (null != node) {
                StringWriter sw = new StringWriter();
                Transformer t = TransformerFactory.newInstance().newTransformer();
                t.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
                t.setOutputProperty(OutputKeys.INDENT, "no");
                t.transform(new DOMSource(node), new StreamResult(sw));
                return sw.toString();
            }
            return "";
        } catch (IOException | ParserConfigurationException | SAXException | TransformerException | XPathExpressionException e) {
            return "";
        }

    }

    @Override
    public <T> T readValue(InputStream src, JavaType valueType) throws IOException, JsonParseException, JsonMappingException {
        return readValue(src, (Class<T>) valueType.getRawClass());
    }

    @Override
    public <T> T readValue(String content, Class<T> valueType) throws IOException, JsonParseException, JsonMappingException {
        InputStream inputStream = new ByteArrayInputStream(content.getBytes("UTF-8"));
        return readValue(inputStream, valueType);
    }

    @Override
    public <T> T readValue(InputStream src, Class<T> classType) throws IOException, JsonParseException, JsonMappingException {
        if (StandOff.class.equals(classType)) {
            StringWriter stringWriter = new StringWriter();
            IOUtils.copy(src, stringWriter, StandardCharsets.UTF_8);
            StandOff standOff = super.readValue(stringWriter.toString(), StandOff.class);
            StandOff standOffWithBody = standOff;
            while (standOffWithBody.getListAnnotation() == null && standOff.getStandOff() != null) {
                standOffWithBody = standOffWithBody.getStandOff();
            }
            standOffWithBody.getListAnnotation().setListAnnotation(getRawXmlAnnotationBody(stringWriter.toString()));
            return (T)standOff;

        } else {
            return super.readValue(src, classType);
        }
    }
}
