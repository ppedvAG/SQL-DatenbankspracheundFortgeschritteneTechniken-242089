--bad View
--Sicht



create or alter view vUmsatz
as
SELECT Customers.CustomerID, Customers.CompanyName, 
   Customers.ContactName, Customers.ContactTitle, Customers.Address, 
   Customers.City, Customers.Region, Customers.PostalCode, 
   Customers.Country, Customers.Phone, Customers.Fax, 
   [Order Details].ProductID, [Order Details].UnitPrice, 
   [Order Details].Quantity, [Order Details].Discount, 
   Products.ProductName, Orders.OrderID , Orders.EmployeeID, 
   Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, 
   Orders.ShipVia, Orders.Freight, Orders.ShipName, 
   Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, 
   Orders.ShipPostalCode, Orders.ShipCountry, Orders.RngSumme
FROM Customers INNER JOIN
   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
   [Order Details] ON 
   Orders.OrderID = [Order Details].OrderID INNER JOIN
   Products ON [Order Details].ProductID = Products.ProductID


   --------




select * from vKundeUmsatz

--Wieviele Lieferkosten erzeugte die Kunden aus Deutschland?

--Companyname, Country, Summe (freight)

select CompanyName, Country, sum(freight) AS Umsatz from vKundeUmsatz
where Country = 'Germany'
Group By CompanyName, Country
Order by CompanyName


select companyname, country, sum(freight)
from customers c inner join orders o on c.customerid = o.customerid
where country = 'Germany'
group by companyname, country



create table slf 
	(
	 id int identity,
	 stadt int,
	 land int
	 )


insert into slf
select 10,100
UNION ALL
select 20,200
UNION ALL
select 30,300

select * from slf;
GO


create view vdemo1
as
select * from slf
GO

select * from vdemo1


alter table slf add fluss int

update slf set fluss = id *1000


select * from vdemo1

--select id, stadt land ..idee

alter table slf drop column land

drop table slf

create table slf 
	(
	 id int identity,
	 stadt int,
	 land int
	 )


insert into slf
select 10,100
UNION ALL
select 20,200
UNION ALL
select 30,300

select * from slf;
GO


create or alter view vdemo1 -- with schemabinding
as
select id, stadt, land from dbo.slf
GO



alter table slf add fluss int

update slf set fluss = id *1000


select * from vdemo1

alter table slf drop column land 




--schemabinding verhindert die Angabe von * in Views
--und erfordert exaktes Arbeiten
--ausserdem können Tabellen mehr so geändert werden, daß die Sicht nicht mehr funktionieren würde



