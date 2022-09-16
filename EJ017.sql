/*  
EJ017
-- Aplicar algunas modificaciones basicas a la fechas (sumas/restar: dias, meses y años)
*/

select 
		fecha + 15 as sum_dias,
		date(fecha + interval '2 month') as sum_mes,
		date(fecha + interval '3 year') as sum_año,
		date(fecha + interval '4 day') as sum_dias,
		date(fecha + interval '3 year 2 month 4 day') as sum_3yy_2MM_4DD,
		fecha + interval '3 year 2 month 4 day 8 hour' as sum_3yy_2MM_4DD_8Hr,
		now() + interval '3 year 2 month 4 day 8 hour 5 minute' as sum_3yy_2MM_4DD_8Hr_5m,
		current_date - fecha as resta_fecha
from cuenta;
