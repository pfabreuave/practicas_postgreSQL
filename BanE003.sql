/*
BanE003

creacion de tablas temporales que serviran de base para el estudio de join

*/
create temp table r(a int, b int, c int);
create temp table s(b int, c int, d int);

insert into r values (1,2,3), (6,7,8), (9,7,8), (6,7,18);
insert into s values (2,3,4), (2,3,5), (7,8,10), (2,5,15);

select * from r;
select * from s;

-- producto carteciano
select *
from r cross join s;

select *
from r,s;

-- join natural o por coinsidencia de producto
select *
from r natural join s;

-- theta join o join con condicion
-- simulando el natural join
select *
from r join s on r.b = s.b and r.c = s.c;

select *
from r join s on a < d;

-- Join externo (outer es opcional)
-- por la izquierda
select *
from r natural left outer join s;

-- por la derecha
select *
from r natural right outer join s;

-- completo
select *
from r natural full outer join s;

-- con theta join un join por la izquierda
-- por la izquierda
select *
from r left outer join s on r.b = s.b and r.c = s.c;

--Aplicando los conceptos en el EJ019

/*
EJ019

 Obtener nombre de cliente, numero de prestamo, importe y fecha de otorgamiento
 para aquellos prestamos que se obtuvieron entre 2013 y 2014 durante el primer y
 tercer trimestre
*/

-- version original sin JOIN

select cliente.idcliente, cliente.nombrecliente, prestamo.numsucursal, prestamo.numprestamo, 
	   to_char(prestamo.importe,'LFM999,999,999.99') as Importe, 
	   to_char(prestamo.fecha,'Mon dd yyyy') as Desde
from prestamo,prestatario,cliente
where extract(year from fecha) in (2013,2014) and
      extract(quarter from fecha) in (1,3) and
	  prestatario.numprestamo = prestamo.numprestamo and
	  prestatario.idcliente = cliente.idcliente
order by prestatario.idcliente, prestamo.numsucursal, prestamo.numprestamo, prestamo.fecha;


-- con NATURAL JOIN (la condicion de reunion es igual)

select cliente.idcliente, cliente.nombrecliente, 
	   prestamo.numsucursal, prestamo.numprestamo, 
	   to_char(prestamo.importe,'LFM999,999,999.99') as Importe, 
	   to_char(prestamo.fecha,'Mon dd yyyy') as Desde
from prestamo NATURAL JOIN prestatario NATURAL JOIN cliente
where extract(year from fecha) in (2013,2014) and
      extract(quarter from fecha) in (1,3)	  
order by prestatario.idcliente, 
		 prestamo.numsucursal, 
		 prestamo.numprestamo, 
		 prestamo.fecha;
		 
-- con THETA JOIN (se necesita establecer una condicion de reunion)		 

select cliente.idcliente, cliente.nombrecliente, 
	   prestamo.numsucursal, prestamo.numprestamo, 
	   to_char(prestamo.importe,'LFM999,999,999.99') as Importe, 
	   to_char(prestamo.fecha,'Mon dd yyyy') as Desde
from prestamo JOIN prestatario ON prestamo.numprestamo = prestatario.numprestamo 
			  JOIN cliente ON prestatario.idcliente = cliente.idcliente
where extract(year from fecha) in (2013,2014) and
      extract(quarter from fecha) in (1,3)
order by prestatario.idcliente, 
		 prestamo.numsucursal, 
		 prestamo.numprestamo, 
		 prestamo.fecha;
		 
-- optimizando  consulta	 

select cliente.idcliente as "Cod Cliente", cliente.nombrecliente as "Nombre de Cliente", 
	   prestamo.numsucursal as "Sucursal", prestamo.numprestamo as "Num Prestamo", 
	   to_char(prestamo.importe,'LFM999,999,999.99') as Importe, 
	   to_char(prestamo.fecha,'Mon dd yyyy') as Desde
from prestamo JOIN prestatario ON prestamo.numprestamo = prestatario.numprestamo 
			  JOIN cliente ON prestatario.idcliente = cliente.idcliente and
		      extract(year from fecha) in (2013,2014) and
              extract(quarter from fecha) in (1,3)
order by prestatario.idcliente, 
		 prestamo.numsucursal, 
		 prestamo.numprestamo, 
		 prestamo.fecha;
		 


		 