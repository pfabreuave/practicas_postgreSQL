/*
EJ007
Toda la informacion de los clientes que tengan la cadena ALONSO
en cualquier posicion y cuya direccion contenga el nombre de
algun santo
*/

select * from cliente
where nombrecliente ilike '%alonso%' and
	  (direccion ilike '%san %' or direccion ilike '%santa %');