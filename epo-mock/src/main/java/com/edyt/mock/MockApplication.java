package com.edyt.mock;

import com.edyt.mock.filters.HeaderLoggingFilter;
import com.edyt.mock.filters.TrailingBackslashFilter;
import com.edyt.mock.xmlmapper.StandOffXmlMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.DispatcherServletAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Locale;

@SpringBootApplication
public class MockApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication.run(MockApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(final SpringApplicationBuilder builder) {
        return builder.sources(MockApplication.class);
    }

    @Override
    public void onStartup(final ServletContext servletContext) throws ServletException {
        Locale.setDefault(Locale.ENGLISH);
        FilterRegistration.Dynamic trailingBackslashFilter = servletContext.addFilter("trailingBackslashFilter", TrailingBackslashFilter.class);
        trailingBackslashFilter.addMappingForUrlPatterns(null, false, "/*");

        FilterRegistration.Dynamic headersLoggingFilter = servletContext.addFilter("headerLoggingFilter", HeaderLoggingFilter.class);
        headersLoggingFilter.addMappingForUrlPatterns(null, false, "/*");

        super.onStartup(servletContext);

        ServletRegistration.Dynamic registration = (ServletRegistration.Dynamic) servletContext.getServletRegistration(DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_BEAN_NAME);
        registration.setLoadOnStartup(1);
        registration.addMapping("/*");
    }

    @Bean
    public Jackson2ObjectMapperBuilder overrideDefaultXmlMapper(){
        return new Jackson2ObjectMapperBuilder(){
            private boolean createXmlMapper;

            @Override
            public Jackson2ObjectMapperBuilder createXmlMapper(boolean createXmlMapper) {
                this.createXmlMapper = createXmlMapper;
                return super.createXmlMapper(createXmlMapper);
            }

            @Override
            public <T extends ObjectMapper> T build() {
                ObjectMapper objectMapper;
                if (createXmlMapper){
                    objectMapper = new StandOffXmlMapper();
                    configure(objectMapper);
                    return (T) objectMapper;
                }
                return super.build();
            }
        };
    }

    @Bean
    public StandardServletMultipartResolver getMultipartResolver() {
        return new StandardServletMultipartResolver() {
            @Override
            public boolean isMultipart(HttpServletRequest req) {
                String method = req.getMethod().toLowerCase(Locale.getDefault());
                if (!Arrays.asList("put", "post").contains(method)) {
                    return false;
                }
                String contentType = req.getContentType();
                return (contentType != null &&contentType.toLowerCase(Locale.getDefault()).startsWith("multipart/"));
            }
        };
    }
}
