namespace StockMarketSimulator

import System

class Task:
	
	[Getter(Action)]
	_block as callable
	
	[Property(Description)]
	_description as string
	

	public def constructor(description as string, block as callable):
		_block = block
		_description = description



