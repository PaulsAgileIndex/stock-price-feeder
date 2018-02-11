package edu.avoodoo.stock.maket.simu;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import edu.avoodoo.stock.maket.simu.model.StockPrice;
import edu.avoodoo.stock.maket.simu.model.exchange.MarketIdentifierCode;

/**
 * SpringBoot main class. Just run this application with
 * context menu: Run As -> JavaApplication.
 * 
 * 
 * @author Frank Sprich (a|voodoo)
 */
@SpringBootApplication
public class StockMarketSimuApp {
	
	public static void main(String[] args) {
		SpringApplication.run(StockMarketSimuApp.class, args);
		StockPrice st = new StockPrice(new BigDecimal("100.00"), "EUR", MarketIdentifierCode.getMic("XSWX"), LocalDateTime.now());
		System.out.println(st.getCurrency() +" " +st.getAmount());
		System.out.println(st.getExchange());
	}
	
}
