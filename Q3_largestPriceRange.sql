use challenges;
select * from sample_dataset3;

delimiter $$
create procedure q3()
begin
	create temporary table t1 as
		select str_to_date(`Date`,'%m/%d/%Y') as `Date_`,
			str_to_date(`Time`,'%H%i') as `Time_`,
			max(abs(`Open`-`Close`)) as `Range_`
		from sample_dataset3
        group by `Date_`
        order by Range_ desc;
        
	create temporary table t2 as
		select str_to_date(`Date`,'%m/%d/%Y') as `Date_`,
			str_to_date(`Time`,'%H%i') as `Time_`,
			max(`High`) as `maxHigh_`
			from sample_dataset3
			where `Date_` in (select `Date_` from t1);
        
        
        
        
end $$
delimiter ;

select `Date_` from t1;
select * from t2;


drop table t1;
drop table t2;
drop procedure q3;

