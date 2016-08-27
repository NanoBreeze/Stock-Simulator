namespace StockMarketSimulator

import System



enum Ticker:
	AAPL
	MSFT
	GOOGL
	JPM
	WFC
	C
	GM
	FCAU
	F
	


class Company:
""" Inherited fields and methods for companies"""
		
	[Getter(Ticker)]
	_ticker as Ticker
	
	SharePrice as double:
		get:
			return Math.Round(_sharePrice, 2)
		set:
			_previousSharePrice = _sharePrice
			_previousMarketCap = _marketCap
			
			_sharePrice = value
			_marketCap *= (_sharePrice / _previousSharePrice) //assumes # of shares always remains constant
			
	_sharePrice as double
	
	[Getter(PreviousSharePrice)]
	_previousSharePrice as double

	
	#in millions
	MarketCap as double:
		get:
			return Math.Round(_marketCap, 2)
			
	_marketCap as double
	_previousMarketCap as double
	
	
	
	Dividend as double:
		get:
			return Math.Round(_dividend, 2)
		set:
			
			#not sure how to pass ints by reference to methods
			_previousDividend = _dividend
			_dividend = value

	_dividend as double
	

	_previousDividend as double
	
	Beta as double:
		get:
			return Math.Round(_beta, 2)
		set:
			
			#not sure how to pass ints by reference to methods
			_previousBeta = _beta
			_beta = value

	_beta as double
	

	_previousBeta as double
	
	
	public def constructor(ticker as Ticker, marketCap as double,
					   sharePrice as double, dividend as double, beta as double):
		_ticker = ticker
		
		_marketCap = marketCap
		_previousMarketCap = marketCap
		
		_sharePrice = sharePrice
		_previousSharePrice = sharePrice
		
		_dividend = dividend
		_previousDividend = dividend
		
		_beta = beta
		_previousBeta = _beta
	
	public def getSharePriceDifference() as double:
		return Math.Round(_sharePrice - _previousSharePrice, 2)
		
	public def getMarketCapDifference() as double:
		return Math.Round(_marketCap - _previousMarketCap, 2)
		
	public def getDividendDifference() as double:
		return Math.Round(_dividend - _previousDividend, 2)
		
	public def getBetaDifference() as double:
		return Math.Round(_beta - _previousBeta, 2)


	
	def increase_share_price(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = amount * -1/100 + 1
			SharePrice *= change
		#points
		else:
			SharePrice += amount
	
		return self
		
		
	def decrease_share_price(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = 1 + amount / 100  #remember amount is negative and so we +
			SharePrice *= change
		#points
		else:
			SharePrice -= amount
	
		return self
	
	def increase_dividend(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = amount * -1/100 + 1
			Dividend *= change
		#points
		else:
			Dividend += amount
	
		return self
		
		
	def decrease_dividend(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = 1 + amount / 100  #remember amount is negative and so we +
			Dividend *= change
		#points
		else:
			Dividend -= amount
			
		return self
			
	def increase_beta(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = amount * -1/100 + 1
			Beta *= change
		#points
		else:
			Beta += amount
	
		return self
		
		
	def decrease_beta(amount as double):
	/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
		If the amount is negative, the increase is a percentage. 
		If it's positive, the increase is by points*/
		
		#percentage
		if amount < 0:
			change = 1 + amount / 100  #remember amount is negative and so we +
			Beta *= change
		#points
		else:
			Beta -= amount
			
		return self
