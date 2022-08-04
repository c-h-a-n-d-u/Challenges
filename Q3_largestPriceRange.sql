DELIMITER $$
create procedure Q3_largestPriceRange()
begin
	create temporary table t1 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_', 
		max(abs(`open`-`close`)) as 'R_range'
		from sample_dataset3
		group by Date
		order by R_range desc;

	create temporary table t2 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_2', 
		max(high) as MaxHigh from sample_dataset3
		where Date in (select Date from t1)
		group by Date;

	create temporary table t3 as
		select STR_TO_DATE(`Date`,'%m/%d/%Y') as Date_,
		STR_TO_DATE(`Time`,'%H%i') as Time_max, max(high) as m from sample_dataset3
		where high in (select MaxHigh from t2)
		group by Date_;

	select * from t1;
	select * from t2;
	select * from t3;

	select t3.Date_,t3.Time_max, t1.R_range
	from t3
	inner join t1
	on t3.Date_= t1.Date_;
end $$ 
DELIMITER ;
drop procedure Q3_largestPriceRange;
drop temporary table t1;
drop temporary table t2;
drop temporary table t3;