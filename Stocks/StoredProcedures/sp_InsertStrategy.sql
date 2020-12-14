Alter procedure sp_InsertStrategy
(
	@name varchar(50), 
	@description varchar(300), 
	@fkUser nvarchar(450), 
	@fkFrequencyID int 
)
As
Begin

	If not exists(Select 1 From tblPortfolioStrategy where [Name] = @name)
	Begin
		Insert into [tblPortfolioStrategy] ([Name],[Description],createdBy,createDate,fkFrequencyID) 
		Values(@name,@description,@fkuser,getdate(),@fkFrequencyID)
	End
End