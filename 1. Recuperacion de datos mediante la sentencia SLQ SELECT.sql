--4) Determinar la estructura y contenido de la tabla DEPARTMENTS
describe hr.departments; --para determinar la estructura de la tabla
select * from hr.departments; --para ver los datos de la tabla

--5) Determinar estructura de la tabla EMPLOYEES
describe hr.employees;
select employee_id "IdentifEmpleado", last_name apellido, job_id "identifTrabajo", hire_date "fechaDeEntrada" from hr.employees;

--7) consulta para mostrar todos los ID de cargo únicos de la tabla EMPLOYEES

select distinct job_id "workID", last_name"Empleado", salary"Sueldo" from hr.employees; --[DISTINCT] Hace que los datos que estan repetidos se tengan en cuenta solo una única vez.

--9) Concatenar Apellido e ID de trabajo separados por una coma y un espacio

select last_name||', ' ||job_id as "Empleado y Cargo" 
from hr.employees;

--10) Mostrar todos los datos de la tabla EMPLOYEES separados por una coma y un espacio
select employee_id|| ',' ||first_name|| ', ' ||last_name|| ', ' ||email|| ', ' ||phone_number|| ', '||hire_date|| ', ' ||job_id|| ', ' ||salary|| ', ' ||commission_pct|| ', ' ||manager_id|| ', ' ||department_id||'.' as "The Output"
from hr.employees;