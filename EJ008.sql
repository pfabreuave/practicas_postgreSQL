/*
EJ008
Obtener el nombre del cliente, estado y fecha de nacimiento
de aquellos clientes que tengan como apellido paterno ALONSO
y que contengan en la direccion la cadena MZNA o MANZANA

*/

select * from cliente
where nombrecliente ilike '% alonso %' and
	  (direccion ilike '%MZNA %' or direccion ilike '%MANZANA%');