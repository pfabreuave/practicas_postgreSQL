/*
EJ005
Toda la informacion de las sucursales que comienzan con SAN
y que no esten ubicadas en la CDMX
*/

--Operador LIKE. Con Modificador % --> la ocurrencia de 0 a mas caracteres

select * from sucursal
where nombresucursal like 'SAN%';

--Operador ILIKE. --> Selecciona Mayusculas y Minusculas

select * from sucursal
where nombresucursal ilike 'san%';

/*
Modificacion de la Tabla sucursal colocando 'CDMX' a todos los 
registros cuyo estado sea 'DISTRITO FEDERAL'
*/

update sucursal set estado = 'CDMX'
where estado = 'DISTRITO FEDERAL';

--Completando la consulta solicitada

select * from sucursal
where nombresucursal like 'SAN%'; /* 1 o mas veces;*/

/* opciones */

select * from sucursal
where nombresucursal ~ 'SAN+' and estado <> 'CDMX';

select * from sucursal
where nombresucursal ~ '^SAN' and estado <> 'CDMX';

select * from sucursal
where nombresucursal ~* '^san' and estado <> 'CDMX';




