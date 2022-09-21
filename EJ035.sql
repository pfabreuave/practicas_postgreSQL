/*
EJ035

 Listar los clientes que tienen un préstamo y no tienen una cuenta en el banco
*/
select distinct idcliente,nombrecliente
from (prestatario natural join cliente) p
where not exists
(select * from ctacliente where idcliente = p.idcliente);

--otraforma
select idcliente,nombrecliente
from cliente natural join
((select idcliente from prestatario
 except
 select idcliente from ctacliente)) as a;



