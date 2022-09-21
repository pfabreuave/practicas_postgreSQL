/*
EJ039

Una lista con los clientes que tienen cuenta en cada una de las sucursales de GUANAJUATO.
*/
select distinct idcliente,nombrecliente
from (cliente natural join ctacliente) c
where not exists
(select nombresucursal from sucursal
where estado = 'GUANAJUATO'
except
select nombresucursal
from sucursal natural join cuenta natural join ctacliente
where idcliente = c.idcliente);




