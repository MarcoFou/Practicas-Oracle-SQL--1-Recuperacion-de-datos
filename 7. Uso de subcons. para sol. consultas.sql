--1) Si el usuario introduce Zlotkey buscar todos los empleados que trabajen con Zlotkey excepto Zlotkey

--define enter_name = 'Zlotkey' -- define y almacena un valor a una variable de sustitucion sin pedirla al usuario
undefine enter_name -- se usa [UNDEFINE] Para borrar una variable de usuario ya ingresada y almacenada en memoria.

select last_name, hire_date from hr.employees
where department_id =(select department_id from hr.employees
                      where last_name = '&&enter_name') /*El doble ampersand && se usa para reutilizar el valor de una variable,
                                                        sin tener que preguntar al usuario cada vez, es decir queda almacenada en memoria.
                                                        SQL*Plus almacena el valor, haciendo uso del comando DEFINE; lo usará de nuevo
                                                        siempre que se referencie el nombre de la variable. Para eliminar una variable de usuario se usa UNDEFINE*/
and last_name <> '&enter_name';

--2)Cree un informe que miestre el num de empleado, apellido y salario de todos los empleados que ganan mas del salario medio, ordenar asc por campo salario

select employee_id, last_name, salary from hr.employees
where salary > (select avg(salary) from hr.employees)
order by salary asc;

--3)muestre el número de empleado y el apellido de todos los empleados que trabajan en un departamento con un empleado cuyo apellido contiene una "u".

select employee_id, last_name from hr.employees
where department_id in (select department_id from hr.employees
                        where last_name like '%u%');
                        
--4) Se necesita un informe que muestre el apellido, número de departamento e ID de cargo de todos los empleados cuyo ID de ubicación de departamento sea 1700.

select last_name, department_id, job_id from hr.employees
where department_id in (select department_id from hr.departments
                        where location_id = &Ingresar_Ubicacion)
order by 2;

--5 Cree un informe para el departamento de recursos humanos que muestre el apellido y el salario de cada empleado que realice informes para King.

select last_name, salary from hr.employees 
where  manager_id = (select employee_id from hr.employees
                     where last_name = 'King' and manager_id is null); -- le puse la restriccion manager id is not null porque tengo dos empleados de apellido king de los que uno es manager y el otro no.
            
/*SELECT LAST_NAME FROM HR.EMPLOYEES
WHERE MANAGER_ID IS NULL;*/

--6) Cree un informe para el departamento de recursos humanos que muestre el número de departamento, apellido e ID de cargo de cada empleado del departamento Executive.

select department_id, last_name, job_id from hr.employees
where department_id in(select department_id from hr.departments
                       where department_name = 'Executive');

--7) Cree un informe que muestre una lista de todos los empleados cuyo salario sea mayor que el salario de los empleados del departamento 60.

select last_name from hr.employees
where salary > any (select salary from hr.employees
                    where department_id=60)
order by 1 asc;

--8) mostrar el número de empleado, apellido y salario de todos los empleados que ganan más del salario medio y que trabajan en un departamento con cualquier empleado cuyo apellido contiene una "u".

select employee_id, last_name, salary from hr.employees
where department_id in (select department_id from hr.employees
                        where last_name like '%u%')
                        and salary > (select avg(salary) from hr.employees);                  