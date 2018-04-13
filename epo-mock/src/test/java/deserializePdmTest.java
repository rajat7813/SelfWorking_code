import com.edyt.mock.domain.standoff.StandOff;
import com.edyt.mock.xmlmapper.StandOffXmlMapper;
import com.fasterxml.jackson.dataformat.xml.JacksonXmlModule;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.core.io.ClassPathResource;

/**
 * Created by przemekd on 11.03.16.
 */
public class deserializePdmTest {

    @Test
    public void deserializePdmTest() throws Exception{

        XmlMapper xmlMapper = new StandOffXmlMapper();
        ClassPathResource resource = new ClassPathResource("pdm.xml");
        StandOff standOff = xmlMapper.readValue(resource.getInputStream(), StandOff.class);

        assertNotNull(standOff);
        assertNotNull(standOff.getListAnnotation().getListAnnotation());
    }
}
