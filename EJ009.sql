/*
EJ009
Informacion de las sucursales cuyo nombre termine con alguna
de las siguientes letras: N, O, S o Z y que esten ubicadas
cuya primera letra sea A-D, H,L, O-T
*/

/*
Utilisaremos el modificador (_)
Guion bajo (_) --> la ocurrencia de 1 caracter
ej01:
obtener informacion de los clientes que tienen un apellido de longitud 6
*/

select * from cliente
where nombrecliente ilike '% ______';

/*
Utilisaremos el modificador (_)
Guion bajo (_) --> la ocurrencia de 1 caracter
ej02:
obtener informacion de los clientes que tienen un apellido de longitud 6
y la primera letra es 'C'
*/
select * from cliente
where nombrecliente ilike '% c_____';

/*
Utilisaremos el modificador (_)
Guion bajo (_) --> la ocurrencia de 1 caracter
ej03:
Buscar cuenta
*/

select * from cuenta
where numcta ilike 'c-0022_';

/*
Utilisaremos el modificador (_)
Guion bajo (_) --> la ocurrencia de 1 caracter
ej04:
Buscar prestamo
*/

select * from prestamo
where numprestamo ilike 'P-000__';

/*
tambien se podria utilizar 'similar to' pero se debe respetar
la forma en que estan grabados los datos Mayusculas y minusculas
*/

select * from prestamo
where numprestamo similar to 'P-000__';

--Respondiendo a la solicitud original

select * from sucursal
where nombresucursal ilike '%n' or nombresucursal ilike '%o' or 
	  nombresucursal ilike '%s' or nombresucursal ilike '%z';
	  
	  
--otras opciones
-- Expreciones regulares

select * from sucursal
where nombresucursal ~ 'SAN+' and estado <> 'CDMX';

select * from sucursal
where nombresucursal ~ '^SAN' and estado <> 'CDMX';

select * from sucursal
where nombresucursal ~* '^san+'; --no sencible a MAy y Min

select * from sucursal
where nombresucursal ~* '^san.*';
/*
 cuantificadores que permiten indicar el numero de veces en 
 que debe aprarecer un caracter
CUANTIFICADORES:
 {n} aparecera en numero de veces que indica
 {n,m} aparecera n veces, como maximo m veces
 {n,} aparecera almennos n veces

*/

select * from cuenta
where numcta ~* 'c-0{2}1{3}';

-- Buscar al Final ($)
-- buscar al inicio (^)

select * from cuenta
where numcta ~* '0*1+3$';

-- Solucion ejercicio 9 con expreciones regulares

select * from sucursal
where nombresucursal ~* '[n,o,s,z]$' and
	  estado ~* '^[a-d,h,l,o-t]';

