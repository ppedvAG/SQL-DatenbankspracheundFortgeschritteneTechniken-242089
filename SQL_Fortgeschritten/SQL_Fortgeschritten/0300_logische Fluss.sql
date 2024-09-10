select country as Land, city as Stadt
		, sum(freight) 
from kundeumsatz
where city = 'london'
group by country, city
order by country, city
---------

select country as Land, city as Stadt
		, sum(freight) 
from kundeumsatz
where city = 'london'
group by country, city
order by Land, Stadt

select country as Land, city as Stadt
		, sum(freight) 
from kundeumsatz
where Stadt = 'london'
group by country, city
order by Land, Stadt


select country as Land, city as Stadt
		, sum(freight) 
from kundeumsatz k
where k.city = 'london'
group by --
order by Land, Stadt

select k. from kundeumsatz k


-->FROM --> JOIN TABELLE b --> JOIN Tabelle C-->
--> where --> GROUP BY -->HAVING -->
--> SELECT (ALIAS) --> order by --> TOP|DISTINCT

--Tu nie!
select country as Land, city as Stadt
		, sum(freight) as SummeFracht
from kundeumsatz
--where city = 'london'
group by country, city having  sum(freight) 
order by Land, Stadt

select * from customers c inner join orders o
on c.CustomerID = o.CustomerID and c.City= 'London'


select country as Land, city as Stadt
		, sum(freight) 
from kundeumsatz
where city = 'london'
group by country , city 		
order by Land, Stadt

select * from (select ...) t

CTE