alter procedure sp_getRequiredTrades_NASDAQ100
(
	@positionValue money
)
As
Begin
	/****** Script for SelectTopNRows command from SSMS  ******/
	;with cte_one as 
	(
	 SELECT Top 10
		  a.[ticker],
		  a.[createDate],
		  a.[closePrice],
		  a.[yearHigh],
		  a.[percentFromHigh],
		  a.[sixMonthReturn],
		  a.[momentum],
		  a.[fkPortfolioStrategyID]
	  FROM [QuantAnalysis].[dbo].[vw_tblStockPerformance] a
	  inner join tblNASDQ100 b
	  on a.ticker = b.HoldingsTicker
	  Where a.fkPortfolioStrategyID = 1 and a.ticker not in (Select ticker from tblStockPerformance where fkPortfolioStrategyID in (5,1005))
	  Order by a.momentum desc
	)
	Select 
		aa.ticker, 
		aa.action, 
		bb.momentum, 
		bb.percentFromHigh, 
		bb.sixMonthReturn, 
		'shareCount' = round(@positionValue/bb.closePrice,0), 
		bb.closePrice
	From 
	(
		Select ticker, 'action' = 'Add Position' from cte_one a where not exists(select 1 from fattailinvestorweb.dbo.vw_tblPositions zz where zz.fkStrategyID = 1 and zz.ticker = a.ticker)
		union all
		Select ticker, 'action' = 'Close Position' from fattailinvestorweb.dbo.vw_tblPositions a where a.fkStrategyID = 1 AND not exists(Select 1 from cte_one zz where zz.ticker = a.ticker)
	) aa
	inner join [QuantAnalysis].[dbo].[vw_tblStockPerformance] bb
	on aa.ticker = bb.ticker
	Order by [action], momentum desc
end