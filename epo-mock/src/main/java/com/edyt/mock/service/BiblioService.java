package com.edyt.mock.service;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;

public class BiblioService {

    private final String applicationId;

    public BiblioService(String applicationId) {
        this.applicationId = applicationId;
    }

    public String updateBiblioXML() throws Exception {
        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
        Document doc = docBuilder.parse(new ClassPathResource("dsl/biblio/biblio.xml").getInputStream());

        updateNode(doc.getDocumentElement(), "title");
        updateNode(doc.getDocumentElement(), "name");

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource source = new DOMSource(doc);
        StringWriter writer = new StringWriter();
        StreamResult result = new StreamResult(writer);
        transformer.transform(source, result);
        String v = writer.toString();
        return v;
    }

    public void updateNode(Node node, String tagName) {
        if (node.getNodeName().equals(tagName)) {
            addApplicationNumber(node);
        } else {
            NodeList nodeList = node.getChildNodes();
            for (int i = 0; i < nodeList.getLength(); i++) {
                Node currentNode = nodeList.item(i);
                if (currentNode.getNodeType() == Node.ELEMENT_NODE) {
                    updateNode(currentNode, tagName);
                }
            }
        }
    }

    private void addApplicationNumber(Node node) {
        node.setTextContent(applicationId + " " + node.getTextContent());
    }
}
