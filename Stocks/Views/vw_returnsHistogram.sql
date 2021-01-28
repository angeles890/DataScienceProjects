Alter view vw_returnsHistogram
as

Select 
	floor([PL%]/.075)*.075 as 'bucket_floor', 
	count(*) as 'cnt'
From vw_tblPositionsClosed
group by floor([PL%]/.075)*.075
--DESKTOP-E4GJV84\SQLEXPRESS



