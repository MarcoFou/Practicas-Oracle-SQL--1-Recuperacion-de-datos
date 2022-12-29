--1) consultar en dpto de RRHH las direcciones de todos los deptos. usando la tablas LOCATIONS y COUNTRIES.
/*
select location_id, street_address, city, state_province, country_name
from hr.locations
natural join hr.countries;
*/
--2) hacer informe de todos los empleados, consultar: apellido,nombre y num de depto de todos los empleados.
/*
select last_name, department_id, department_name
from hr.employees
join hr.departments
using (department_id) -- en este caso es conveniente usar la cláusula [USING] ya que ambas tablas contienen un campo que se llaman igual, si los campos se llaman distinto se debe usar ON 
order by last_name;
*/
--3) Se necesita un informe de todos los empleados de Toronto, mostrar el apellido, cargo, num y nombre de sus respect. deptos.
/*
select e.last_name, e.job_id, e.department_id, d.department_name
from hr.employees e join hr.departments d
on (e.department_id = d.department_id) --parámetro de enlace entre los campos que contienen las tablas involucradas
join hr.locations l
on (d.location_id = l.location_id)   --parámetro de enlace entre los campos que contienen las tablas involucradas
where lower (l.city) = 'toronto'; --[WHERE LOWER()] convierte a minúsculas el argumento para que no haya problemas con el segundo miembro de la condicion de igualdad  
*/
--4) crear un informe para mostrar el apellido y num de empleado JUNTO con el apellido y numero de gestor de sus gestores
/*
select w.last_name "Employee", w.employee_id"EMP#", m.last_name "Manager", m.employee_id "Mgr#"
from hr.employees w join hr.employees m
on (w.manager_id = m.employee_id) -- parametro de enlace de los campos de las tablas involucradas
order by  w.last_name asc;
*/
--5) crear un informe para mostrar el apellido y num de empleado JUNTO con el apellido y numero de gestor de sus gestores
/*
select w.last_name "Employee", w.employee_id"EMP#", m.last_name "Manager", m.employee_id "Mgr#"
from hr.employees w 
left outer join hr.employees m --Uso left join para "employees m" para que incluya dentro de la union a King que no tiene designado un manager.
on (w.manager_id = m.employee_id) -- parametro de enlace de los campos de las tablas involucradas
order by 2;
*/
--6) cree un informe del dpto de rrhh que muestre los apellidos y num de empleados y todos los empleados que trabajen con el mismo dpto como un empleado determinado.
/*
select e.department_id departamento, e.last_name empleado, c.last_name colega
from hr.employees e join hr.employees c
on(e.department_id = c.department_id)
where e.employee_id <> c.employee_id --sus respectivos ID de empleados deben ser distintos
order by e.department_id, e.last_name, c.last_name;
*/
-- 7)cree una consulta que muestre el apellido, cargo, nombre de departamento, salario y grado de todos los empleados.
--TENGO UN PROBLEMA CON ESTE EJ. NO TENGO EL CAMPO JOB_GRADES EN MI BASE DE DATOS HR
/*
desc job_grades;
select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
from hr.employees e join HR.DEPARTMENTS d
on (e.departments_id = d.departments_id)
join hr.job_grades j
on (e.salary between j.lowest_sal and j.highest_sal);
*/
--8) Cree una consulta para mostrar el nombre y la fecha de contratación de cualquier empleado contratado después del empleado Davies.
/*
select e.last_name"Empleado", e.hire_date"Fecha de contratacion" -- seleccioname los nombres de empleados
from hr.employees e join hr.employees Davies -- defino el alias para el tratamiento de mis tablas
on(davies.last_name = 'Davies') -- para el campo "last_name" que contenga en su registro "Davies"
where davies.hire_date < e.hire_date; -- donde la fecha de contratacion sea menor a la fecha de contratacion de los empleados
*/
--9)buscar el nombre y la fecha de contratación de todos los empleados contratados antes que sus gestores, junto con el nombre y fecha de contratación del gestor
/*
select w.last_name"Empleado", w.hire_date"F.Contr. Empleado", m.last_name"Manager", m.hire_date"F.contr. Manager"
from hr.employees w join hr.employees m
on (w.manager_id = m.employee_id)
where w.hire_date < m.hire_date;































