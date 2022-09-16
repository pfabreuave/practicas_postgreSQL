/*
EJ010
Toda la Informacion de los clientes que tienen un segundo
apellido que comience con alguna de las siguientes letras:
A,C,N-R  y que no termine con: O,N,R,S,Z cuya la longitud 
sea de 5 caracteres
*/

select * from cliente
where nombrecliente ~* ' .....$';

select * from cliente
where nombrecliente ~* ' [a,cn-r]...[^onsz]$';

-- ^ fuera del ^[] indica inicio de cadena
-- ^ dentro de [^] indica not (negacion)

