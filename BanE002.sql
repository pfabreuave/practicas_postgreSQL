/*
BanE002
ext plpg
manejo de rangos, formatos
*/
-- consideraciones para el trabajo con rangos

-- retomando los ejercicios 11 y 12

/*
EJ011
Obtener el nombre del cliente, estado y fecha de nacimiento de
aquellos clientes que hayan nacido despues del 13 de diciembre
de 1954 y anten del 26 de junio de 1986
*/

/*
EJ012
Obtener el nombre del cliente, estado y fecha de nacimiento de
aquellos clientes que hayan nacido despues del 13 de diciembre
de 1954 y anten del 26 de junio de 1986, siempre y cuando el 
cliente viva en alguna privada 
*/

-- manejo de rangos sin considerar los limites
-- las fechas no necesitan ser invertidas

select * from cliente
where nacimiento > '1954-12-13' and nacimiento < '1986-06-26';

-- manejo de rangos considerando los limites
-- las fechas no necesitan ser invertidas

select * from cliente
where nacimiento >= '1954-12-13' and nacimiento <= '1986-06-26';

-- otra forma de hacerlo considerando los limites es con el operador between
-- Siempre que se trabaje con between el limite inferior debe estar a la izquierda

select * from cliente
where nacimiento between '1954-12-13' and '1986-06-26';

-- BETWEEN incluye los limites
-- Si quicieramos ignorar el orden de los limites debemos usar el modificador SYMMETRIC

select * from cliente
where nacimiento between symmetric  '1986-06-26' and '1954-12-13';

-- Otra forma de manejar rangos en una fecha sin incluir los limites
select * from cliente
where '(1954-12-13,1986-06-26)' ::daterange @> nacimiento;


--             la misma consulta expresada de otra manera
select * from cliente
where nacimiento <@ '(1954-12-13,1986-06-26)' ::daterange;

-- considerando los limites

select * from cliente
where '[1954-12-13,1986-06-26]' ::daterange @> nacimiento;

select * from cliente
where nacimiento <@ '[1954-12-13,1986-06-26]' ::daterange;

-- Otra manera de especificar el rango
-- los corchetes indican que los dos limites seran incluidos

select * from cliente
where daterange('1954-12-13','1986-06-26','[]') @> nacimiento;

-- Otra manera 
-- los parentises indican que los dos limites seran ignorados

select * from cliente
where daterange('1954-12-13','1986-06-26','()') @> nacimiento;

-- Podemos combinar el uso de parentices y corchetes por ejemplo, (],[) de esta forma 
-- el corchete "[]" indica inclucion, el parentise "()" indica exclucion
-- la omicion del tercer parametro daria como resultado '[)' es decir se incluye solo el
-- limite inferior

-- estas instrucciones tambien aplican a todos los valores numerico por Ejemplo:

select * from cuenta
where '[65000,85000]':: numrange @> saldo;

select * from cuenta
where numrange(65000,85000, '[]') @> saldo;

-- especificadores de formatos
-- aplicacion de formatos y edicion de fechas y numeros
-- funcion TO_CHAR (cambia un valor a una cadena de texto)
-- por ejemplo com la fecha:

select nombrecliente, nacimiento,
	   to_char (nacimiento,'DAY dd MONTH yyyy') as "DAY dd MONTH yyyy",
	   to_char (nacimiento,'Day dd Month yyyy') as "Day dd Month yyyy",
	   to_char (nacimiento,'day dd month yyyy') as "day dd month yyyy",
	   to_char (nacimiento,'Mon dd yyyy') as "Mon dd yyyy"
from cliente;

-- modificaciones para valores numericos
-- L = formato moneda, biene dado por la configuracion regiona del manejador
-- FM = justfica los espacio que puedan haber en el numero
-- 9999 = nomero de posiciones o digitos en eeste caso son 4 digitos enteros
-- .99 = valores decimales

select numcta, saldo,
	   to_char(saldo,'LFM9,999,999.99') as "LFM9,999,999.99"
from cuenta
where saldo > 100000.00;




