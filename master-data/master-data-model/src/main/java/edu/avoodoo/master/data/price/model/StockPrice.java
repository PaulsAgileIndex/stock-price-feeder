package edu.avoodoo.master.data.price.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Currency;
import java.util.Locale;

import edu.avoodoo.master.data.exchange.model.MarketIdentifierCode;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
@SuppressWarnings("serial")
public class StockPrice extends Price {

	private MarketIdentifierCode exchange;
	private LocalDateTime timeStamp;
	
	public StockPrice() {
		// default
	}
	
	public StockPrice(BigDecimal amount, String currencyCode, MarketIdentifierCode exchange, LocalDateTime timeStamp) {
		super(amount, Currency.getInstance(currencyCode));
		this.exchange = exchange;
		this.timeStamp = timeStamp;
	}
	
	public StockPrice(BigDecimal amount, Currency currency, MarketIdentifierCode exchange, LocalDateTime timeStamp) {
		super(amount, currency);
		this.exchange = exchange;
		this.timeStamp = timeStamp;
	}
	
	public StockPrice(BigDecimal amount, Locale currencyLocale, MarketIdentifierCode exchange, LocalDateTime timeStamp) {
		super(amount, Currency.getInstance(currencyLocale));
		this.exchange = exchange;
		this.timeStamp = timeStamp;
	}
	
}
