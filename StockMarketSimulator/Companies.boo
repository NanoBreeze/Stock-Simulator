namespace StockMarketSimulator

import System

class Apple(Company):
"""Description of Apple"""
	
	public def constructor(marketCap as double,
					   sharePrice as double, dividend as double, beta as double):
					   	
		super(Ticker.AAPL, marketCap, sharePrice, dividend, beta)
		
class Microsoft(Company):
"""Description of Microsoft"""
	public def constructor(marketCap as double, sharePrice as double, 
							dividend as double, beta as double):
						   	
			super(Ticker.MSFT, marketCap, sharePrice, dividend, beta)
			
class Google(Company):
"""Description of Google"""
	public def constructor(marketCap as double, sharePrice as double,
							dividend as double, beta as double):
						   	
			super(Ticker.GOOGL, marketCap, sharePrice, dividend, beta)
			
class JPMorgan(Company):
"""Description of JPMorgan"""
	public def constructor(marketCap as double, sharePrice as double, 
							dividend as double, beta as double):
						   	
			super(Ticker.JPM, marketCap, sharePrice, dividend, beta)
			
class WellsFargo(Company):
"""Description of WellsFargo"""
	public def constructor(marketCap as double, sharePrice as double, 
							dividend as double, beta as double):
						   	
			super(Ticker.WFC, marketCap, sharePrice, dividend, beta)	

class Citigroup(Company):
"""Description of Citigroup"""
	public def constructor(marketCap as double, sharePrice as double, 
							dividend as double, beta as double):
						   	
			super(Ticker.C, marketCap, sharePrice, dividend, beta)	
			
class GeneralMotors(Company):
"""Descriptiong of GM"""
	public def constructor(marketCap as double, sharePrice as double, 
						dividend as double, beta as double):
					   	
		super(Ticker.GM, marketCap, sharePrice, dividend, beta)	

class Chrysler(Company):
"""Descriptiong of Chrysler"""
	public def constructor(marketCap as double, sharePrice as double, 
						dividend as double, beta as double):
					   	
		super(Ticker.FCAU, marketCap, sharePrice, dividend, beta)	
		
class Ford(Company):
"""Descriptiong of Ford"""
	public def constructor(marketCap as double, sharePrice as double, 
						dividend as double, beta as double):
					   	
		super(Ticker.F, marketCap, sharePrice, dividend, beta)	