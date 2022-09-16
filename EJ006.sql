/*
EJ006
Toda la informacion de clientes que tengan com apellido 
materno MOYA y que no vivan en alguna de los siguientes
estados: GUERRERO, TAMAULIPAS, O SONORA
*/

select * from cliente
where nombrecliente ilike '%moya' and 
	  estado not in ('guerrero','tamaulipas','sonora');