package edu.avoodoo.master.data.exchange.model;

import lombok.Getter;

@Getter
public enum MicStatus {

	Active("ACTIVE"), Inactive("INACTIVE");
	
	private String name;

	MicStatus(String name) {
		this.name = name;
	}

}
