
import com.edyt.mock.domain.annotation.ListAnnotation;
import com.edyt.mock.domain.standoff.StandOff;
import com.edyt.mock.domain.tei.AppInfo;
import com.edyt.mock.domain.tei.Application;
import com.edyt.mock.domain.tei.Author;
import com.edyt.mock.domain.tei.Biblio;
import com.edyt.mock.domain.tei.Change;
import com.edyt.mock.domain.tei.Creation;
import com.edyt.mock.domain.tei.Date;
import com.edyt.mock.domain.tei.EditionStmt;
import com.edyt.mock.domain.tei.EncodingDesc;
import com.edyt.mock.domain.tei.FileDesc;
import com.edyt.mock.domain.tei.Idno;
import com.edyt.mock.domain.tei.ProfileDesc;
import com.edyt.mock.domain.tei.RevisionDesc;
import com.edyt.mock.domain.tei.SourceDesc;
import com.edyt.mock.domain.tei.TeiHeader;
import com.edyt.mock.domain.tei.TitleStmt;
import com.edyt.mock.xmlmapper.StandOffXmlMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.junit.Test;

import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

/**
 * Created by przemekd on 01.03.16.
 */

public class AnnotationSerializationTest {


  @Test
  public void serializationTest() throws Exception {

    XmlMapper xmlMapper = new StandOffXmlMapper();


    Author author = new Author("123AA", "someRole", "John Smith", new Idno("userId", "123AA"));
    FileDesc fileDesc = new FileDesc(new TitleStmt(author, new Biblio("annotation", new Idno("annotationID", "aaaBBB"))), new EditionStmt(author), new SourceDesc());
    EncodingDesc encodingDesc = new EncodingDesc(new AppInfo(new Application("TeamPatent", "6.0", "")));
    ProfileDesc profileDesc = new ProfileDesc(new Creation(new Date("2016-01-01", "1467101078")));
    Change change = new Change("2016-01-02", "John Smith");
    RevisionDesc revisionDesc = new RevisionDesc(Collections.singletonList(change));


    TeiHeader teiHeader = new TeiHeader(fileDesc, encodingDesc, profileDesc, revisionDesc);
    String rawXML = "<listAnnotation><body>amazing body!</body><randomTag/></listAnnotation>";
    ListAnnotation listAnnotation = new ListAnnotation();
    listAnnotation.setListAnnotation(rawXML);
    StandOff standOff = new StandOff();
    standOff.setListAnnotation(listAnnotation);
    standOff.setTeiHeader(teiHeader);
    String xml = xmlMapper.writeValueAsString(standOff);
    //if we're here jackson didn't throw any exception
    assertNotNull(xml);
    assertFalse(xml.isEmpty());

    StandOff deserialized = xmlMapper.readValue(xml, StandOff.class);

    assertEquals(deserialized.getListAnnotation().getListAnnotation(), standOff.getListAnnotation().getListAnnotation());
  }

}
