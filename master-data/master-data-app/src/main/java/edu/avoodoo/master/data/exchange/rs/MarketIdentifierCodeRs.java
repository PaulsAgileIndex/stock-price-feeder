package edu.avoodoo.master.data.exchange.rs;

import java.util.Map;

import javax.inject.Inject;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.avoodoo.master.data.exchange.model.MarketIdentifierCode;
import edu.avoodoo.master.data.exchange.service.MarketIdentifierCodeServiceInterface;

//import edu.avoodoo.master.data.model.exchange.MarketIdentifierCode;

/**
 * Controller / Resource which handles request from REST clients.
 * 
 * @author Frank Sprich (a|voodoo)
 */
@RestController
public class MarketIdentifierCodeRs {
	
	private static final Logger LOG = Logger.getLogger(MarketIdentifierCodeRs.class);

	@Inject
	MarketIdentifierCodeServiceInterface c;
	
	@RequestMapping(method = RequestMethod.GET, path = "/master/data/getAllMic")
	public Map<String, MarketIdentifierCode> getAllMic() {
		if (null != c) {
			return c.getAllMic();
		}
		return null;
	}
	
	@RequestMapping(method = RequestMethod.GET, path = "/master/data/getMicByCode")
	public MarketIdentifierCode getMicByCode(@PathParam("micCode")String micCode) {
		return c.getMicByCode(micCode);
	}
		
	@RequestMapping(method = RequestMethod.GET, path = "/master/data/isalive")
	public Response isAlive() {
		LOG.info("ALL OK!");
		return Response.ok(true).build();
	}

}
