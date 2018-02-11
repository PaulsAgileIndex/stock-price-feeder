# stock-price-feeder


## Motivation
Create a price feed adapter for an index calculator which act on a stock market simulation.


## Situation
This repository contains two sides of the process of price feeding to an application. 
The stock market application [stock-market-simu](https://github.com/PaulsAgileIndex/stock-price-feeder/tree/master/stock-market-simu) 
simulates securities from A1 to Z100. Where A1 to Z100 depicts the 
 [security identification](http://www.ksvali.com/2009/02/security-ids-symbol-cusip-isin-sedol-ric-code/) 
 (Valor/ISIN/CUSIP/SEDOL) on an easy way. The price feed adapter [price-feed-adapter](https://github.com/PaulsAgileIndex/stock-price-feeder/tree/master/price-feed-adapter) 
knows the same set of security identification A1 to Z100. And feeds to an [Apache Kafka](https://kafka.apache.org/) event-driven 
backbone.


- Dockerized [stock-market-simu](https://github.com/PaulsAgileIndex/stock-price-feeder/tree/master/stock-market-simu) 
  application (SpringBoot, etc.)

- Dockerized [price-feed-adapter](https://github.com/PaulsAgileIndex/stock-price-feeder/tree/master/price-feed-adapter) 
  application (SpringBoot, etc.)


## Feedback

Please feel free to ask me any question or to give me some feedback.


## Work Assignment
Have fun...!