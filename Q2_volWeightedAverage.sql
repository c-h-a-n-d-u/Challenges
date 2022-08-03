use challenges;

show columns from sample_dataset2;

select * from sample_dataset2 ;

SELECT `<date>` AS original,
STR_TO_DATE(`<date>`,'%Y%m%d%H%i') AS real_date
FROM sample_dataset2;

delimiter //
create procedure show_weightedAvg(
	-- in startTime time,
    -- in date_ date
     in startDateTime datetime
)
begin
	-- declare endDateTime datetime;-- 
    -- set @endTime = 0;
	-- select @counter := @counter + 1 as Count, `<ticker>` as Ticker from sample_dataset1
    -- where `<ticker>` like symboltext;
    
    -- SET @datein = '2010-10-11 09:00:00';
    
	SET @timeplus = 5;
	select `<date>` as `<date_text>`, 
    str_to_date(`<date>`,'%Y%m%d%H%i') as `<date_datetime>`,
    sum(`<vol>`*`<close>`)/sum(`<vol>`) as `<weightedAvg>`
    from sample_dataset2
    where  str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
    startDateTime AND 
	DATE_ADD(startDateTime, INTERVAL @timeplus HOUR);
    
	-- SELECT `<date>` AS original,
	-- 	STR_TO_DATE(`<date>`,'%Y%m%d%H%i') AS real_date
	-- 	FROM sample_dataset2
	-- 	WHERE str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
	-- 	str_to_date(@datein, '%Y-%m-%d %T') AND 
	-- 	DATE_ADD(str_to_date(@datein, '%Y-%m-%d %T'), INTERVAL @timeplus MINUTE);
end //
delimiter ;

drop procedure show_weightedAvg;