use challenges;

show columns from sample_dataset1;

select `<open>`,`<close>`,`<open>`-`<close>` as `<gain>`, 
	((`<open>`-`<close>`)/`<open>`)*100 as `<percentage gain>`
 from sample_dataset1;
 
 select * from sample_dataset1;
