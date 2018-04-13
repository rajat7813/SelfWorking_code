package com.sopra.Config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;


/**
 * Defining beans using annotations.
 *
 * @author nipandey
 *
 */

@Configuration
@EnableWebMvc
@ComponentScan("com.sopra")
//@EnableTransactionManagement
//@EnableJms
//@PropertySource("classpath:wal-service.properties")
public class AppConfig {
	
/*	@Bean
    public ViewResolver viewResolver() {
		
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

	*/
	
	/*

  *//** The wal properties. *//*
  @Autowired
  private WalProperties walProperties;

  *//** The runtime engine. *//*
  private RuntimeEngine runtimeEngine = null;

  *//**
   * Property file reader.
   *
   * @return the property file reader
   *//*
  @Bean
  public PropertyFileReader propertyFileReader() {
    return new PropertyFileReader();
  }


  *//**
   * Response validator.
   *
   * @return the response validator
   *//*
  @Bean
  public ResponseValidator responseValidator() {
    return new ResponseValidator();
  }

  *//**
   * Rest template.
   *
   * @return the rest template
   *//*
  @Bean
  public RestTemplate restTemplate() {
    return new RestTemplate();
  }

  *//**
   * Kie session.
   *
   * @return the kie session
   * @throws MalformedURLException the malformed URL exception
   *//*
  @Bean
  public KieSession kieSession() throws MalformedURLException {
    return runtimeEngine().getKieSession();
  }

  *//**
   * Task service.
   *
   * @return the task service
   * @throws MalformedURLException the malformed URL exception
   *//*
  @Bean
  public TaskService taskService() throws MalformedURLException {
    return runtimeEngine().getTaskService();
  }

  *//**
   * Runtime engine.
   *
   * @return the runtime engine
   * @throws MalformedURLException the malformed URL exception
   *//*
  @Bean
  public RuntimeEngine runtimeEngine() throws MalformedURLException {
    URL url = new URL(walProperties.getKieServerUrl());
    if (runtimeEngine == null) {
      runtimeEngine = RemoteRuntimeEngineFactory.newRestBuilder().addUrl(url).addTimeout(5)
          .addDeploymentId(walProperties.getKieDeploymentId())
          .addUserName(walProperties.getKieUsername())
          .addPassword(walProperties.getKiePassword()).build();
    }
    return runtimeEngine;
  }

  *//**
   * Connection factory.
   *
   * @return the active MQ connection factory
   *//*
  @Bean
  public ActiveMQConnectionFactory connectionFactory() {
    ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory();
    connectionFactory.setBrokerURL(walProperties.getJmsDefaultBrokerUrl());
    connectionFactory.setTrustAllPackages(true);
    connectionFactory.setUserName(walProperties.getActiveMqUserName());
    connectionFactory.setPassword(walProperties.getActiveMqPassword());
    return connectionFactory;
  }

  *//**
   * Jms listener container factory.
   *
   * @return the default jms listener container factory
   *//*
  @Bean
  public DefaultJmsListenerContainerFactory jmsListenerContainerFactory() {
    DefaultJmsListenerContainerFactory factory = new DefaultJmsListenerContainerFactory();
    factory.setConnectionFactory(connectionFactory());
    factory.setConcurrency("1-10");
    return factory;
  }

 
  @Bean
  public JmsTemplate jmsTemplateWalQueue() {
    JmsTemplate template = new JmsTemplate();
    template.setConnectionFactory(connectionFactory());
    template.setDefaultDestinationName(walProperties.getWalQueueName());
    template.setExplicitQosEnabled(true);
    template.setDeliveryMode(DeliveryMode.PERSISTENT);
    return template;
  }
  
  @Bean
  public JmsTemplate jmsTemplateCaseSampleRequestQueue() {
    JmsTemplate template = new JmsTemplate();
    template.setConnectionFactory(connectionFactory());
    template.setDefaultDestinationName(walProperties.getCaseSampleRequestQueueName());
    template.setExplicitQosEnabled(true);
    template.setDeliveryMode(DeliveryMode.PERSISTENT);
    return template;
  }
  
  @Bean
  public JmsTemplate jmsTemplateCaseSampleResponseQueue() {
    JmsTemplate template = new JmsTemplate();
    template.setConnectionFactory(connectionFactory());
    template.setDefaultDestinationName(walProperties.getCaseSampleResponseQueueName());
    template.setExplicitQosEnabled(true);
    template.setDeliveryMode(DeliveryMode.PERSISTENT);
    return template;
  }

  *//**
   * Object mapper.
   *
   * @return the object mapper
   *//*
  @Bean
  public ObjectMapper objectMapper() {
    ObjectMapper mapper = new ObjectMapper();
    mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    mapper.configure(MapperFeature.DEFAULT_VIEW_INCLUSION, true);
    return mapper;
  }

  *//**
   * Bean mapper.
   *
   * @return the dozer bean mapper
   *//*
  @Bean
  public DozerBeanMapper beanMapper() {
    DozerBeanMapper dozerBeanMapper = new DozerBeanMapper();
    return dozerBeanMapper;
  }

*/}
