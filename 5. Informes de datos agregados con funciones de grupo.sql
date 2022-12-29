--1) Las funciones de grupo SI funcionan en varias filas para producir un resultado por grupo.
--2) Las funciones de grupo NO incluyen valores nulos en los cálculos.
--3) La cláusula [WHERE] SI restringe las filas antes de incluirlas en un cálculo de grupo.

--4) Encontarr el valor máx, min,sum y media de todos los salarios
/*
select  round(max(salary), 0) as Máximo,
        round(min(salary), 0) as Mínimo,
        round(sum(salary), 0) as Sumatoria,
        round(avg(salary), 0) as Promedio
        
from hr.employees;
        */
--5) Encontarr el valor máx, min,sum y media de todos los salarios agrupapos por tipo de cargo
/*
select job_id,     round(max(salary),0) as "Salario Máximo",
                   round(min(salary),0) as "Salario Mínimo",
                   round(sum(salary),0) as "Sumatoria salarios", --el alias un campo no puede tener mas de 30 caracteres
                   round(avg(salary),0) as "Salario promedio"
from hr.employees
group by job_id;
*/
--6) Agrupar el cantidad de personas con el mísmo cargo
/*
select job_id "Cargo", count(*) "N° de empleados"
from hr.employees
group by job_id;
*/
--6.b) generalizar ejN°6 para preguntar al User de RRHH cual es su puesto
/*
select job_id, count(*)
from hr.employees
where job_id = '&job_title' -- preguntar como hacer para que la entrada no sea Case Sensitive
group by job_id; 
*/
--7)Determinar n° de gestores sin enumerar en una lista.
/*
select count(distinct manager_id) "cantidad de gestores" -- mostrame la cantidad de gestores del campo "manager_id" que no esten repetidos
from hr.employees;
*/
--8) mostrar diferencia entre los salarios mas altos y mas bajos
/*
select max(salary) - min(salary) as "Dif entre sal max y min"
from hr.employees;
*/
--9) crear un informe p/ mostrar n° de gestor y salario del menor sueldo de ese gestor, excluir val Null, excl cualq grupo en el que el salario minimo sea menor a 6000usd. ordenar en forma descendente.
/*
select manager_id, min(salary) from hr.employees where manager_id is not null --mostrame los campos [manager_id] y los salarios minimos del campo [salary]
group by manager_id -- agrupalos por [manager_id]
having min(salary) > 6000 -- teniendo en cuenta que los salarios mínimos sean mayores a 6000
order by min(salary) desc; -- ordenar los salarios minimos de manera descendente.
*/