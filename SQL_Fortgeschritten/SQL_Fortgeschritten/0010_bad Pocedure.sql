---Stored Procedures


exec gpSucheKunde 'ALFKI'

exec gpSucheKunde 'A' --alle die mit beginnen


exec gpSucheKunde --dann alle Datensätze


select * from customers where customerid like 'ALFKI'


--Customerid  nchar(5)

create or alter proc gpSucheKunde @kunde nvarchar(5) = '%'--nicht die beste Idee
as
select * from customers where customerid like @kunde +'%'

exec gpSucheKunde 'ALFKI'

exec gpSucheKunde 'A'

exec gpSucheKunde '%'


set statistics io, time on
select * from Kundeumsatz where id < 2;
GO

create proc gpdemox @par int
as
select * from Kundeumsatz where id < @par;
GO

exec gpdemox 2

select * from Kundeumsatz where id < 900000;
--, CPU-Zeit = 1281 ms, verstrichene Zeit = 11753 ms.

exec gpdemox 900000
--902012 Seiten ?????  3125 ms

dbcc freeproccache



create proc gpdemox @par int
as
IF @par < 20000
exec gpdemowenige --select * from Kundeumsatz where id < @par;  IX SEEK
else
exec gpdemoviele --  TAB SCAN





create proc gpdemoxyz @par1 int
as
IF @par1 = 1
select * from orders where

IF @par1 = 2
select * from customers where

IF @par1 = 3
select * from employees where


GO
