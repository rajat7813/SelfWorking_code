package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 03.03.16.
 */

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class EditionStmt {
    @JacksonXmlProperty
    Author author;
}
