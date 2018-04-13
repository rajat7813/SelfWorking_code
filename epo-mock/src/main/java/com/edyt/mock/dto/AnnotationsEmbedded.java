package com.edyt.mock.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * Created by przemekd on 04.05.16.
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AnnotationsEmbedded {

    List<Annotation> annotations;
}
