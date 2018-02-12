package edu.avoodoo.master.data.exchange.client;

import java.net.URI;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import edu.avoodoo.master.data.exchange.model.MarketIdentifierCode;
import edu.avoodoo.master.data.exchange.service.MarketIdentifierCodeRestUri;
import edu.avoodoo.master.data.exchange.service.MarketIdentifierCodeServiceInterface;

@Service
@Component

public class MarketIdentifierCodeRestClient implements MarketIdentifierCodeServiceInterface {

	@Value("${master.data.exchange.rs}")
	private String rootUri;
	
	
	private RestTemplate restTemplate;

	
	public MarketIdentifierCodeRestClient(RestTemplateBuilder restTemplateBuilder) {
		this.restTemplate = restTemplateBuilder.build();
	}
	
	@Override
	public Map<String, MarketIdentifierCode> getAllMic() {
		/*
		 *  https://stackoverflow.com/questions/24208828/resttemplate-getforobject-map-responsetype
		 */
		RequestEntity<Void> request = RequestEntity.get(URI.create(rootUri + MarketIdentifierCodeRestUri.ALL_MIC_URL)).accept(MediaType.APPLICATION_JSON).build();
		ResponseEntity<Map<String, MarketIdentifierCode>> response = restTemplate.exchange(request, new ParameterizedTypeReference<Map<String, MarketIdentifierCode>>() {});
		
		return response.getBody();
	}

	@Override
	public MarketIdentifierCode getMicByCode(String micCode) {
		RequestEntity<Void> request = RequestEntity.get(URI.create(rootUri + MarketIdentifierCodeRestUri.MIC_BY_CODE_URL)).accept(MediaType.APPLICATION_JSON).build();
		ResponseEntity<MarketIdentifierCode> response = restTemplate.exchange(request, MarketIdentifierCode.class);
		
		return response.getBody();
	}

}
