namespace StockMarketSimulator

import System


enum Ticker:
	AAPL
	MSFT
	GOOGL
	

class Company:
""" Inherited fields and methods for companies"""
	
	[Property(Ticker)]
	_ticker as Ticker
	
	[Property(MarketCap)]
	_marketCap as double
	
	[Property(SharePrice)]
	_sharePrice as double
	
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
		
	
