package com.edyt.mock.domain.deputisation;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DeputisationList {
    @JsonProperty("AM04ListAccountRoles")
    private List<Deputisation> list;
}
