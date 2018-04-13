package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Bibl {

  @JacksonXmlProperty(isAttribute = true)
  private String type;

  @JacksonXmlProperty
  private Idno idno;

}
