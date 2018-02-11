package edu.avoodoo.stock.maket.simu.rs;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller / Resource which handles request from REST clients.
 * 
 * @author Frank Sprich (a|voodoo)
 */
@RestController
public class StockMarketSimuRs {
	
	private static final Logger LOG = Logger.getLogger(StockMarketSimuRs.class);

	@RequestMapping(method = RequestMethod.GET, path = "/stock/market/simu/isalive")
	public Response isAlive() {
		LOG.info("ALL OK!");
		return Response.ok(true).build();
	}

}
