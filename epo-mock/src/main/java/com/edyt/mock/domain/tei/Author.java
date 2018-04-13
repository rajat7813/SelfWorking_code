package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.annotation.JsonRawValue;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlText;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by przemekd on 01.03.16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Author implements Serializable{
    @JacksonXmlProperty(isAttribute = true)
    String id;
    @JacksonXmlProperty(isAttribute = true)
    private String role;
    @JsonRawValue
    private String value;
    Idno idno;
}
