namespace StockMarketSimulator

import System

class Microsoft(Company):
"""Description of Microsoft"""
	public def constructor(marketCap as double, sharePrice as double, 
							dividend as double, beta as double):
						   	
			super(Ticker.MSFT, marketCap, sharePrice, dividend, beta)

