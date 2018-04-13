package org.epo.configuration;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.epo.exception.ResponseValidator;
import org.epo.service.PropertyFileReaderService;
import org.epo.service.impl.PropertyFileReaderServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Defining beans using annotations.
 *
 * @author manokuma
 *
 */
@Configuration
@EnableWebMvc
@EnableSwagger2
@PropertySource("classpath:cms-stub-service.properties")
public class AppConfig extends WebMvcConfigurerAdapter{

	@Value("${db.driver}")
	private String dbDriver;
	
	@Value("${db.url}")
	private String dbUrl;
	
	@Value("${db.username}")
	private String dbUsername;
	
	@Value("${db.password}")
	private String dbPassword;
	
	@Bean
	public PropertyFileReaderService propertyFileReaderService() {
		return new PropertyFileReaderServiceImpl();
	}

	@Bean
	public ResponseValidator responseValidator() {
		return new ResponseValidator();
	}	
      
	private DataSource getDataSource()
    {
        DriverManagerDataSource ds = new DriverManagerDataSource();        
        ds.setDriverClassName(dbDriver);
        ds.setUrl(dbUrl);
        ds.setUsername(dbUsername);
        ds.setPassword(dbPassword);        
        return ds;
    }
	
	@Bean
	public Connection getJNDIConnection() {
		Connection result = null;
		try {
			DataSource datasource = getDataSource();
			if (datasource != null) {
				result = datasource.getConnection();
			} else {
				System.out.println("Failed to lookup datasource.");
			}
		} catch (SQLException ex) {
			System.out.println("Cannot get connection: " + ex);
		}
		return result;
	}

/*	@Bean
	public Connection getJNDIConnection() {
		String DATASOURCE_CONTEXT = "java:jboss/datasources/EDFSMSSQLDS";
		Connection result = null;
		try {
			Context initialContext = new InitialContext();
			DataSource datasource = (DataSource) initialContext.lookup(DATASOURCE_CONTEXT);
			if (datasource != null) {
				result = datasource.getConnection();
			} else {
				System.out.println("Failed to lookup datasource.");
			}
		} catch (NamingException ex) {
			System.out.println("Cannot get connection: " + ex);
		} catch (SQLException ex) {
			System.out.println("Cannot get connection: " + ex);
		}
		return result;
	}*/
	
    @Bean
    public Docket newsApi() {
        return new Docket(DocumentationType.SWAGGER_2)
				.useDefaultResponseMessages(false)
				.groupName("CMS Stub")
				.apiInfo(this.apiInfo())
				.select()
				.apis(RequestHandlerSelectors.basePackage("org.epo.controller"))
				.paths(PathSelectors.ant("/BeInformed/dossierDetailsInsert"))
				.build();
    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("swagger-ui.html")
	      .addResourceLocations("classpath:/META-INF/resources/");
	 
	    registry.addResourceHandler("/webjars/**")
	      .addResourceLocations("classpath:/META-INF/resources/webjars/");
	}
	
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
				.title("CMS Stub Swagger")
				.description("CMS Stub Swagger")
				.version(this.getClass().getPackage().getImplementationVersion())
				.build();
    }

}
