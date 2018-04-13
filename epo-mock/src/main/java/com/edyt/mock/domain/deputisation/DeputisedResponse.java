package com.edyt.mock.domain.deputisation;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.LinkedList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DeputisedResponse {
    @JsonProperty("AM04ListAccountRoles")
    private List<Object> list;

    @Getter
    @Setter
    private static class AM04_Result {
        @JsonProperty("AM04_Explanation")
        private String explanation = "";
        @JsonProperty("AM04_Result")
        private String result = "OK";
    }

    public DeputisedResponse(DeputisationList deputisationList) {
        list = new LinkedList<>();
        list.add(new AM04_Result());
        list.addAll(deputisationList.getList());
    }
}
