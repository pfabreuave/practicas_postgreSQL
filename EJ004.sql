/*
EJ004
Obtener la informacion de las cuentas cuyo saldose mayor 
o igual a$100,000.00 y que se hayan otorgado durante el 
primer trimestre de 2013 (01/01/2013 al 31/03/2013) o bien, 
aquellas cuyo saldo sea mayor que $65,000 y menor que $85,000, 
y que sean de alguna de las siguientes sucursales:
55(LORETO) o 164(ZACATECAS) O 63(FRESNILLO)
*/

select * from cuenta
where saldo >= 100000 and fecha between '01-01-2013' and '31-03-2013'; 

--consulta en formato de fecha standard
select * from cuenta
where (saldo >= 100000 and fecha between '2013-01-01' and '2013-03-31') or
	  ((saldo > 65000 and saldo < 85000) and numsucursal in(55,63,164))
