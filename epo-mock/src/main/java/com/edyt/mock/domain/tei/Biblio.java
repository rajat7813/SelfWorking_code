package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 06.05.16.
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Biblio {

    @JacksonXmlProperty(isAttribute = true)
    String type = "annotation";
    Idno idno;
}
