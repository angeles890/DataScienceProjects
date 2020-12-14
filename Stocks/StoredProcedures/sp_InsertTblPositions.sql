Alter procedure sp_InsertTblPositions
(
	@fkPortfolioID as int,
	@fkStrategyID as int,
	@ticker as varchar(10),
	@entryDate as date,
	@entryPrice as money,
	@shareCount as decimal (6,2), 
	@fkUserID nvarchar(450)
)
As
Begin
	If not exists(Select 1 From tblStocks where ticker = @ticker)
	Begin
		Insert into tblStocks(ticker) Values (@ticker)
	End

	if not exists(Select 1 From tblStockPortfolioStrategy where ticker = @ticker AND fkStrategyID = @fkStrategyID)
	Begin
		Insert into tblStockPortfolioStrategy(ticker,fkStrategyID)
		values(@ticker,@fkStrategyID)
	end

	Insert into tblPositions (fkPortfolioID,fkStrategyID,ticker,entryDate,entryPrice,shareCount,CreatedBy, lastmodifiedBy)
	values(@fkPortfolioID,@fkStrategyID,@ticker,@entryDate,@entryPrice,@shareCount,@fkUserID, @fkUserID)

End


