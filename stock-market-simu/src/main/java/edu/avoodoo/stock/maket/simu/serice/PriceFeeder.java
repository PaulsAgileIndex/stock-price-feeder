package edu.avoodoo.stock.maket.simu.serice;

import java.math.BigDecimal;

import javax.inject.Inject;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import edu.avoodoo.master.data.exchange.client.MarketIdentifierCodeRestClient;

@Service
@Configuration
@ComponentScan("edu.avoodoo.master.data.exchange.client")
public class PriceFeeder {

	@Inject
	private MarketIdentifierCodeRestClient micService;
	
//	@Inject
//	private RestTemplate restTemplate;
	
//	public PriceFeeder(RestTemplateBuilder builder) {
//		this.restTemplate = builder.build();
//	}
	
	public ResponseEntity<Boolean> feedPrice(BigDecimal price) {
		
		System.out.println(micService.getAllMic());
		
//		return restTemplate.getForEntity("", Boolean.class);
		return null;
	}
	
}
