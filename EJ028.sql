/*
EJ028

 Obtener: el menor saldo, mayor saldo, el saldo promedio, la suma de los saldos y el total de cuentas de
 para cada una de las sucursales del banco.

*/

select 
	   sucursal.estado AS "ESTADO",
	   sucursal.numsucursal AS "ID SUCURSAL", 
	   sucursal.nombresucursal AS "NOMBRE",
	   count(numcta) AS "# CUENTAS",
	   to_char(sum(saldo),'LFM999,999,999.99') as "TOTAL SALDOS", 
	   to_char(min(saldo),'LFM999,999,999.99') as "SALDO MINIMO",
	   to_char(max(saldo),'LFM999,999,999.99') as "SALDO MAXIMO",
	   to_char(avg(saldo),'LFM999,999,999.99') as "PROMEDIO"	   
from cuenta natural join sucursal
group by sucursal.estado,
		 sucursal.numsucursal, 
		 sucursal.nombresucursal
order by sucursal.estado,
		 sucursal.numsucursal;
