Alter procedure sp_getRequiredTrades_SmallCap
(
	@positionValue money
)
As
Begin
	;with cte_one as 
	(
		Select top 9 
			a.ticker, 
			a.closePrice, 
			a.momentum, 
			a.percentFromHigh, 
			a.sixMonthReturn
		From vw_tblStockPerformance a
		where a.fkPortfolioStrategyID = 2005
		--and historicalVolatility > hv_median
		Order by momentum desc
	)
	Select 
		a.ticker, 
		a.action, 
		a.shareCount, 
		a.closePrice, 
		b.momentum, 
		b.percentFromHigh, 
		b.sixMonthReturn
	From 
	(
		Select buy.ticker, buy.closePrice,'shareCount' = round(@positionValue/buy.closePrice,0), 'Add Position' as 'action' from cte_one as buy where not exists(Select 1 From fattailinvestorweb.dbo.vw_tblPositions as zz where buy.ticker = zz.ticker)	
	
		union 

		Select sell.ticker, sell.closePrice,'shareCount' = cast(null as int), 'Close Position' as 'action' From fattailinvestorweb.dbo.vw_tblPositions as sell WHERE not exists(Select 1 From cte_one zz where sell.ticker = zz.ticker) And sell.fkStrategyID =  2005
	) as a
	inner join vw_tblStockPerformance b
	on a.ticker = b.ticker
	order by a.[action] desc, b.momentum desc, a.ticker asc



End