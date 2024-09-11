--DDL reagieren auf create alter und drop und erzeugen eine nachricht in XML format

create trigger trgdemo on database --all_server
for DDL_Database_level_events --ALTER_VIEW
as
select eventdata();
GO

--! imme rgut zu wissen, wenn jemand Objekte ändert --> Sicht zB

drop view vslf
