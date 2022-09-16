/*
  Ej002
Obtener todos los prestamos hechos en alguna de las
siguientes Sucurcales: 1 (ACAMBORA) o 128 (BUENAVISTA) o
19 (CUATLA) o 41 (NAVOJOA) o 39 (TEPIC) o 110 (ZAMORA);
y cuyo importe sea mayor $40,000
*/

select * from prestamo
where (numsucursal = 1    or
	  numsucursal = 128  or
	  numsucursal = 109  or
	  numsucursal = 41   or
	  numsucursal = 39   or
	  numsucursal = 110) and
	  importe > 40000;
	 
-- Mejorando la condicion del ejemplo IN (comparacion)
select * from prestamo
where numsucursal in (1,128,109,41,39,110) and
	 			 importe > 40000;

