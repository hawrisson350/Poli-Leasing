/**
 *
 * @author hawrisson.avendano
 */
package Clases;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;

public class ReadXMLFile {

    public NodeList Readxlm(File Not) {
        try {
            File fXmlFile = new File("C:\\Users\\hawrisson.avendano\\Documents\\superArrenda\\ArrendamientosContratos\\web\\noticias.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();

            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

            Document doc = dBuilder.parse(Not);
            doc.getDocumentElement().normalize();
            System.out.println("Elemento raíz:" + doc.getDocumentElement().getNodeName());
            NodeList nlist = doc.getElementsByTagName("not");
            System.out.println("-----------------------");
            /*for (int temp = 0; nlist.getLength() > temp; temp++) {
                Node nNode = nlist.item(temp);
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element eElement = (Element) nNode;
                    System.out.println("Titulo:" + getTagValue("titulo", eElement));
                    System.out.println("Descripcion:" + getTagValue("desc", eElement));
                    System.out.println("imagen:" + getTagValue("ima", eElement));
                }
            }*/
            return nlist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getTagValue(String sTag, Element eElement) {
        NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
        Node nValue = (Node) nlList.item(0);
        return nValue.getNodeValue();
    }
}
    
