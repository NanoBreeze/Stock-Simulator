namespace StockMarketSimulator

import System
import Boo.Lang.Compiler
import Boo.Lang.Compiler.Ast

class IntegerExtensions:
"""Property extensions for integers"""

	[Extension]
	static shares[integer as int]:
		get:
			return integer
	
	[Extension]
	static points[integer as int]:
		get:
			return integer

	[Extension]
	static percent[integer as int]:
		get:
			return integer * -1
			

class DoubleExtensions:
"""Property extensions for doubles"""
	
	[Extension]
	static points[d as double]:
		get:
			return d

	[Extension]
	static percent[d as double]:
		get:
			return d * -1

	
	
	
macro introspect:
"""Prints info about player"""
    
    investor = introspect.Arguments[0]
    
    codeblock = [| 
    	block:
    		Console.WriteLine()
    		
    		Console.ForegroundColor = ConsoleColor.Green
    		Console.WriteLine(String(char('='), 40))
    		
    		Console.ForegroundColor = ConsoleColor.Cyan
    		Console.WriteLine("{0}Investor", String(char(' '), 17))
    		
    		
    		Console.ForegroundColor = ConsoleColor.Green
    		Console.WriteLine(String(char('='), 40))
    		
    		Console.ForegroundColor = ConsoleColor.White
    		Console.WriteLine("Balance: {0}", $investor.Balance)
    		Console.ForegroundColor = ConsoleColor.White
    		
    		Console.WriteLine()
    		
    		Console.WriteLine("==========")
    		Console.WriteLine("Portfolio")
    		Console.WriteLine("==========")    		
    		for item in investor.Portfolio:
    			Console.WriteLine()
    			
    			previousShareCount = (item.Value as (int))[0]
    			currentShareCount = (item.Value as (int))[1]
    			
    			diff = currentShareCount - previousShareCount
    			    				
    			if currentShareCount > previousShareCount:
    				Console.ForegroundColor = ConsoleColor.Green
    				Console.WriteLine("{0, -10}{1, -15}", item.Key, currentShareCount + " (+" + diff + ")")
    			elif currentShareCount < previousShareCount:
    				Console.ForegroundColor = ConsoleColor.Red
    				Console.WriteLine("{0, -10}{1, -15}", item.Key, currentShareCount + " (" + diff + ")")		
    			else:
    				Console.ForegroundColor = ConsoleColor.Yellow
    				Console.WriteLine("{0, -10} : {1, -15} ", item.Key, currentShareCount)
    						    				
    			Console.ForegroundColor = ConsoleColor.White 		
    		Console.WriteLine()
    |].Body #exit macro statement
    return codeblock
    
macro update:
"""Prints info about every company"""
    
    companies = update.Arguments[0]
    
    codeblock = [| 
    	block:
    		Console.WriteLine()
  
    		Console.ForegroundColor = ConsoleColor.Green
    		Console.WriteLine(String(char('='), 65))
    		
    		Console.ForegroundColor = ConsoleColor.Cyan
    		Console.WriteLine("{0}Market", String(char(' '), 28))
    		
    		
    		Console.ForegroundColor = ConsoleColor.Green
    		Console.WriteLine(String(char('='), 65))
    		

    		Console.ForegroundColor = ConsoleColor.Cyan
    		Console.WriteLine("{0, -10}{1, -15}{2, -25}{3, -15}{4, -15} ", "Ticker", "Share price", "Market Cap", "Dividend", "Beta")
    		
    		Console.ForegroundColor = ConsoleColor.White
    		for comp in companies:
    			company = cast(Company, comp)
    			
    			Console.ForegroundColor = ConsoleColor.White
    			Console.Write("{0, -10}", company.Ticker)
    			
    			Console.Write("{0, -15}", company.SharePrice + differenceString(company.getSharePriceDifference))
    			Console.Write("{0, -25}", company.MarketCap + differenceString(company.getMarketCapDifference)) 
    			Console.Write("{0, -15}", company.Dividend + differenceString(company.getDividendDifference))     				
    			Console.Write("{0, -15}", company.Beta + differenceString(company.getBetaDifference))
    			
    			Console.ForegroundColor = ConsoleColor.White
    			Console.WriteLine()
    				
    
    |].Body #exit macro statement
    return codeblock
    
def differenceString(block as callable) as string:
	difference = cast(double, block())
	
	if difference > 0:
		Console.ForegroundColor = ConsoleColor.Green
		return " (+" + difference.ToString() + ")"
	elif difference < 0:
		Console.ForegroundColor = ConsoleColor.Red
		return " (" + difference.ToString() + ")"
	else:
		Console.ForegroundColor = ConsoleColor.Yellow	
		return ""
