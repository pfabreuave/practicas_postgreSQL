/*
EJ003
Obtener la informacion de las cuentas cuyo saldo
se encuentre entre $16,000 y $58,000 y se encuentren
asignadas en alguna de las siguientes sucursales:
62 (OCOTLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
*/

select * from cuenta
where saldo >= 16000 and saldo <= 58000 and numsucursal in (62,171,173);

/* 
Consulta incluyendo los limites usando el operador between(comparacion),
tambien podria ser negado para obtener los que no cumplen la condicion
not between y el not in
*/
select * from cuenta
where saldo between 16000 and 58000 and numsucursal in (62,171,173);

select * from cuenta
where saldo not between 16000 and 58000 and numsucursal not in (62,171,173);
