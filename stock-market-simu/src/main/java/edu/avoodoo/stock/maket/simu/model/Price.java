package edu.avoodoo.stock.maket.simu.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Currency;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuppressWarnings("serial")
public abstract class Price implements Serializable {
	
	private BigDecimal amount;
    private Currency currency;

}
