USE [Northwind]
GO
insert into kundeumsatz
SELECT [CustomerID]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle]
      ,[City]
      ,[Country]
      ,[EmployeeID]
      ,[OrderDate]
      ,[Freight]
      ,[ShipCity]
      ,[ShipCountry]
      ,[LastName]
      ,[FirstName]
      ,[OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[ProductName]
      ,[UnitsInStock]
    FROM [dbo].[kundeumsatz2]

GO


