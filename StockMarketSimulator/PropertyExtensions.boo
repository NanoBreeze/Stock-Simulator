namespace StockMarketSimulator

import System

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

