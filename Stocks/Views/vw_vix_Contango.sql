use [fattailinvestorweb]
go

Create view vw_vix_Contango as
/**
	When difference between (F2-F1)-(F7-F4) is positive invest in SVXY, else VXX
**/
with cte_one as 
(
	Select 
		a.trade_date, 
		b.expDate, 
		a.closePrice, 
		'daysToExp' = DATEDIFF(dd,trade_date,expDate)
	From tblFuturesPrice a
	inner join tblFuturesExpirationDate b
	on a.futures = b.futures
	where b.Instrument = 'VIX'
	and trade_date between '2019-12-01' AND DATEADD(dd,-1,getdate())
),
cte_two as
(
	Select *, 'rnk' = DENSE_RANK()Over(partition by trade_date order by daysToExp asc)
	From cte_one
)
,
cte_three as 
(
	Select  
		*, 
		'F1_F2' = (pvt.[2] - pvt.[1])/pvt.[1], 
		'F4_F7' = (pvt.[7] - pvt.[4])/pvt.[4]
	From 
	(
		Select trade_date, rnk, closePrice From cte_two where rnk in (1,2,4,7)
	) as src
	Pivot 
	(
		max(closePrice) for rnk in ([1],[2],[4],[7])
	) as pvt
)
Select trade_date,'yield_dif' = F1_F2 -  F4_F7
From cte_three


