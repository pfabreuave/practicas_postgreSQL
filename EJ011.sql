/*
EJ011
Obtener el nombre del cliente, estado y fecha de nacimiento de
aquellos clientes que hayan nacido despues del 13 de diciembre
de 1954 y anten del 26 de junio de 1986
*/

/*
Cuando usamos el operador BETWEEN debemos asegurarnos que los rangos 
han sido colocados en orden ascendente

si precisaramos no tener presente el orde de los rangos debemos utilizar la
exprecion BETWEEN SYMMETRIC
symmetric (modificador)
*/

select * from cliente
where nacimiento >= '1954-12-13' and nacimiento <= '1986-06-26';

select * from cliente
where '(1954-12-13,1986-06-26)' ::daterange @> nacimiento;

select * from cliente
where nacimiento <@ '(1954-12-13,1986-06-26)' ::daterange;

select * from cliente
where nacimiento between '1954-12-13' and '1986-06-26';

select * from cliente
where '[1954-12-13,1986-06-26]' ::daterange @> nacimiento;

select * from cliente
where nacimiento <@ '[1954-12-13,1986-06-26]' ::daterange;
