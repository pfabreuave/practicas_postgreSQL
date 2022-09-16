/*  
EJ018
-- extraer la edad de los clientes
ceil hace redondeo a mas
floor hace redondeo a menos
*/

select nombrecliente,nacimiento,
	   age(nacimiento) as edad_01,
	   age(current_date,nacimiento) as edad_02,
	   age(now(),nacimiento) as edad_03,
	   extract(year from age(nacimiento)) as edad_04,
	   extract(year from current_date) - extract(year from nacimiento) as edad_05,
	   (current_date - nacimiento)/365.25 as edad_06,
	   ceil((current_date - nacimiento)/365.25) as edad_07,
	   floor((current_date - nacimiento)/365.25) as edad_08
from cliente;



