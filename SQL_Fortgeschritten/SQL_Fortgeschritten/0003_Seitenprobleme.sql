--Probleme bei Seiten..

--Z_Spieltabelle anlegen

--schlechter F�llgrad bedeutet:
--gro�e Tabellen --> hohe IO --hoher RAM - Verbrauch


--kein IX--> TABLE SCAN

set statistics io, time on--

select * from ku where id = 100 --61058--von HDD in RAM

--Wie kann man den F�llgrad feststellen?

--Feststellen des F�llgrads der Seiten
dbcc showcontig('KUNDEUMSATZ')
--- Gescannte Seiten.............................: 48028
--- Mittlere Seitendichte (voll).....................: 97.86%

--DMV
--leider ist der dbcc showcontiog veraltet und kann nicht alle anzeigen..


select * from sys.dm_os_ oder sys.dm_db_
select * from sys.dm_db_index_physical_stats(db_id(),object_id('ku'),NULL,NULL,'detailed')

--unsichtbares Problem durch hinzuf�gen von Spalten


alter table kundeumsatz add id int identity --Spalte f�r eindeutigkeit-- 8 Sek


--Warum ben�tigt die Tabelle mehr Seiten als der dbcc uns sagt?

--Wir k�nnen mal nachsehen:
select * from sys.dm_db_index_physical_stats(
			db_id(),object_id('kundeumsatz'),NULL,NULL,'detailed'
											 )

--Spalte forward record count
--Das sind ide zus�tzlichen Seiten, in denen die IDs untergeracht worden sind
--Weil die Seiten Limits besitzten ist dieser Aufwand deutlich h�her ausgefallen...

--+ 15000 Seiten 

-- der forward record count!! muss NULL oder 0 sein
--wie krieg ich es weg?

--L�sung : ein Clustered Index zuu erstellen, legt die Datens�tze komplett physikalisch neu ab
--die ID wird nun beim Datensatz sein und nicht mehr in Extra Seiten
-- das Ph�nomen forward record count wird es nmicht mehr geben solnage der CL IX vorhanden ist

--man k�nnte den CL ix nun auzch wieder l�schen, dann sind zwar die frc weg, aber sie
--k�nnten wieder auftreten

--Gr IX = Tabelle , aber immer sortiert

select * from kundeumsatz where id =117
--Nun liegt die Seiten Zahl bei 47800


---48274


--Weniger IO ---------------------> weniger RAM --------------------> weniger CPU






