/*
EJ026
Funciones de agregacion:

sum
min
max
avg
count 

Obtener: el menor saldo, mayor saldo, el saldo promedio, la suma de los saldos y el total de cuentas de 
todo el banco

*/
select sum(saldo) as total_saldo, 
	   min(saldo) as menor_saldo,
	   max(saldo) as mayor_saldo,
	   avg(saldo) as promedio_saldo,
	   count(numcta) as cantidad_registros
from cuenta;

--El salso menor  de la sucursal CUAJIMALPA

select min(saldo)
from cuenta natural join sucursal
where nombresucursal = 'CUAJIMALPA';

--El salso menor  en cada sucursal

select 
	   sucursal.numsucursal AS "ID SUCURSAL", 
	   sucursal.nombresucursal AS "NOMBRE",
	   count(numcta) AS "# CUENTAS",
	   sum(saldo) as "TOTAL SALDOS", 
	   min(saldo) as "SALDO MINIMO",
	   max(saldo) as "SALDO MAXIMO",
	   avg(saldo) as "PROMEDIO"	   
from cuenta natural join sucursal
group by sucursal.numsucursal, sucursal.nombresucursal
order by sucursal.numsucursal;
