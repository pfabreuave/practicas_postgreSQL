/*
EJ023

Encontrar el nombre de los clientes que tienen prestamos, una cuenta o ambas
*/
select * from prestatario
union
select * from ctacliente;


select idcliente from prestatario
union
select idcliente from ctacliente;

-- para admitir valores dupliacadon UNION ALL
select idcliente from prestatario
union all
select idcliente from ctacliente;





