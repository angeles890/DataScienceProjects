USE [QuantAnalysis]
GO

/****** Object:  StoredProcedure [dbo].[sp_getRequiredTrades_NASDAQ100]    Script Date: 6/30/2020 1:31:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[sp_getRequiredTrades_InternationalChamps]
(
	@positionValue money, 
	@fkStrategyID int = 5
)
As
Begin
	/****** Script for SelectTopNRows command from SSMS  ******/
	;with cte_one as 
	(
	 SELECT Top 3
		   [ticker]
		  ,[createDate]
		  ,[closePrice]
		  ,[yearHigh]
		  ,[percentFromHigh]
		  ,[sixMonthReturn]
		  ,[momentum]
		  ,[fkPortfolioStrategyID]
	  FROM [QuantAnalysis].[dbo].[vw_tblStockPerformance]
	  Where fkPortfolioStrategyID = @fkStrategyID
	  Order by momentum desc
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
		Select ticker, 'action' = 'Add Position' from cte_one a where not exists(select 1 from fattailinvestorweb.dbo.vw_tblPositions zz where zz.fkStrategyID = @fkStrategyID and zz.ticker = a.ticker)
		union all
		Select ticker, 'action' = 'Close Position' from fattailinvestorweb.dbo.vw_tblPositions a where a.fkStrategyID = @fkStrategyID AND not exists(Select 1 from cte_one zz where zz.ticker = a.ticker)
	) aa
	inner join [QuantAnalysis].[dbo].[vw_tblStockPerformance] bb
	on aa.ticker = bb.ticker
	Where bb.fkPortfolioStrategyID =@fkStrategyID
	Order by [action],bb.momentum desc, ticker asc
end
GO


