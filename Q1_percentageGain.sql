use challenges;

-- show columns from sample_dataset1;

delimiter //
create procedure show_percentageGain()
begin
	select *,`<open>`,`<close>`,`<open>`-`<close>` as `<gain>`, 
	((`<open>`-`<close>`)/`<open>`)*100 as `<Percentage gain>`
	from sample_dataset1 
	order by `<percentage gain>` desc limit 5 ;
end //
delimiter ;

-- select * from sample_dataset1;
