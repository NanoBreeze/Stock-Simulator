namespace StockMarketSimulator

import System

import StockMarketSimulator.IntegerExtensions
import StockMarketSimulator.DoubleExtensions
import System.Collections
import Boo.Lang
import Boo.Lang.Extensions



investor = Investor()
round = 0


def buy(company as Company, shareCount as int):
	#Because player.Portfolio[company.Ticker] += shareCount isn't valid
	
	investor.buy(company.Ticker, company.SharePrice, shareCount)
	

def sell(company as Company, shareCount as int):
	
	investor.sell(company.Ticker, company.SharePrice, shareCount)


def increase_share_price(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = amount * -1/100 + 1
		company.SharePrice *= change
	#points
	else:
		company.SharePrice += amount

	
	
def decrease_share_price(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = 1 + amount / 100  #remember amount is negative and so we +
		company.SharePrice *= change
	#points
	else:
		company.SharePrice -= amount


def increase_dividend(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = amount * -1/100 + 1
		company.Dividend *= change
	#points
	else:
		company.Dividend += amount

	
	
def decrease_dividend(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = 1 + amount / 100  #remember amount is negative and so we +
		company.Dividend *= change
	#points
	else:
		company.Dividend -= amount
		
def increase_beta(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = amount * -1/100 + 1
		company.Beta *= change
	#points
	else:
		company.Beta += amount

	
	
def decrease_beta(company as Company, amount as double):
/*Increase the share price of the specified company. Although the amount is specified for double, it accepts integers too because of implicit cast
	If the amount is negative, the increase is a percentage. 
	If it's positive, the increase is by points*/
	
	#percentage
	if amount < 0:
		change = 1 + amount / 100  #remember amount is negative and so we +
		company.Beta *= change
	#points
	else:
		company.Beta -= amount
		


/*Tasks are schedulers.

task "Name":
	execute:
		[action] unless [action]
	starting_when:
		when:
			...

task "Name":
	every [number] rounds	
	when [boolean]:
		[callable action to do]
	when [boolean]:
		[stop callable action]
		
*/


/*
when AAPL.SharePrice > 100:
	decrease_share_price AAPL, 5.6.points
*/

def when(condition as bool, block as callable):
	if condition:
		block()

//syntactic sugar, same as when(...)
def starting_when(condition as bool, block as callable):
	when(condition, block)
	
def execute(block as callable):
	pass

def task(description as string, block as callable):
	block()


AAPL 	= Apple		(576000, 106.94, 2.11, 1.38)
MSFT 	= Microsoft	(455000, 58.03, 2.48, 1.26)
GOOGL 	= Google	(545000, 793.22, 0, 1.06)

JPM 	= JPMorgan	(239150, 66.22, 2.91, 1.17)
WFC 	= WellsFargo(244760, 48.51, 3.14, 0.90)
C 		= Citigroup	(136870, 47.11, 0.66, 1.50)

GM 		= GeneralMotors	(492500, 31.53, 4.82, 1.65)
FCAU 	= Chrysler	(887000, 6.88, 0, 1.33)
F		= Ford		(500900, 12.38, 5.81, 1.21)

companies	= [AAPL, MSFT, GOOGL, JPM, WFC, C, GM, FCAU, F] #not DRY
tech 		= [AAPL, MSFT, GOOGL]
finance 	= [JPM, WFC, C]
automobile 	= [GM, FCAU, F]

Console.WindowHeight = Console.LargestWindowHeight
Console.WindowWidth = Console.LargestWindowWidth/2



execute:
	increase_share_price AAPL, 5.6.points unless AAPL.SharePrice > 5

#sell AAPL, 20.shares
#
#print AAPL.MarketCap



#when AAPL.SharePrice > 100:
#	increase_share_price AAPL, 5.6.points
	


#buy AAPL, 33.shares
#print AAPL.MarketCap



update companies

introspect investor



print "Press any key to continue . . . "
Console.ReadKey(true)
