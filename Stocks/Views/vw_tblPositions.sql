Alter view vw_tblPositions
as 
with cte_one as
(
	Select * 
	From tblStockPrice 
	where isActive = 1
)
Select 
	a.pkPositionID, 
	a.fkPortfolioID, 
	a.fkStrategyID, 
	a.createdBy,
	rtrim(ltrim(a.ticker)) as 'ticker', 
	a.entryPrice, 
	a.entryDate, 
	a.shareCount, 
	isnull(b.closePrice,a.entryPrice) as 'closePrice', 
	isnull(b.lastModifiedDate,a.entryDate) as 'lastModifiedDate', 
	'pct_pl' = ((isnull(b.closePrice,a.entryPrice)/a.entryPrice)-1)*100, 
	a.isDelete
From tblPositions a
left join cte_one b
on a.ticker = b.ticker
where a.exitDate is null
