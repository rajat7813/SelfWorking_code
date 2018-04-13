package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlText;
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
public class Idno {

    @JacksonXmlProperty(isAttribute = true)
    String type;

    @JacksonXmlText
    String value;
}
