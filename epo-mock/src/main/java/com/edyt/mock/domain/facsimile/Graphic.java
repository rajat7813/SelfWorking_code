package com.edyt.mock.domain.facsimile;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 14.04.16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Graphic {
    @JacksonXmlProperty(isAttribute = true)
    private String type;
    @JacksonXmlProperty(isAttribute = true)
    private String url;
}
