/*
EJ032

 Encontrar todos los clientes que tienen un préstamo y una cuenta
*/
select distinct a.idcliente,nombrecliente,numcta,numprestamo
from cliente a join ctacliente b on a.idcliente = b.idcliente join
	 prestatario c on c.idcliente = a.idcliente
order by 2;
	 
-- enfoque desde prestatario
select distinct pr.idcliente,nombrecliente,numcta,numprestamo
from prestatario pr join cliente cl on pr.idcliente = cl.idcliente join
	 ctacliente ct on ct.idcliente = pr.idcliente
order by 2;


-- Una solucion utilizando ubconsulta
select distinct idcliente,nombrecliente
from cliente natural join ctacliente
where idcliente in(select idcliente from prestatario)
order by 2;

-- Otra forma
select idcliente,nombrecliente
from cliente
where idcliente in(select idcliente from ctacliente
				   intersect
				   select idcliente from prestatario)
order by 2;

-- Otra forma --> consulta correlacionada
select distinct idcliente
from ctacliente a
where exists (select * from prestatario
			 where idcliente = a.idcliente)




