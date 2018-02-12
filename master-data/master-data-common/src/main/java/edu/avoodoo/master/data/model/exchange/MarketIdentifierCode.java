package edu.avoodoo.master.data.model.exchange;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Locale;
import java.util.Map;
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
	private MicStatus status;
	private MicCodeType codeType;
	private LocalDate creationDate;
	private LocalDate lastChange;
	private String website;
	private String comment;
		
	private static ConcurrentMap<String, MarketIdentifierCode> cache = new ConcurrentHashMap<>();
	
	static {
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
	
	public static Map<String, MarketIdentifierCode> getAllMic() {
		return cache;
	}
	
	public static MarketIdentifierCode getMicByCode(String micCode) {
		return cache.get(micCode);
	}
	
	public static void put(String micCode, MarketIdentifierCode mic) {
		cache.putIfAbsent(micCode, mic);
	}

}
