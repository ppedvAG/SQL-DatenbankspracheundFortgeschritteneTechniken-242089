create database demodb;
GO

--nie wieder :-)

--vermeide IO , vor allem �berfl�sige HDD ZUgriffe

--SQL �bergibt das Vergr��ern an Windws, das wiederum die Vergr��erung anlegt und mit 0 bef�llt
--SQL muss anschliessend diese NUllen mit seinen Daten �berschrieben

-- Das l��t sich vermieden durch
-- Datentr�gervolumewartungstask f�r SQL Diesntkonto aktivieren
-- DB gro� genug machen-- seletn Vergr��ern


--Die Standardwerte einer DB sind nicht besonders gut gelungen

--Wie gro� ist die DB?

--Startwert 
--Datendatei: 2014 5 MB  seit 2016 8 MB    
--Wachstum : +1 MB   seit 2016 64 MB

--Log: 2014 2 MB  seit 2016 8 MB
--Wachstum :  +64 MB


-- ==>unweigerlich IO


use demodb;
GO