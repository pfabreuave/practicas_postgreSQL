/*
BanE005

consultas avanzadas trabajandocon funciones de resumen OLAP

*/
create or replace view olap as
select estado,nombresucursal,extract('year' from fecha) año,
	   extract('quarter' from fecha) trimestre,
	   extract('month' from fecha) mes,
	   to_char(fecha,'Mon') as n_mes,
	   numprestamo,to_char(importe,'LFM999,999,999.00') import
from prestamo natural join sucursal;

select * from olap;

--Obtenener la cantidad de prestamos en el Banco
select count(numprestamo)
from olap;

--Obtenener la cantidad de prestamos por estado
select count(numprestamo) 
from olap
group by estado;

--Obtenener la cantidad de prestamos por año
select año,count(numprestamo) 
from olap
group by año;

--Obtenener la cantidad de prestamos por trimestre
select año,trimestre,count(numprestamo) 
from olap
group by año,trimestre
order by año,trimestre;

--Obtenener la cantidad de prestamos por estado, sucursal y año
select estado,nombresucursal,año,count(numprestamo) 
from olap
group by estado,nombresucursal,año
order by estado,nombresucursal,año;

-- OLTP - procesamiento de transacciones en linea -> dia a dia

-- Inteligencia de negocios
-- Operaciones OLAP

-- GROUPING SETS

-- Aplicar la funcion de agrgacion por cada grupo especifico
-- se puede encerrar entre parentices el nivel de granulalidad por ej:
-- group by grouping sets((estado,nombresucursal),(ano,trimestre,mes))

select estado,nombresucursal,año,trimestre,mes,count(numprestamo)
from olap
group by grouping sets(estado,nombresucursal,año,trimestre,mes);

-- por grupo especifico
select estado,nombresucursal,año,trimestre,mes,count(numprestamo)
from olap
group by grouping sets((estado,nombresucursal),(año,trimestre,mes));
--order by estado,nombresucursal,año,trimestre,mes;

-- FUNCION ROLL-UP  (ENRROLLAR)
select estado,nombresucursal,año,trimestre,mes,count(numprestamo)
from olap
group by rollup(estado,nombresucursal,año,trimestre,mes);

-- FUNCION CUBE
select estado,nombresucursal,año,trimestre,mes,count(numprestamo)
from olap
group by cube(estado,nombresucursal,año,trimestre,mes);

-- modelo de agrupacion particular de postgresql

-- ejemplo:
-- consulta base
select estado,nombresucursal,año,trimestre,count(numprestamo)
from olap
group by estado,nombresucursal,año,trimestre
order by 1,2,3;

-- Se debe crear una extension, para habilitar las tablas de referencias cruzadas

CREATE EXTENSION IF NOT EXISTS tablefunc;

-- primera solucion: no adecuada
select *
from crosstab(
'select estado,nombresucursal,año,trimestre,count(numprestamo)
from olap
group by estado,nombresucursal,año,trimestre',
'select distinct trimestre from olap'
) as (esado text,nombresucursal text,año int,q1 int,q2 int,q3 int,q4 int)
order by 1,2,3;

-- segunda solucion: 
select *
from crosstab(
'select estado,nombresucursal,año,trimestre,count(numprestamo)
from olap
group by estado,nombresucursal,año,trimestre order by 1,2,3',
'select distinct trimestre from olap'
) as (estado text,nombresucursal text,año int,q1 int,q2 int,q3 int,q4 int)
order by 1,2,3;

-- Tercera Solucion
select split_part(llave,'-',1) estado, split_part(llave,'-',2) nombresucursal,
	   split_part(llave,'-',3) año,q1,q2,q3,q4
from crosstab(
'select concat(estado,''-'',nombresucursal,''-'',año) as llave,trimestre,count(numprestamo)
from olap
group by estado,nombresucursal,año,trimestre order by 1',
'select distinct trimestre from olap'	
) as (llave text, q1 int,q2 int,q3 int,q4 int);

--  Solucion Final
select split_part(llave,'-',1) estado, split_part(llave,'-',2) nombresucursal,
	   split_part(llave,'-',3) año,
	   case when q1 is null then 0 else q1 end,
	   case when q2 is null then 0 else q2 end,
	   case when q3 is null then 0 else q3 end,
	   case when q4 is null then 0 else q4 end
from crosstab(
'select concat(estado,''-'',nombresucursal,''-'',año) as llave,trimestre,count(numprestamo)
from olap
group by estado,nombresucursal,año,trimestre order by 1',
'select distinct trimestre from olap'	
) as (llave text, q1 int,q2 int,q3 int,q4 int);

-- para borrar la vista
-- drop view olap;






