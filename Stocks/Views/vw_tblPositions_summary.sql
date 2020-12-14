Alter view vw_tblPositions_summary
As
Select 
	exit_year,
	exit_quarter,
	exit_month,
	strategy_name,
	sum(PL) as 'monthly_pl'
From 
(
	Select 
		Year(exitDate) as 'exit_year',
		case 
			when MONTH(exitDate) between 1 and 3 then 'Q1'
			when MONTH(exitDate) between 4 and 6 then 'Q2'
			when MONTH(exitDate) between 7 and 9 then 'Q2'
			when MONTH(exitDate) between 10 and 12 then 'Q4'
		end as 'exit_quarter',
		EOMONTH(exitDate) 'exit_month',
		PL, 
		strategy_name
	From vw_tblPositionsClosed
) as a
Group by exit_year,exit_quarter, exit_month, strategy_name

