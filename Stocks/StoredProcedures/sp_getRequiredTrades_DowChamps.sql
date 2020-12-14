alter procedure sp_getRequiredTrades_DowChamps
(
	@positionSize money
)
As
Begin 
	with cte_one as 
	(
		Select Distinct Top 3 
			a.ticker, 
			--a.[action],
			a.momentum, 
			a.percentFromHigh, 
			a.sixMonthReturn, 
			'sharecount' = round(@positionSize/a.closePrice,0),
			a.closePrice
		From vw_tblStockPerformance a
		where a.fkPortfolioStrategyID = 1005
		and historicalVolatility >= hv_median
		Order by a.momentum desc
	)
	Select 
		a.*
	From 
	(
		Select x.ticker, 'Add Position' as 'action',x.momentum, x.percentFromHigh, x.sixMonthReturn, x.sharecount, x.closePrice From cte_one x where not exists(Select 1 From fattailinvestorweb.dbo.vw_tblPositions aa where x.ticker = aa.ticker)
		union	
		Select x.ticker, 'Close Position' as 'action', null , null, null, null, null From fattailinvestorweb.dbo.vw_tblPositions x where not exists (Select 1 From cte_one aa where x.ticker = aa.ticker) and x.fkStrategyID = 1005
	) as a
	Order by a.[action], a.momentum desc, a.ticker asc
End