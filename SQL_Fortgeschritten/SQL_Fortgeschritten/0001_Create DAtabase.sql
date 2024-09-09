create database demodb;
GO

--nie wieder :-)

--vermeide IO , vor allem überflüsige HDD ZUgriffe

--SQL übergibt das Vergrößern an Windws, das wiederum die Vergrößerung anlegt und mit 0 befüllt
--SQL muss anschliessend diese NUllen mit seinen Daten überschrieben

-- Das läßt sich vermieden durch
-- Datenträgervolumewartungstask für SQL Diesntkonto aktivieren
-- DB groß genug machen-- seletn Vergrößern


--Die Standardwerte einer DB sind nicht besonders gut gelungen

--Wie groß ist die DB?

--Startwert 
--Datendatei: 2014 5 MB  seit 2016 8 MB    
--Wachstum : +1 MB   seit 2016 64 MB

--Log: 2014 2 MB  seit 2016 8 MB
--Wachstum :  +64 MB


-- ==>unweigerlich IO


use demodb;
GO