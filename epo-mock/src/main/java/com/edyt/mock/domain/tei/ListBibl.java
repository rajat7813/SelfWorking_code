package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ListBibl {

  @JacksonXmlProperty(isAttribute = true)
  private String type;

  @JacksonXmlProperty
  @JacksonXmlElementWrapper(useWrapping = false)
  private List<Bibl> bibl;
}
