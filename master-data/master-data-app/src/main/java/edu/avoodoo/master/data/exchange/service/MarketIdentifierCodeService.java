package edu.avoodoo.master.data.exchange.service;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import edu.avoodoo.master.data.exchange.model.MarketIdentifierCode;
import edu.avoodoo.master.data.exchange.model.MicCodeType;
import edu.avoodoo.master.data.exchange.model.MicStatus;

/**
 * Load the master data from a data store.
 * 
 * @author frank
 *
 */
@Service
public class MarketIdentifierCodeService implements MarketIdentifierCodeServiceInterface {

	private static ConcurrentMap<String, MarketIdentifierCode> cache = new ConcurrentHashMap<>();
	
	@PostConstruct
	public void init() {
		MarketIdentifierCode mic = new MarketIdentifierCode();
		mic.setMicCode("XSWX");
		mic.setOperatingMic("XSWX");
		mic.setMarket("SIX Swiss Exchange");
		mic.setCountry(new Locale("de", "CH"));
		mic.setCity("Zurich");
		mic.setStatus(MicStatus.Active);
		mic.setCreationDate(null);
		mic.setAcronym("SIX");
		mic.setCodeType(MicCodeType.Operational);
		mic.setWebsite("http://www.six-swiss-exchange.com/index.html");
		mic.setComment("Mid/small cap equity, funds, ETFs, bond segment");
		
		cache.putIfAbsent("XSWX", mic);		
	}
	
	/* (non-Javadoc)
	 * @see edu.avoodoo.master.data.exchange.service.MarketIdentifierCodeServiceInterface#getAllMic()
	 */
	@Override
	public Map<String, MarketIdentifierCode> getAllMic() {
		TreeMap<String, MarketIdentifierCode> map = new TreeMap<>();
		map.putAll(cache);
		return cache;
	}
	
	/* (non-Javadoc)
	 * @see edu.avoodoo.master.data.exchange.service.MarketIdentifierCodeServiceInterface#getMicByCode(java.lang.String)
	 */
	@Override
	public MarketIdentifierCode getMicByCode(String micCode) {
		return cache.get(micCode);
	}
		
}
