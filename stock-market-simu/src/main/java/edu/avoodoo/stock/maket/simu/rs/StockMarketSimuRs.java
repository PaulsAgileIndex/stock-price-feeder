package edu.avoodoo.stock.maket.simu.rs;

import javax.inject.Inject;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.avoodoo.stock.maket.simu.serice.PriceFeeder;

/**
 * Controller / Resource which handles request from REST clients.
 * 
 * @author Frank Sprich (a|voodoo)
 */
@RestController
public class StockMarketSimuRs {
	
	private static final Logger LOG = Logger.getLogger(StockMarketSimuRs.class);
	
	@Inject
	private PriceFeeder priceFeer;

	@RequestMapping(method = RequestMethod.GET, path = "/stock/market/simu/isalive")
	public Response isAlive() {
		LOG.info("ALL OK!");
		priceFeer.feedPrice(null);
		return Response.ok(true).build();
	}

}
