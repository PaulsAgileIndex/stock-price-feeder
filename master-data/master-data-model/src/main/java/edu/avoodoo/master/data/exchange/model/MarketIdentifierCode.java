package edu.avoodoo.master.data.exchange.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Locale;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

import lombok.Data;

/**
 * Market Identifier Codes (MIC, ISO 10383)
 * Based on http://www.iotafinance.com/en/ISO-10383-Market-Identification-Codes-MIC.html
 * @author frank
 *
 */
@Data
@SuppressWarnings("serial")
@XmlAccessorType(XmlAccessType.FIELD)
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
		
}
