package com.edyt.mock.domain.db;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DatabaseMetadata {
    @JsonProperty("bi.db.driverClassName")
    private String driverClassName;

    @JsonProperty("bi.db.url")
    private String url;

    @JsonProperty("bi.db.username")
    private String username;

    @JsonProperty("bi.db.password")
    private String password;

    @JsonProperty("bi.db.initialSize")
    private String initialSize;

    @JsonProperty("bi.db.maxIdle")
    private String maxIdle;

    @JsonProperty("bi.db.minIdle")
    private String minIdle;

    @JsonProperty("bi.db.maxActive")
    private String maxActive;
}
