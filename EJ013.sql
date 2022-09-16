/*
EJ013
Extraer la mayor cartidad de informacion de la fecha en que se otorgaron los prestamos
utilizando LA FUNCION EXTRACT
*/

/*
A função extract() é usada para recuperar subcampos como ano ou hora de valores de data/hora. 
A origem deve ser uma expressão de valor do tipo timestamp, time ou interval. O campo é um 
identificador ou string que seleciona qual campo será extraído do valor de origem
*/

select *, 
	   extract(year from fecha) año,
	   extract(month from fecha) mes,
	   extract(day from fecha) dia,
	   extract(quarter from fecha) trim,
	   extract(century from fecha) siglo,
	   extract(dow from fecha) dia_sem,    -- 0 corresponde al domingo va de 0 a 6
	   extract(isodow from fecha) dia_sem, -- 7 corresponde al domingo va de 1 a 7
	   extract(doy from fecha) dia_año,
	   extract(week from fecha) sem_año
from prestamo;