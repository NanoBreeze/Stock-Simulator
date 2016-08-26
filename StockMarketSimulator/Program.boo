namespace StockMarketSimulator

import System

import System.Collections
import Boo.Lang
import Boo.Lang.Extensions
import Boo.Lang.Compiler
import Boo.Lang.Compiler.Ast
import StockMarketSimulator.IntegerExtensions
import StockMarketSimulator.DoubleExtensions




player = Player()

def buy(company as Company, shareCount as int):
	#Because player.Portfolio[company.Ticker] += shareCount isn't valid
	
	updatedShareCount = cast(int, player.Portfolio[company.Ticker]) + shareCount
	
	player.Portfolio[company.Ticker] = updatedShareCount
	print player.Portfolio[company.Ticker]

def increase(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = amount * -1/100 + 1
		company.SharePrice *= change
	else:
		company.SharePrice += amount

	print company.SharePrice
	
	
def decrease(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = 1 + amount / 100  #remember amount is negative and so we +
		company.SharePrice *= change
	else:
		company.SharePrice -= amount

	print company.SharePrice

AAPL = Apple(Ticker.AAPL, 200, 107, 1.3, 1.5)




buy AAPL, 20.shares

print AAPL.MarketCap
decrease AAPL, 5.6.points
print AAPL.MarketCap

#print player.Portfolio


















#
#
#def hi(a as string, b as string):
#	print a
#	print b
#	
#hi "Lenny", "Cheng"
#
#macro Unroll2:
#	# extract the second parameter value
#	end = cast(IntegerLiteralExpression, Unroll2.Arguments[1]).Value
#
#	for i in range(end):
#		# create assignment statement, using the block:
#		# trick and add it to
#		# the output
#		statement = [|
#			block:
#				$(Unroll2.Arguments[0]) = $i
#		|].Body
#		
#		yield statement
#		# add the original contents of the macro
#		# to the output
#		yield Unroll2.Body
#
#
#Unroll2 i, 5:
#	print i
#
##macro declaration
#macro should_fail:
#    #create code using Quasi Quotation ( ”[|" and "|]“ )
#    codeblock = [| 
#    	print "Hello"
##         raise AssertionError("failed by request")
#    |] #exit macro statement
#    return codeblock #now replace ”should_fail” with ”raise AssertionError() ”

#client code

#should_fail #throws AssertionError














#macro Unroll2:
#	end = cast(IntegerLiteralExpression, Unroll2.Arguments[1]).Value
#	
#	for i in range(end):
#		statement = [|
#			block:
#				$(Unroll2.Arguments[0]) = $i
#			|].Body
#			yield statement
#			
#			yield Unroll2.Body


#a = ArrayList()
#a.Add("oijosidjf")
#print a.Length


#
#[Extension]
#static EUR(abc as double}:
# 	get:
# 		return abc


#verify 5 is not null

#[Extension]
#static EUR[value as double]:
#	get:
#		return value * 1

// TODO: Implement Functionality Here

print "Press any key to continue . . . "
Console.ReadKey(true)
