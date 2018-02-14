package edu.avoodoo.stock.maket.simu;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;


/**
 * SpringBoot main class. Just run this application with
 * context menu: Run As -> JavaApplication.
 * 
 * 
 * @author Frank Sprich (a|voodoo)
 */
@SpringBootApplication
public class StockMarketSimuApp {
	
	public static void main(String[] args) {
		SpringApplication.run(StockMarketSimuApp.class, args);
	}
	
	/*
	 *  https://spring.io/guides/gs/consuming-rest/
	 */
//	@Bean
//	public RestTemplate restTemplate(RestTemplateBuilder builder) {
//		return builder.build();
//	}
//
//	@Bean
//	public CommandLineRunner run(RestTemplate restTemplate) throws Exception {
//		return args -> {
//			Quote quote = restTemplate.getForObject(
//					"http://gturnquist-quoters.cfapps.io/api/random", Quote.class);
//			log.info(quote.toString());
//		};
//	}
	
}
