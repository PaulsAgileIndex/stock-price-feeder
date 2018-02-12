package edu.avoodoo.master.data.exchange.model;

import lombok.Getter;

@Getter
public enum MicCodeType {
	
	Operational("Operational MIC"), Segment("Market segment MIC");
	
	private String description;

	MicCodeType(String description) {
		this.description = description;
	}


}
