package edu.avoodoo.master.data.model.exchange;

import lombok.Getter;

@Getter
public enum MicStatus {

	Active("ACTIVE"), Inactive("INACTIVE");
	
	private String name;

	MicStatus(String name) {
		this.name = name;
	}

}
