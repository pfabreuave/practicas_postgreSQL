/*
EJ022

Obtener toda la informacion de los clientes que son homonimos y que tengan
un prestamo con importe entre $10,000 y 60,000 en el periodo 2012 a 2015,
otorgado en mayo

*/
select distinct a.idcliente,a.nombrecliente,d.numprestamo,
	   to_char(importe,'LFM999,999,999.00') as importe,fecha
from cliente a join cliente b on a.nombrecliente = b.nombrecliente and
	 a.idcliente <> b.idcliente 
	 join prestatario c on a.idcliente = c.idcliente
	 join prestamo d on c.numprestamo = d.numprestamo and
	 importe between 10000 and 60000 and
	 extract('year' from fecha) between 2012 and 2015 and
	 extract('month' from fecha) = 4
order by nombrecliente;


