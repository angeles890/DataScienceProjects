Alter procedure sp_UPDATEFatTailInvestorDB
As
Begin
	
	--First get all new stocks, insert into tblStocks in fattailinvestor
	Insert into [fattailinvestorweb].[dbo].[tblStocks] (ticker)
	Select a.* 
	From 
	(
		Select ticker 
		From [QuantAnalysis].[dbo].[tblStockPerformance]
		Except 
		Select ticker
		From [fattailinvestorweb].[dbo].[tblStocks]
	) a

	Update a 
	set 
		a.isActive = 0
	From [fattailinvestorweb].[dbo].[tblStockPrice] a

	Insert into [fattailinvestorweb].[dbo].[tblStockPrice] (ticker,closePrice,isActive)
	Select Distinct
		ticker, 
		closePrice, 
		1 as 'isActive'
	From [QuantAnalysis].[dbo].[vw_tblStockPerformance]

End