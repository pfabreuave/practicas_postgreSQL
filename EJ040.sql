/*
EJ040

Obtener un reporte que indique el tipo de tarjeta que se les puede ofrecer a los clientes que 
tienen cuenta en el banco, de acuerdo a lo siguiente:

 [$10,000 , $20,000] → Tarjeta de crédito CLÁSICA
 ($20,000 , $35,000] → Tarjeta de crédito ORO
 ($35,000 , $50,000] → Tarjeta de crédito PREMIUM
 > $50,000 → Tarjeta de crédito PLATINUM
 < $10,000 → No se les puede ofrecer una tarjeta

*/
select idcliente,nombrecliente,to_char(saldo,'LFM999,999,999.00') as saldo,
case when saldo between 10000 and 20000 then 'Tarjeta Clasica'
	 when saldo > 20000 and saldo <= 35000 then 'Tarjeta de Oro'
	 when saldo > 35000 and saldo <= 50000 then 'Tarjeta PREMIUN'
	 when saldo > 50000 then 'Tarjeta PLATINUM'
else 'NEGADA'
end as tipotarjeta
from (select idcliente,nombrecliente,sum(saldo) as saldo
	  from cliente natural join ctacliente natural join cuenta
	  group by idcliente) a;

	   
	   
