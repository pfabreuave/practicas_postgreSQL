/*
EJ020

Obtener toda la informacion de las cuentas que se otorgaron en las sucursales
ubicadas en MICHOACAN, QUINTANA ROO Y YUCATAN, desde 2013 AL 2015 durante los
dias lunes, miercoles o viernes

*/
-- NATURAL JOIN
select *
from cuenta natural join sucursal
where estado in ('YUCATAN', 'QUINTANA ROO', 'MICHOACAN') and
	  extract('year' from fecha) between 2013 and 2015 and
	  extract('month' from fecha) in (1,4,7,10) and
	  extract('dow' from fecha) in (1,3,5);
	  

-- THETA JOIN
select cuenta.*
from cuenta join sucursal on cuenta.numsucursal = sucursal.numsucursal
where estado in ('YUCATAN', 'QUINTANA ROO', 'MICHOACAN') and
	  extract('year' from fecha) between 2013 and 2015 and
	  extract('month' from fecha) in (1,4,7,10) and
	  extract('dow' from fecha) in (1,3,5);

-- THETA JOIN (mejorado)
select cuenta.*
from cuenta join sucursal on cuenta.numsucursal = sucursal.numsucursal and
	 estado in ('YUCATAN', 'QUINTANA ROO', 'MICHOACAN') and
	 extract('year' from fecha) between 2013 and 2015 and
	 extract('month' from fecha) in (1,4,7,10) and
	 extract('dow' from fecha) in (1,3,5);


