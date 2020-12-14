use fattailinvestorweb
Go
Alter view vw_tblPositionsClosed
as
SELECT 
	b.Name as 'strategy_name',
	a.ticker, 
	a.entryDate, 
	a.exitDate, 
	'daysInTrade' = DATEDIFF(dd,a.entryDate,a.exitDate), 
	a.entryPrice, 
	a.exitPrice,
	'PL' = cast((a.exitPrice - a.entryPrice)*a.shareCount as money),
	'PL%' = ((a.exitPrice/a.entryPrice)-1)
FROM [fattailinvestorweb].[dbo].[tblPositions] as a
inner join tblPortfolioStrategy as b
on a.fkStrategyID = b.pkStrategyID
where a.fkStrategyID in (1,5,1005,3,2005,3005)
and a.exitPrice is not null
