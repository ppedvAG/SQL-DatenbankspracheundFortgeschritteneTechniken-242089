SELECT Customers.CustomerID, Customers.CompanyName, 
   Customers.ContactName, Customers.ContactTitle, Customers.City, 
   Customers.Country, Orders.EmployeeID, Orders.OrderDate, 
   Orders.Freight, Orders.ShipName, Orders.ShipCity, 
   Orders.ShipCountry, [Order Details].ProductID, 
   [Order Details].UnitPrice, [Order Details].OrderID, 
   [Order Details].Quantity, Employees.LastName, Employees.FirstName, 
   Products.ProductName, Products.UnitsInStock
INTO KUNDEUMSATZ
FROM Customers INNER JOIN
   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
   [Order Details] ON 
   Orders.OrderID = [Order Details].OrderID INNER JOIN
   Products ON 
   [Order Details].ProductID = Products.ProductID INNER JOIN
   Employees ON Orders.EmployeeID = Employees.EmployeeID


insert into kundeumsatz
select * from kundeumsatz
GO 9 --10 Sek
