/*
EJ029

 Obtener el total de prestatarios e importe promedio por estado, sucursal, año y trimestre

*/
select
		estado,	
		nombresucursal,
		extract(year from fecha) as AÑO,
		date_part('quarter',fecha) as TRIMESTRE,
		to_char(avg(importe),'LFM999,999,999.99') as "PROMEDIO",
		count(numprestamo) AS "TOTAL PRESTAMOS"
		
from prestamo natural join sucursal

group by estado,
		 nombresucursal,
		 extract(year from fecha),
		 date_part('quarter',fecha)		 
order by 1,2,3,4;

-- CON THETA JOIN

select
		estado,	
		nombresucursal,
		extract(year from fecha) as AÑO,
		date_part('quarter',fecha) as TRIMESTRE,
		to_char(avg(importe),'LFM999,999,999.99') as "PROMEDIO",
		count(numprestamo) AS "TOTAL PRESTAMOS"
		
from prestamo p join sucursal s on p.numsucursal = s.numsucursal

group by estado,
		 nombresucursal,
		 extract(year from fecha),
		 date_part('quarter',fecha)		 
order by 1,2,3,4;
