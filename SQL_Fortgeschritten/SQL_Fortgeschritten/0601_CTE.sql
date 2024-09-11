--CTE

select employeeid, freight from orders

--Was ist der Durchschnitt der Max(frachtkosten) pro Ang


1 10
2 15
3 16


select avg(Maxfracht) from 
	(
	select employeeid, max(freight) as MaxFracht from orders
	group by employeeid
	) t



select employeeid, max(freight) as MaxFracht 
into #t
from orders
group by employeeid


select avg(maxfracht) from #t

--Wie lange lebt die #t
--solange Session exitiert oder gelöscht
--Zugriff nur für Ersteller


-- ##t
--globale temp Tabellen
--auch in anderen Sessions
--Lebenszeit bis sie gelöscht wird oder Session beendet, allerdings werden afd 
--Abfragen nie unterbrochen


create proc #test  @par int output
as
--##t


exec test


select * from #t

select @@SPID

declare @i as int 

set @i = 1

select @i 
GO

select @i







;WITH CTENAME
AS
(SELECT .......)
select * from ctename





;WITH CTE AS
(
	select employeeid, max(freight) as MaxFracht from orders
	group by employeeid
)
select avg(Maxfracht) from cte



select Lastname, Employeeid, reportsto from employees



WITH CTENAME
AS
(select .... Anker
UNION ALL
select )
select * from cte



;WITH CTEANG
as
	(select lastname, employeeid, 1 as Level from employees where reportsto is null
	 UNION ALL
	 select e1.lastname, e1.employeeid,level+1 from employees e1 inner join CTEANG
		on e1.ReportsTo = CTEANG.employeeid
	)
select * from cteang where level = 3





