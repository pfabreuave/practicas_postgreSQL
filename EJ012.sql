/*
EJ012
Obtener el nombre del cliente, estado y fecha de nacimiento de
aquellos clientes que hayan nacido despues del 13 de diciembre
de 1954 y anten del 26 de junio de 1986, siempre y cuando el 
cliente viva en alguna privada 
*/

select * from cliente
where nacimiento between '1954-12-13' and '1986-06-26' and
	  direccion ilike '%priv%';