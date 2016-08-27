namespace StockMarketSimulator

import System

class Google(Company):
"""Description of Google"""
	public def constructor(marketCap as double, sharePrice as double,
							dividend as double, beta as double):
						   	
			super(Ticker.GOOGL, marketCap, sharePrice, dividend, beta)

