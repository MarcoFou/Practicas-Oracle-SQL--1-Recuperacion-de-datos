-- #1 crear un informe
/*
SELECT last_name || ' gana  ' 
                 || TO_CHAR (salary, 'fm$99,999.00')
                 || ' mensuales pero piden ' 
                 || TO_CHAR (salary * 3, 'fm$99,999.00')
                 || '.' "Dream Salaries"
                
FROM hr.employees;
*/

-- #2 Primer mes despues de seis meses de contrato
/*
SELECT last_name, hire_date,
        TO_CHAR(NEXT_DAY(ADD_MONTHS (hire_date, 6),'LUNES'),'fmDAY, "the" Ddspth "of" Month, YYYY') REVIEW
        
FROM hr.employees; 
*/

-- #4 uso del NVL
/*
SELECT last_name, 
        NVL(TO_CHAR(commission_pct), 'No Commission') COMM --NVL si no hay datos sobre la consulta entonces rellena con ''
FROM hr.employees;
*/

--#5 Uso de DECODE: mostrar el grado de los empleados segun el valor de JOB ID. (es exclusivo de oracle)
/*
SELECT last_name, job_id, decode(job_id, 
                    'ST_CLERK', 'E',
                    'SA_REP',    'D',
                    'IT_PROG',  'C',
                    'ST_MAN',   'B',
                    'AD_PRES',  'A',
                                '0') GRADE
FROM hr.employees
ORDER BY job_id;
*/

-- 6 Uso de CASE
/*
SELECT job_id, CASE job_id
                WHEN 'ST_CLERK' THEN 'E'
                WHEN 'SA_REP' THEN 'D'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'AD_PRESS'THEN'A'
                ELSE'0' END GRADE
                
FROM hr.employees;

*/