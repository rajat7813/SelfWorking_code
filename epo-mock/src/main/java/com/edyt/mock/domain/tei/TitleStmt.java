package com.edyt.mock.domain.tei;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Created by przemekd on 06.05.16.
 */
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class TitleStmt {
    Author author;
    Biblio biblio;
}
