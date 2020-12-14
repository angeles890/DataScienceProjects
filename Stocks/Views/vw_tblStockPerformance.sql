Alter view vw_tblStockPerformance
As
with cte_one as
(
	Select Distinct
		ticker, 
		cast(createDate as date) as 'createDate', 
		closePrice, 
		yearHigh, 
		percentFromHigh, 
		'sixMonthReturn' = sixMonthReturn -1, 
		historicalVolatility,
		'hv_median' = PERCENTILE_CONT(0.5) within group (order by historicalVolatility) over (partition by fkPortfolioStrategyID),
		'momentum' = (.85*percentFromHigh)+(.15*(sixMonthReturn-1)),
		fkPortfolioStrategyID
	From tblStockPerformance
	where cast(createDate as date) = (Select max(cast(createDate as date)) From tblStockPerformance)
)
Select Distinct
	a.ticker, 
	a.createDate,
	a.closePrice,
	a.yearHigh,
	a.percentFromHigh, 
	a.sixMonthReturn,
	a.momentum,
	a.historicalVolatility,
	a.hv_median,
	a.fkPortfolioStrategyID, 
	b.Name as 'Strategy'
From cte_one a 
inner join [fattailinvestorweb].dbo.[tblPortfolioStrategy] b
on a.fkPortfolioStrategyID = b.pkStrategyID
