-- #1 Consultar fecha de sistema

/*
SELECT sysdate "Date" -- mostrar la fecha actual del servidor
FROM dual; 
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 --#2 Mostrar salario de cada empleado aumentado en un 15,5% en numeros enteros
 
/*
SELECT employee_id, last_name, salary, 
ROUND (salary * 1.155, 2) "New Salary" --ROUND expresa el resultado en numero entero, Su sintaxis es: round(numero, cantidad_de_decimales);

FROM hr.employees;
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--#4 diferencia de salario nuevo y viejo
/*
SELECT employee_id, last_name, salary, 
ROUND (salary * 1.155, 0) "New Salary" , --ROUND expresa el resultado en numero entero, Su sintaxis es: round(numero, cantidad_de_decimales);
ROUND (salary * 1.155,0) - salary "Increase"

FROM hr.employees;
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- #5 Mostrar apellido con primer letra en mayúsculas  y la longitud de cada nomnre que comiencen por las letras "A" "J" "M" ordenados por apellido
/*
SELECT INITCAP(last_name) "Name", -- primer letra en mayusculas
LENGTH (last_name) "Length" -- muestra la longitud en cantidad de caracteres.

FROM hr.employees

WHERE last_name LIKE 'J%' -- LIKE que contenga. J% que comience con..; %J que termine con..;
OR    last_name  LIKE'M&'
OR    last_name LIKE '%N'

ORDER BY last_name; -- Ordenado a partir de..;
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- #5b
/*
SELECT INITCAP(last_name) "Name",
LENGTH (last_name) "Length"

FROM hr.employees

WHERE last_name LIKE UPPER ('&start_letter%') -- UPPER convierte todo lo que ingresa el usu a mayúsculas
ORDER BY last_name;
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--#6 
/*
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) MONTHS_WORKED -- MONTHS_BETWEEN es una función de Fecha
FROM hr.employees

ORDER BY months_worked;
*/