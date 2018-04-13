package com.edyt.mock.domain.tei;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Created by przemekd on 03.03.16.
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RevisionDesc {
    @JacksonXmlElementWrapper(useWrapping = false)
    List<Change> changes;
}
