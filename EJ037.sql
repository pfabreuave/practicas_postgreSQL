/*
EJ037

Obtener los clientes que tienen, tanto una cuenta como un préstamo.
*/
select idcliente,nombrecliente
from cliente natural join 
(select idcliente from ctacliente
intersect
select idcliente from prestatario) a;




