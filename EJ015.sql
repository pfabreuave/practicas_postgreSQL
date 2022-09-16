/*
EJ015
Extraer la mayor cantidad de informacion de la fecha en que se otorgaron los prestamos
utilizando las funciones incorporadas de PostgreSQL
*/
select *,
		to_char(fecha,'yyyy') as año4,
		to_char(fecha,'yy') as año2,
		to_char(fecha,'month') as mes,
		to_char(fecha,'MONTH') as "MES",
		to_char(fecha,'Month') as "Mes",
		to_char(fecha,'MON') as "MON",
		to_char(fecha,'mon') as mon,
		to_char(fecha,'Mon') as "Mon",		
		to_char(fecha,'MM') as "numero_Mes",
		to_char(fecha,'day') as "dia_minuscula",
		to_char(fecha,'DAY') as "DIA",
		to_char(fecha,'Day') as "Dia",
		to_char(fecha,'DY') as "DIA3",
		to_char(fecha,'dy') as dia3,
		to_char(fecha,'Dy') as "Dia3",
		to_char(fecha,'DD') as dia_mes,
		to_char(fecha,'DDD') as dia_año,
		to_char(fecha,'Q') as trimestre,
		to_char(fecha,'W') as semana_mes,
		to_char(fecha,'WW') as semana_año
from prestamo;		