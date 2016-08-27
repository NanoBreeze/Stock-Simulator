namespace StockMarketSimulator

import System

import StockMarketSimulator.IntegerExtensions
import StockMarketSimulator.DoubleExtensions
import System.Collections
import Boo.Lang
import Boo.Lang.Extensions



investor = Investor()
round = 0
random = Random()
tasks = []



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


def buy(company as Company, shareCount as int):
	#Because player.Portfolio[company.Ticker] += shareCount isn't valid
	
	investor.buy(company.Ticker, company.SharePrice, shareCount)
	

def sell(company as Company, shareCount as int):
	
	investor.sell(company.Ticker, company.SharePrice, shareCount)



def create_bubble(list as List):
	for c in list:
		cast(Company, c).SharePrice *= 1 + random.NextDouble()
		
	
def create_recession():
	for company in companies:
		cast(Company, company).SharePrice *= random.NextDouble()


/*Tasks are schedulers.

task "Name":
	execute:
		[action] unless [action]
	starting_when:
		[boolean]

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

#syntactic sugar, identical to when
def starting_when(condition as bool, block as callable):
	if condition:
		block()
		return true
	
def repeat_every(roundCount as int, block as callable):
	unless round % roundCount == 0 :
		return false
	block()

def task(description as string, block as callable):
	block()




Console.WindowHeight = Console.LargestWindowHeight
Console.WindowWidth = Console.LargestWindowWidth/2


#task "Decrease share price":
#		starting_when round == 0:
#			repeat_every 5:
#				decrease_share_price AAPL, 5.6.points if AAPL.SharePrice < 90


#sell AAPL, 20.shares
#
#print AAPL.MarketCap



#when AAPL.SharePrice > 100:
#	increase_share_price AAPL, 5.6.points
	


#buy AAPL, 33.shares
#print AAPL.MarketCap

while true:
	Console.Clear()
	val = random.Next() % 30
	
	if val < 15:
		buy companies[random.Next() % 9], random.Next()%20.shares
	else:
		sell companies[random.Next() % 9], random.Next()%20.shares
	
	if val == 29:
		create_bubble finance
	elif val == 28:
		create_bubble automobile
	elif val == 27:
		create_bubble tech
	elif val == 26:
		create_recession
		
	if val % 4 == 0 :
		cast(Company, companies[random.Next() % 9]).decrease_share_price(random.NextDouble().percent)
	if val%5==0:
		cast(Company, companies[random.Next() % 9]).increase_share_price(random.NextDouble().percent)
	if val%8 == 0:
		cast(Company, companies[random.Next() % 9]).increase_beta(random.NextDouble().points)
	if val%10 == 0:
		cast(Company, companies[random.Next() % 9]).decrease_beta(random.NextDouble().points)
	if val% 12 == 0:
		cast(Company, companies[random.Next() % 9]).increase_dividend(random.NextDouble().percent)
	if val% 13 == 0:
		cast(Company, companies[random.Next() % 9]).decrease_dividend(random.NextDouble().percent)
		
	cast(Company, companies[random.Next() % 9]).increase_beta(random.NextDouble().points).increase_share_price(random.NextDouble().percent).increase_dividend(random.NextDouble().percent)
	
	cast(Company, companies[random.Next() % 9]).decrease_beta(random.NextDouble().points).decrease_share_price(random.NextDouble().percent).decrease_dividend(random.NextDouble().percent)
	
	update companies
	introspect investor

	print "Press any key to continue . . . "
	Console.ReadKey(true)
	



