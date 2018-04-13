package com.edyt.mock.domain.standoff;


import com.edyt.mock.domain.annotation.ListAnnotation;
import com.edyt.mock.domain.facsimile.Facsimile;
import com.edyt.mock.domain.tei.TeiHeader;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Created by przemekd on 02.03.16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JacksonXmlRootElement(localName = "standOff")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class StandOff {
    @JacksonXmlProperty()
    private StandOff standOff;

    @JacksonXmlProperty
    private TeiHeader teiHeader;

    @JacksonXmlProperty(isAttribute = true)
    private String id;

    @JacksonXmlProperty(isAttribute = true)
    private String type;

    @JacksonXmlProperty
    @JacksonXmlElementWrapper(useWrapping = false)
    private List<Facsimile> facsimile;

    @JacksonXmlProperty
    private ListAnnotation listAnnotation;

}
