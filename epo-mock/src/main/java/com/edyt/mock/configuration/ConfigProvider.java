package com.edyt.mock.configuration;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.web.context.WebApplicationContext;

import java.util.Properties;

/**
 * Created by przemekd on 29.03.16.
 */
@Configuration
public class ConfigProvider {

    private Logger logger = Logger.getLogger(ConfigProvider.class);

    @javax.annotation.Resource(name = "teampatentProperties")
    private Properties properties;

    @Bean(name = "teampatentProperties")
    public PropertiesFactoryBean loadApplicationProperties(ApplicationContext applicationContext) {
        Resource propertiesResource = null;
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();

        String teampatentProperties = System.getProperty("teampatent.application.properties");
        String propertiesDirectory = System.getProperty("teampatent.application.properties.directory");
        if (teampatentProperties != null) {
            propertiesResource = new FileSystemResource(teampatentProperties);
        } else if (propertiesDirectory != null && applicationContext instanceof WebApplicationContext) {
            //this mechanism is used on test environment where each gerrit deploy has its own property file
            WebApplicationContext webApplicationContext = (WebApplicationContext) applicationContext;
            String applicationName = webApplicationContext.getApplicationName();
            if ("/".equals(applicationName) || "".equals(applicationName)) {
                applicationName = "/ROOT";
            }
            String propertiesLocation = propertiesDirectory + applicationName + ".properties";
            logger.info("Trying to load properties from " + propertiesLocation);
            propertiesResource = new FileSystemResource(propertiesLocation);

        }

        if (null == propertiesResource || !propertiesResource.exists()){
            logger.warn("No configuration given! Trying to load defaults!");
            propertiesResource = new ClassPathResource("application.properties");
        }

        propertiesFactoryBean.setLocation(propertiesResource);
        return propertiesFactoryBean;
    }
}
