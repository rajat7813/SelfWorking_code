package com.edyt.mock.domain.facsimile;

import com.fasterxml.jackson.annotation.JsonRawValue;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by przemekd on 03.03.16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Facsimile {
    @JacksonXmlProperty(isAttribute = true)
    private String id;

    @JacksonXmlElementWrapper(useWrapping = false)
    private List<Surface> surface = new ArrayList<>();
}
