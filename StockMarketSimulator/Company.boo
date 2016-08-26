namespace StockMarketSimulator

import System


enum Ticker:
	AAPL
	MSFT
	GOOGL
	

class Company:
""" Inherited fields and methods for companies"""
	
	
	SharePrice as double:
		get:
			return _sharePrice
		set:
			initialSharePrice = _sharePrice
			_sharePrice = value

			_marketCap *= (_sharePrice / initialSharePrice) //assumes # of shares always remains constant
			
	_sharePrice as double
	
	[Getter(Ticker)]
	_ticker as Ticker
	
	[Property(MarketCap)]
	_marketCap as double
	
	[Property(Dividend)]
	_dividend as double
	
	[Property(Beta)]
	_beta as double
	
	public def constructor(ticker as Ticker, marketCap as double,
					   sharePrice as double, dividend as double, beta as double):
		_ticker = ticker
		_marketCap = marketCap
		_sharePrice = sharePrice
		_dividend = dividend
		_beta = beta
		
	
