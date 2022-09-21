/*
EJ036

Obtener el nombre de las sucursales que posean un activo mayor que al menos una sucursal situada en 
SONORA
*/

select *
from sucursal
where activo > any(select activo from sucursal where estado = 'SONORA');

-- OTRA SOLUCION
select *
from sucursal
where activo > (select MIN(activo) from sucursal where estado = 'SONORA');


-- OTRA SOLUCION
select distinct a.*
from  sucursal a, sucursal b
where a.activo > b.activo and b.estado = 'SONORA';

