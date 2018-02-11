package edu.avoodoo.stock.maket.simu.serice;

import java.math.BigDecimal;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class PriceFeeder {

	private final RestTemplate restTemplate;
	
	public PriceFeeder(RestTemplateBuilder builder) {
		this.restTemplate = builder.build();
	}
	
	public ResponseEntity<Boolean> feedPrice(BigDecimal price) {
		return restTemplate.getForEntity("", Boolean.class);
	}
	
}
