/*
EJ024 (incompleto)

clientes que tiene abierta una cuenta , pero no tiene credito
*/
--falso
select * from ctacliente
except
select * from prestatario;

-- lo correcto (quitar valor que los hace diferente)
select idcliente from ctacliente
except
select idcliente from prestatario;

--  (manteniendo los duplicados)
select idcliente from ctacliente
except all
select idcliente from prestatario;

-- Resolviendo con join NATURAL version LEFT

select *
from ctacliente natural left join prestatario
where numprestamo is null;

-- Resolviendo con join NATURAL version LEFT retirando los duplicados

select distinct idcliente
from ctacliente natural left join prestatario
where numprestamo is null;