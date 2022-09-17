/*
EJ021

Obtener toda la informacion de los clientes que nacieron el mismo dia  y que
tengan una cuenta otorgada en 2013 durante el segundo o cuarto trimestre

Funciones de dispercion

*/


-- solucion 

select distinct a.idcliente,a.nombrecliente,a.nacimiento,d.numcta,fecha
from cliente a, cliente b, ctacliente c, cuenta d
where a.nacimiento = b.nacimiento and a.idcliente <> b.idcliente and
	  a.idcliente = c.idcliente and c.numcta = d.numcta and
	  extract('year' from fecha) = 2013 and
	  extract('quarter' from fecha) in (2,4)
order by a.nacimiento;

-- solucion con theta join

select distinct a.idcliente,a.nombrecliente,a.nacimiento,d.numcta,fecha
from ((cliente a join cliente b on a.nacimiento = b.nacimiento and
	   a.idcliente <> b.idcliente) 
	  join ctacliente c on a.idcliente = c.idcliente)
	  join cuenta d on c.numcta = d.numcta and 
	  extract('year' from fecha) = 2013 and
	  extract('quarter' from fecha) in (2,4)
order by a.nacimiento;



