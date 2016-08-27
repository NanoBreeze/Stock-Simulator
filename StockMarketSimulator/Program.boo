namespace StockMarketSimulator

import System

import StockMarketSimulator.IntegerExtensions
import StockMarketSimulator.DoubleExtensions
import System.Collections
import Boo.Lang
import Boo.Lang.Extensions



investor = Investor()


def buy(company as Company, shareCount as int):
	#Because player.Portfolio[company.Ticker] += shareCount isn't valid
	
	investor.updatePortfolio(company.Ticker, shareCount)
	

def sell(company as Company, shareCount as int):
	#Because player.Portfolio[company.Ticker] += shareCount isn't valid
	
	shareCount *= -1
	investor.updatePortfolio(company.Ticker, shareCount)


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

AAPL = Apple(576000, 106.94, 2.11, 1.38)
MSFT = Microsoft(455000, 58.03, 2.48, 1.26)
GOOGL = Google(545000, 793.22, 0, 1.06)

companies = [AAPL, MSFT, GOOGL]


#sell AAPL, 20.shares
#
#print AAPL.MarketCap
decrease AAPL, 5.6.points
buy AAPL, 33.shares
#print AAPL.MarketCap



update companies

introspect investor



print "Press any key to continue . . . "
Console.ReadKey(true)
