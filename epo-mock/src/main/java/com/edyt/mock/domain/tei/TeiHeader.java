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
public class TeiHeader {

    @JacksonXmlProperty
    private FileDesc fileDesc;
    @JacksonXmlProperty
    private EncodingDesc encodingDesc;
    @JacksonXmlProperty
    private ProfileDesc profileDesc;
    @JacksonXmlProperty
    private RevisionDesc revisionDesc;
}
