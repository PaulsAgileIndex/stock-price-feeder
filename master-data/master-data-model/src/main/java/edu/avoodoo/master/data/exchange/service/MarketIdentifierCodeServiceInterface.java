package edu.avoodoo.master.data.exchange.service;

import java.util.Map;

import edu.avoodoo.master.data.exchange.model.MarketIdentifierCode;

public interface MarketIdentifierCodeServiceInterface {

	Map<String, MarketIdentifierCode> getAllMic();

	MarketIdentifierCode getMicByCode(String micCode);

}