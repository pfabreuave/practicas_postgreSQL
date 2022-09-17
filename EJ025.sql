/*
EJ025

Todos los clientes que tienen un prestamo y una cuenta

*/

--
select * from prestatario
intersect
select * from ctacliente;

-- quitando el elemento diferente
select idcliente from prestatario
intersect
select idcliente from ctacliente;

select distinct idcliente
from ctacliente natural join prestatario;

-- Clientes que tienen prestamos y no tienen cuenta

select idcliente, numprestamo
from ctacliente natural right join prestatario
where numcta is null;


