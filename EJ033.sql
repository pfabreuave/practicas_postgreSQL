/*
EJ033

 Listar los clientes que tienen un préstamo en el banco y que no se apelliden HENRÁNDEZ o PÉREZ.
*/
select idcliente,nombrecliente
from prestatario natural join cliente
where nombrecliente not like ('%HERNÁNDEZ%')
except
select idcliente,nombrecliente
from prestatario natural join cliente
where nombrecliente like ('%PÉREZ%');

-- CON NOT IN
select distinct idcliente,nombrecliente
from prestatario natural join cliente
where nombrecliente not like '%HERNÁNDEZ%' and
	  idcliente not in (select idcliente
					   from prestatario natural join cliente
					   where nombrecliente like '%PÉREZ%');





