alter view vw_tblStocks
As
Select 
	a.ticker, 
	'fkStrategyID' = replace(replace(c.result,'<x>',''),'</x>','')
From [fattailinvestorweb].[dbo].[tblStockPortfolioStrategy] a
inner join [fattailinvestorweb].[dbo].[tblStocks] b
on a.ticker = b.ticker
cross apply
(
	Select cast(c.fkStrategyID as varchar(4)) + ';' 'x'
	From
	(
		Select fkStrategyID, ticker 
		From [fattailinvestorweb].[dbo].[tblStockPortfolioStrategy] c
		where c.ticker = a.ticker
	) c
	order by c.fkStrategyID
	for xml path('')
	
) c (result)
Where b.isActive = 1