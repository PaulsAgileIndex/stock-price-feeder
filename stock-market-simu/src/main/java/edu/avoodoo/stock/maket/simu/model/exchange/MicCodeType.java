package edu.avoodoo.stock.maket.simu.model.exchange;

import lombok.Getter;

@Getter
public enum MicCodeType {
	
	O("Operational MIC"), S("Market segment MIC");
	
	private String description;

	MicCodeType(String description) {
		this.description = description;
	}


}
