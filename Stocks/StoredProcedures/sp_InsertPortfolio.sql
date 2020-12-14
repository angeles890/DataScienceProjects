Alter procedure sp_InsertPortfolio
(
	@name varchar(100), 
	@description varchar(300), 
	@createdBy nvarchar(450)
)
As
Begin
	--Insert New Portfolio only if item does not already exists for user
	If not exists(Select 1 From tblPortfolio where [Name] = @name AND CreatedBy = @createdBy)
	Begin
		Insert into tblPortfolio([Name],[Description],CreatedBy)
		Values(@name,@description,@createdBy)		
	End	
End