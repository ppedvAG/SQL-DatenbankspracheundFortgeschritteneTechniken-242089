DECLARE @tvTableD TABLE  
    ( Column1   INT   NOT NULL ,  
      Column2   CHAR(10) );















CREATE TYPE dbo.typeTableD  
    AS TABLE  
    (  
        Column1  INT   NOT NULL ,  
        Column2  CHAR(10)  
    );  
go  
   ----
   

SET NoCount ON;  
DECLARE @tvTableD dbo.typeTableD  
;  
INSERT INTO @tvTableD (Column1) values (1), (2)  
;  
SELECT * from @tvTableD;  
go

---

CREATE TYPE dbo.typeTableD  
    AS TABLE  
    (  
        Column1  INT   NOT NULL   INDEX ix1,  
        Column2  CHAR(10)  
    )  
    WITH  
        (MEMORY_OPTIMIZED = ON);