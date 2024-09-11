
dbcc freeproccache

--Pläne werden als Hashwert gespeichert... blöd, wenn man mal groß mal kleion schreibt..

 select * from orders where customerid = 'HANAR'

 
 select * from orders where Customerid = 'HANAR'

 
 select * from Orders 
	where customerid = 'HANAR'


select * from orders where	Orderid = 10

select * from orders 
where orderiD = 300

select * from orders where orderid = 50000





select usecounts, cacheobjtype,[TEXT] from
	sys.dm_exec_cached_plans P
		CROSS APPLY sys.dm_exec_sql_text(plan_handle)
	where cacheobjtype ='Compiled PLan'
		AND [TEXT] not like '%dm_exec_cached_plans%'

--Prozeduren werden dieses Problem nicht haben