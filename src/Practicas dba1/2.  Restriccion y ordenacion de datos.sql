--1) Sacar un informe que muestre el apellido y salario de los empleados que ganen más de $12.000.

select last_name, salary
from hr.employees
where salary > 12000;

--2) Crear un informe que muestre el apellido y el numero de departamento para el numero de empleado 176.

select employee_id, last_name, department_id from hr.employees
where employee_id = 176;

--3) Se necesita encontrar los empleados con salarios tanto altos como bajos

select last_name, salary from hr.employees
where salary not between 5000 and 12000;

--4) Crear un informe para mostrar el apellido, ID de cargo y fecha de contratacion de los empleados cuyos apellidos sean Matos y Taylor. Ordene la consulta en orden asc por fecha de contratacion.

select last_name, job_id, hire_date from hr.employees
where last_name in ('Taylor','Matos') -- uso de [IN] para buscar regitros con determinadas coincidencias son Case Sensitive, deben ser exactamente igual.
order by hire_date asc;

--5) Mostrar el apellido y el ID de los deptos de todos los empleados de los deptos 20 y 50 en orden alfabetico asc por nombre

select department_id, last_name from hr.employees
where department_id in (20,50)
order by last_name asc;

--6) Mostrar el apellido y salario de los empleados que ganan entre 5.000 y 12.000 usd y estan en el depto 20 o 50. etiquete las columnas

select last_name empleado, salary "Sueldo Mensual"
from hr.employees
where salary between 5000 and 12000
and department_id in (20,50);

--7) Generar un informe que muestre el apellido y la fecha de contratacion de los empleados en el año 2003
select last_name, hire_date from hr.employees
where hire_date like '03';

--8) Crear un informe de todos los empleados y sus puestos de trabajo que no tienen un supervisor
select last_name, job_id from hr.employees
where manager_id is null;

--9) Crear un informe para mostrar el apellido, salario y comision de todos los empleados que perciben comisiones de su salario. ordenar los datos de forma desc respecto del salario y comisiones
select last_name, salary, commission_pct from hr.employees
where commission_pct is not null
order by 2 desc, 3 desc;

--10) Mostrar un informe sobre el apellido y el salario de los empleados que ganen mas que una cantidad introducida por el usuario

select last_name, salary from hr.employees
where salary > &sal_amt -- el simbolo prefijo ampersand en la variable lo uso para solicitar valores de entrada al usuario
order by salary asc;

--11) crear una consulta que solicite al usuario una ID de supervisor y genere el ID de empleado, apellido, salario y depto de empleados de un supervisor,
--el depto desea ordenar el informe en una columna seleccionada.

select employee_id, last_name, salary, department_id from hr.employees
where manager_id = &mgr_id
order by &order_col;

--12)Mostrar todos los apellidos de los empleados en los que la tercera letra sea una "a"
 
 select last_name from hr.employees
 where last_name like'__%a'; --Los guion bajos son lugares antes de "%a" 
 
 --13) Mostrar los apellidos que tengan una "a" y una "e" en su apellido. No interesa el lugar que ocupen las letras
 
 select last_name from hr.employees 
 where last_name like '%a%'  
 and last_name like '%e%';

--14) Mostrar el apellido, cargo y salario de todos los empleados que sean vendedores u oficinistas en el depto de stock cuyos salarios no sean 2500,3000 o 7000 usd

select last_name, job_id, salary from hr.employees
where job_id in('SA_REP','ST_CLERK');

--15) Mostrar el apellido, salario y comision de todos los empleados cuya comision sea del 20%

select last_name, salary, commission_pct from hr.employees
where commission_pct = 0.2;
