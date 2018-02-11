package edu.avoodoo.stock.maket.simu.model.exchange;

import lombok.Getter;

@Getter
public enum Status {

	Active("ACTIVE"), Inactive("INACTIVE");
	
	private String name;

	Status(String name) {
		this.name = name;
	}

}
