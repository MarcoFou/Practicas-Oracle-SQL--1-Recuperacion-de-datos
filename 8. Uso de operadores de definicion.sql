--1)sacar una lista de ID de departamentos que no contienen el ID de de cargo ST_CLERK. Utilice los operadores de definicion para crear este informe,

select department_id from hr.departments
minus --[MINUS] Trae todos los registros que NO COINCIDAN entre las dos tablas
select department_id from hr.employees
where job_id = 'ST_CLERK';

--2)El departamento de recursos humanos necesita una lista de países que no tienen ningún departamento. Muestre el ID de país y el nombre de los países. Utilice los operadores de definición para crear este informe.

select country_id, country_name from hr.countries
minus --RECORDAR QUE: [MINUS] Trae todos los registros que NO COINCIDAN entre las dos tablas, por lo tanto:
select l.country_id, c.country_name 
from HR.LOCATIONS l join HR.COUNTRIES c on (l.country_id = c.country_id)
join hr.departments d on (d.location_id = l.location_id);

--3) Cree una lista de cargos para los departamentos 10,50 y 20 en ese orden, muestre los ID de los cargos, y departamentos mediante los op. de definicion.

select distinct job_id, department_id from hr.employees
where department_id = 10
union all                                                           --[UNION ALL] trae los registros entre 2 tablas con los duplicados 
select distinct job_id, department_id from hr.employees
where department_id = 50
union all                                                           --[UNION ALL] trae los registros entre 2 tablas con los duplicados 
select distinct job_id, department_id from hr.employees
where department_id = 20;

--4) Cree un informe que muestre los ID de empleado y de cargo de los empleados que actualmente tienen un puesto que es el mismo que tenían cuando fueron contratados (es decir, han cambiado de cargo pero ahora han vuelto a su puesto original).

select employee_id, job_id from hr.employees
intersect                                                           --[INTERSECT] Trae solo los registros duplicados entre las 2 tablas
select employee_id, job_id from hr.job_history;

/*5) El departamento de recursos humanos necesita un informe con las siguientes especificaciones:
# ID de departamento y apellido de todos los empleados de la tabla EMPLOYEES, independientemente de si pertenecen o no a un departamento.
# El nombre e ID de departamento de todos los departamentos de la tabla DEPARTMENTS, independientemente de si hay o no empleados trabajando en dichos departamentos. Para ello, escriba una consulta compuesta. */

select last_name, department_id, to_char(null) from hr.employees
union                                                               -- [UNION] trae los registros entre 2 tablas sin los duplicados
select to_char(null), department_id, department_name from hr.departments;