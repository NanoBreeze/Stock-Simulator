namespace StockMarketSimulator

import System

class Investor:
"""Description of Investor"""

	[Getter(Portfolio)]
	#the value is an array. First element is the current value, zeroth element is the previous value.
	_portfolio as Hash
	
	
	[Getter(Balance)]
	_balance as double
	
	[Getter(PreviousBalance)]
	_previousBalance as double
	
	public def constructor():
		_portfolio = {
			Ticker.AAPL: (0, 0),
			Ticker.MSFT: (0, 0),
			Ticker.GOOGL:(0, 0),
			Ticker.JPM:	 (0, 0),
			Ticker.WFC:	 (0, 0),
			Ticker.C:	 (0, 0),
			Ticker.GM:	 (0, 0),
			Ticker.FCAU: (0, 0),
			Ticker.F:	 (0, 0)
		}
		
		_balance = 99999
		
		
	public def buy(ticker as Ticker, sharePrice as double, shareCount as int):
		(_portfolio[ticker] as (int))[0] = (_portfolio[ticker] as (int))[1]
		(_portfolio[ticker] as (int))[1] += shareCount
		
		_previousBalance = _balance
		_balance -= sharePrice * shareCount

	public def sell(ticker as Ticker, sharePrice as double, shareCount as int):
		(_portfolio[ticker] as (int))[0] = (_portfolio[ticker] as (int))[1]
		(_portfolio[ticker] as (int))[1] -= shareCount
		
		_previousBalance = _balance
		_balance += sharePrice * shareCount
		
	public def getBalanceDifference():
		return Math.Round(_balance - _previousBalance, 2)
		


