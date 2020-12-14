Alter procedure sp_InsertStockStrategy
(
	@ticker varchar(10), 
	@fkStrategyID int
)
As
Begin

	If not exists(Select 1 From tblStocks where ticker = @ticker)
	Begin
		Insert into [tblStocks] (ticker)
		Values(@ticker)
	End

	Insert Into tblStockPortfolioStrategy(ticker,fkStrategyID)
	values(@ticker,@fkStrategyID)

End