/*
  Ej001
Obtener informacion de los clientes que viven
los estados de CHIHUAHUA o CHIAPAS o HIDALGO o
JALISCO
*/

/*
OPERADORESE DE COMPARACION: >, <, >=, <=, = <> 
OPRADORES LOGICOS: or, and, not
*/
select * from cliente
where estado = 'CHIHUAHUA' or
	  estado = 'CHIAPAS' or
	  estado = 'HIDALGO' or
	  estado = 'JALISCO';
	 
-- Mejorando la condicion del ejemplo IN (comparacion)
select * from cliente
where estado in ('CHIHUAHUA',
	 			 'CHIAPAS',
		  		 'HIDALGO',
	  			 'JALISCO');
/*	
Mejorando la consulta del ejemplo buscaremos todos 
incluiendo los escritos en minusculas, en este caso 
debemos espesificar el texto en minuscula
*/

select * from cliente
where lower(estado) in ('chihuahua',
	 			 'chiapas',
		  		 'hidalgo',
	  			 'jalisco');
