Alter procedure sp_closePosition
(
	@ticker varchar(10), 
	@exitPrice money, 
	@exitDate date, 
	@lastModifiedBy nvarchar(450), 
	@pkPositionId int
)
As
Begin
	Update a 
	set
		a.exitDate = @exitDate, 
		a.exitPrice = @exitPrice, 
		a.lastModifiedBy = @lastModifiedBy, 
		a.lastModifiedDate = GETDATE()
	From tblPositions a
	where a.ticker = @ticker 
	and a.pkPositionID = @pkPositionID
End