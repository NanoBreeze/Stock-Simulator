namespace StockMarketSimulator

import System
import System.Collections



macro should_fail:
    #create code using Quasi Quotation ( ”[|" and "|]“ )
    codeblock = [| 
    	print "Hello"
#         raise AssertionError("failed by request")
    |] #exit macro statement
    return codeblock #now replace ”should_fail” with ”raise AssertionError() ”


class Class1:
"""Description of Class1"""

	[Property(Hey)]
	_hey as Ticker
		
	[Extension]
	static Length[list as IList]:
		get:
			return list.Count

