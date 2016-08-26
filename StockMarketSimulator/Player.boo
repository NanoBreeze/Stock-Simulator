namespace StockMarketSimulator

import System

class Player:
"""Description of Player"""

	[Property(Portfolio)]
	_portfolio = {Ticker.AAPL: 5}
	
	[Property(Money)]
	_money = 0
	
	public def constructor():
		pass

