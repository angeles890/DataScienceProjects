alter view vw_tblPortfolioStrategy 
As
Select 
	a.*, 
	b.title as 'frequency', 
	c.openPositions
From tblPortfolioStrategy as a
inner join tblLookup_strategyFrequency as b
on a.fkFrequencyID = b.pkFrequencyID
cross apply
(
	Select count(*) as 'openPositions'
	From tblPositions zz
	where zz.fkStrategyID = a.pkStrategyID
	and zz.exitDate is null
) as c