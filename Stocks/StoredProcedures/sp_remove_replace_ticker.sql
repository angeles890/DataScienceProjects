alter procedure sp_remove_replace_ticker
(
	 @tickerRemove  as varchar(10), 
	 @tickerAdd as varchar(10) = null
)
As
Begin

	If (Select count(*) From tblStockPortfolioStrategy where ticker = @tickerRemove) = 1
	Begin
		Declare @fkStrategyID int
		Set @fkStrategyID = (Select fkStrategyID From tblStockPortfolioStrategy where ticker = @tickerRemove)

		Delete
		From tblStockPortfolioStrategy
		where ticker = @tickerRemove

		Delete 
		From tblStockPrice
		where ticker = @tickerRemove

		Update a 
		set
			a.isActive = 1
		From tblStocks a
		where a.ticker = @tickerRemove

		if @tickerAdd is not null
		Begin
			Insert into tblStocks(ticker)
			Values(@tickerAdd)

			Insert Into tblStockPortfolioStrategy(ticker,fkStrategyID)
			Values(@tickerAdd ,@fkStrategyID)
		End

	End

End




