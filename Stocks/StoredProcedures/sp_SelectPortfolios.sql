Alter Procedure sp_SelectPortfolios
(
	@fkuserID nvarchar(450)
)
As
Begin
	if not exists(Select 1 From tblPortfolio where CreatedBy = @fkuserID)
	Begin
		execute sp_InsertPortfolio @name = 'General', @description = 'General portfolio, catch all', @createdBy = @fkuserID
	end

	Select 
		pkPortfolioID, 
		[Name], 
		isnull([description],'Add Description...') as 'description'
	From tblPortfolio
	Where CreatedBy = @fkuserID
	Order by [Name] asc
End


