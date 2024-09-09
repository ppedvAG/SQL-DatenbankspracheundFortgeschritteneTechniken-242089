--Probleme bei Seiten..

--Z_Spieltabelle anlegen

--schlechter Füllgrad bedeutet:
--große Tabellen --> hohe IO --hoher RAM - Verbrauch


--kein IX--> TABLE SCAN

set statistics io, time on--

select * from ku where id = 100 --61058--von HDD in RAM

--Wie kann man den Füllgrad feststellen?

--Feststellen des Füllgrads der Seiten
dbcc showcontig('KUNDEUMSATZ')
--- Gescannte Seiten.............................: 48028
--- Mittlere Seitendichte (voll).....................: 97.86%

--DMV
--leider ist der dbcc showcontiog veraltet und kann nicht alle anzeigen..


select * from sys.dm_os_ oder sys.dm_db_
select * from sys.dm_db_index_physical_stats(db_id(),object_id('ku'),NULL,NULL,'detailed')

--unsichtbares Problem durch hinzufügen von Spalten


alter table kundeumsatz add id int identity --Spalte für eindeutigkeit-- 8 Sek


--Warum benötigt die Tabelle mehr Seiten als der dbcc uns sagt?

--Wir können mal nachsehen:
select * from sys.dm_db_index_physical_stats(
			db_id(),object_id('kundeumsatz'),NULL,NULL,'detailed'
											 )

--Spalte forward record count
--Das sind ide zusätzlichen Seiten, in denen die IDs untergeracht worden sind
--Weil die Seiten Limits besitzten ist dieser Aufwand deutlich höher ausgefallen...

--+ 15000 Seiten 

-- der forward record count!! muss NULL oder 0 sein
--wie krieg ich es weg?

--Lösung : ein Clustered Index zuu erstellen, legt die Datensätze komplett physikalisch neu ab
--die ID wird nun beim Datensatz sein und nicht mehr in Extra Seiten
-- das Phänomen forward record count wird es nmicht mehr geben solnage der CL IX vorhanden ist

--man könnte den CL ix nun auzch wieder löschen, dann sind zwar die frc weg, aber sie
--könnten wieder auftreten

--Gr IX = Tabelle , aber immer sortiert

select * from kundeumsatz where id =117
--Nun liegt die Seiten Zahl bei 47800


---48274


--Weniger IO ---------------------> weniger RAM --------------------> weniger CPU






