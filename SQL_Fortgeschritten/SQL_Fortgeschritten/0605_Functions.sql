---Functions.. geh�lren immer auf dem Pr�fstand

--F() k�nnen durch QueryOptimzer schlecht eingesch�tzt werden
--bzw auch gar nicht
--Siehe tats. Plan.. Messungen der Seiten

--Aber mitr SQL 2017 und h�her k�nnen Skalrwertfunktionen
--in Unterabfragen umgewandelt werden und smot besser eingesch�tzt werden
--ab SQL 2019 k�nnen auch Tabellenvariablen w�hrned der Laufzeit besser
--eingesch�tzt werden und der Plan optimiert werden..

--aber nicht immer ... daher immer nachsehen, ob die Messung und Plan schl�ssig sind


select f(Spalte), f(wert) from f(wert) where f(spalte) = f(wert)


--Kompabilit�tsgrad 140
USE [master]
GO
ALTER DATABASE Northwind SET COMPATIBILITY_LEVEL = 160
GO



select * from orders

--Rsumme

select o.orderid, sum(od.unitprice*od.quantity)
from orders o 
		inner join [order details] od 
on 
		o.orderid = od.orderid
group by
		o.orderid


--Idee: mach ne F()

create function fRngSumme(@bestid int) returns table

as
	begin
			return
			(
			select sum(unitprice*quantity)
			from [order details] 
			where orderid = @bestid
			)
	end
GO

select dbo.fRngSumme(10248)

select dbo.frngsumme(orderid),* from orders where dbo.fRngSumme(orderid) > 1000

set statistics io, time on

select * from orders where dbo.fRngSumme(orderid) > 1000
--Seiten 22
--, CPU-Zeit = 31 ms, verstrichene Zeit = 156 ms.

--in Meldung: keine Order details
--gesch. Plan 85% der Leistung auf orders
--in tats Plan keine Order details



alter table orders add RngSumme as dbo.fRngsumme(orderid)

select * from orders where RngSumme > 1000

F() werden nicht parallelisiert



select * from f(wert)
--1 Zeile 2012
--100 2014

