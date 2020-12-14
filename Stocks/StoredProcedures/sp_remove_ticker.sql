
alter procedure sp_remove_ticker
(
	@ticker as varchar(200)
)
As
Begin
	--Convert comma seperated string to temp table
	Declare @tmpvar as varchar(1000)
	set @tmpvar = 'Select ticker = ''' + replace(@ticker,',', ''' UNION ALL SELECT ''' )  + ''''

	create table #tmp (ticker varchar(5))
	Insert into #tmp
	exec(@tmpvar)

	Delete a
	From tblStockPortfolioStrategy a
	inner join #tmp b
	on a.ticker = b.ticker

	Delete a
	From tblStockPrice a
	inner join #tmp b
	on a.ticker = b.ticker

	Delete a
	From tblStocks a
	inner join #tmp b
	on a.ticker = b.ticker
end