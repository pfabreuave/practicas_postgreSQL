/*
EJ038

Encontrar la sucursal que tiene el mayor saldo promedio.
*/
select nombresucursal,to_char(avg(saldo),'LFM999,999,999.00') AS "SALDO PROMEDIO"
from sucursal natural join cuenta
group by nombresucursal
having avg(saldo) >= all(select avg(saldo) from cuenta
						group by numsucursal);