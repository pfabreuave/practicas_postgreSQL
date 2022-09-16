/*  no resuelto
EJ016
Obtener la cantidad de tiempo que han permanecido abiertas las cuentas al dia de hoy,
en terminos de dias, meses y años
*/

select *,
		extract(year from now()) - extract(year from fecha) cant_años,
		age(current_date,fecha) as tiempo
from cuenta;
