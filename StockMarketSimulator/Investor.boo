namespace StockMarketSimulator

import System

class Investor:
"""Description of Investor"""

	[Getter(Portfolio)]
	#the value is an array. First element is the current value, zeroth element is the previous value.
	_portfolio as Hash
	
	
	[Property(Balance)]
	_balance as double
	
	public def constructor():
		_portfolio = {Ticker.AAPL: (0, 5)} 
		_balance = 99999
		
		
	public def updatePortfolio(ticker as Ticker, newShareCount as int):
		(_portfolio[ticker] as (int))[0] = (_portfolio[ticker] as (int))[1]
		(_portfolio[ticker] as (int))[1] += newShareCount
		


