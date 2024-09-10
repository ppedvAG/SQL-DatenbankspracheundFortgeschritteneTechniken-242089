Columnstore

select * from sys.dm_db_column_store_row_group_physical_stats

--exterm hohe KOmpression
--Sehr nützlich bei Archivdaten 
--neue Datensätze oder geänderte werden allerdings
--in unsortierte Heaps abgelegt...Da hier zunächst 
--nur unkomprimierte Daten sind, die mit einem Scan durchsucht werden müssen
--werden Afragen, die genau auf diese Daten losgehen
--"leiden müssen" --also viele Seiten lesen müssen

--Jeder NOn CL oder CL IX ist immer aktuell. Der CS IX nicht

--die Daten des delat Stores where in einem gewissen Intervall autmatisch in komprimierte Columnstore 
--übergeführt. Allerdings erst , wenn 1 Mio DS zuustande gekommen sind...

--und das kann dauern




set statistics io, time on


select country, city, sum(unitprice*quantity)
from kundeumsatz
where freight < 5 
group by country, city

--idealer IX


select * into kundeumsatz2 from kundeumsatz --ku2 hat keinen IX 



select country, city, sum(unitprice*quantity)
from ku2
where freight < 5 
group by country, city

