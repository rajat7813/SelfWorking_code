package com.edyt.mock.domain.facsimile;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by przemekd on 14.04.16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Surface {
    @JacksonXmlProperty(isAttribute = true)
    private String id;
    @JacksonXmlProperty(isAttribute = true)
    private String type;
    @JacksonXmlProperty(isAttribute = true)
    private Integer n;
    @JacksonXmlElementWrapper(useWrapping = false)
    private Graphic graphic = new Graphic();

}
