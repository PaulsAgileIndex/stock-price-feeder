package edu.avoodoo.stock.maket.simu.model.exchange;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import lombok.Data;

/**
 * Market Identifier Codes (MIC, ISO 10383)
 * Based on http://www.iotafinance.com/en/ISO-10383-Market-Identification-Codes-MIC.html
 * @author frank
 *
 */
@Data
@SuppressWarnings("serial")
public class MarketIdentifierCode implements Serializable {

	private String micCode;
	private String market;
	private String operatingMic;
	private String acronym;
	private Locale country;
	private String city;
	private Status status;
	private MicCodeType codeType;
	private LocalDate creationDate;
	private LocalDate lastChange;
	private String website;
	private String comment;
		
	private static ConcurrentMap<String, MarketIdentifierCode> cache = new ConcurrentHashMap<>();
	
	static {
		MarketIdentifierCode mic = new MarketIdentifierCode();
		mic.setMicCode("XSWX");
		mic.setMarket("SIX Swiss Exchange");
		mic.setCountry(new Locale("de", "CH"));
		mic.setCity("Zurich");
		mic.setStatus(Status.Active);
		mic.setCreationDate(null);
		mic.setAcronym("SIX");
		
		cache.putIfAbsent("XSWX", mic);
		
	}
	
	public static MarketIdentifierCode getMic(String micCode) {
		return cache.get(micCode);
	}
	
	public static void put(String micCode, MarketIdentifierCode marketIdentifierCode) {
		cache.putIfAbsent(micCode, marketIdentifierCode);
	}

}
