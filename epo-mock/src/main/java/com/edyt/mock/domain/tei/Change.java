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
@Getter
@Setter
public class Change {

    @JacksonXmlProperty(isAttribute = true)
    String when;
    @JacksonXmlProperty(isAttribute = true)
    String who;
}
