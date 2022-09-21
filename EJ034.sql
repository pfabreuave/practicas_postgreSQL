/*
EJ034

 Listar los clientes que tienen, tanto una cuenta, como un préstamo en la sucursal CUAJIMALPA
*/

select a.idcliente,nombrecliente
from cliente a join ctacliente b on a.idcliente = b.idcliente join
	 cuenta c on c.numcta = b.numcta join
	 sucursal d on d.numsucursal = c.numsucursal and
	 nombresucursal = 'CUAJIMALPA'
where a.idcliente in (select idcliente
					 from prestatario 
					 natural join prestamo
					 natural join sucursal
					 where nombresucursal = 'CUAJIMALPA');

--otra forma
select idcliente,nombrecliente
from cliente natural join
	 ((select idcliente from ctacliente
	 natural join cuenta
	 natural join sucursal
	 where nombresucursal = 'CUAJIMALPA')
intersect
(select idcliente from prestatario
	 natural join prestamo
	 natural join sucursal
	 where nombresucursal = 'CUAJIMALPA')) a

-- Otra forma usando EXISTS
select c.idcliente,nombrecliente
from (ctacliente natural join cuenta
				 natural join sucursal) as a
	  join cliente c on a.idcliente = c.idcliente and
	  nombresucursal = 'CUAJIMALPA' and
	  exists
	  (select idcliente
	  from prestatario natural join prestamo 
	  				   natural join sucursal
	  where nombresucursal = 'CUAJIMALPA' and
	   		idcliente = a.idcliente);


