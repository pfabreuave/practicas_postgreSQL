/*
EJ019

 Obtener nombre de cliente, numero de prestamo, importe y fecha de otorgamiento
 para aquellos prestamos que se obtuvieron entre 2013 y 2014 durante el primer y
 tercer trimestre
*/

select cliente.idcliente, cliente.nombrecliente, prestamo.numsucursal, prestamo.numprestamo, 
	   to_char(prestamo.importe,'LFM999,999,999.99') as Importe, 
	   to_char(prestamo.fecha,'Mon dd yyyy') as Desde
from prestamo,prestatario,cliente
-- where ((to_char(prestamo.fecha,'yyyy')) between '2013' and '2014') and
-- where ((extract(year from fecha) between 2013 and 2014)) and
where extract(year from fecha) in (2013,2014) and
      extract(quarter from fecha) in (1,3) and
	  prestatario.numprestamo = prestamo.numprestamo and
	  prestatario.idcliente = cliente.idcliente
order by prestatario.idcliente, prestamo.numsucursal, prestamo.numprestamo, prestamo.fecha; 


