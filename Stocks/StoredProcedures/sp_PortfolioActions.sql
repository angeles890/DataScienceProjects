Create procedure sp_PortfolioActions
As
Begin
	;with cte_one as
	(
		Select Top 10 a.*
		From QuantAnalysis.dbo.vw_tblStockPerformance a
		where a.fkPortfolioStrategyID = 1 
		and a.ticker not in (Select Distinct Ticker From QuantAnalysis.dbo.vw_tblStockPerformance where fkPortfolioStrategyID = 5)
		Order by a.momentum desc
	)
	Select a.ticker, a.percentFromHigh, a.sixMonthReturn, a.momentum,'Add' as 'tradeAction'
	From cte_one a
	where not exists(Select 1 From fattailinvestorweb.dbo.tblPositions zz where zz.ticker = a.ticker)
	Union
	Select c.ticker,0,0, 0, 'Sell' as 'tradeAction'
	From fattailinvestorweb.dbo.tblPositions c
	inner join fattailinvestorweb.dbo.tblStockPortfolioStrategy d
	on c.ticker = d.ticker
	where c.ticker not in (Select ticker From cte_one)
	AND d.fkStrategyID = 1 and c.exitDate is null
	Order by tradeAction, momentum





End