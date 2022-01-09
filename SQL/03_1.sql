
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employee_salary
join employees on employee_id = employees.id
join salary on salary_id = salary.id;

select  employee_name, monthly_salary from employee_salary 
join employees 
on employee_salary.employee_id = employees.id
join salary 
on employee_salary.salary_id=salary.id;


-- короткая запись

select E.employee_name, S.monthly_salary from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employee_name, salary.monthly_salary from employee_salary 
join employees on employee_id = employees.id
join salary on salary_id = salary.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

--Только зп назначенная айди сотрудника без имени

select e.employee_name, s.monthly_salary from employee_salary es
left join employees e on e.id = es.employee_id
join salary s on es.salary_id = s.id 
where e.employee_name is null;

-- Никому не назначенная зп

select e.employee_name, s.monthly_salary from employees e
join employee_salary es on e.id = es.employee_id
right join salary s on es.salary_id = s.id 
where e.employee_name is null and s.monthly_salary is not null;

-- все зп без сотрудников

select e.employee_name, s.monthly_salary from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id 
where e.employee_name is null and s.monthly_salary is not null;

--Вывел зп которая назанчена не существующему сотруднику 71 и которая никому не назначена

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select e.employee_name, s.monthly_salary from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id 
where e.employee_name is null and s.monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.

select e.employee_name, s.monthly_salary 
from employees e
full join employee_salary es on e.id = es.employee_id
full join salary s on es.salary_id = s.id 
where s.monthly_salary is null and e.employee_name is not null;

-- 6. Вывести всех работников с названиями их должности.

select employees.employee_name, roles.role_name from roles_employee
join roles on roles.id = role_id 
join employees on  employees.id = employee_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employees.employee_name, roles.role_name from roles_employee
join roles on roles.id = role_id 
join employees on  employees.id = employee_id  
where role_name = 'Junior Java developer' or role_name = 'Middle Java developer' or role_name = 'Senior Java developer';

-- 8. Вывести имена и должность только Python разработчиков. (С помощью in)

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name in ('Junior Python developer', 'Middle Python developer', 'Senior Python developer');

-- 9. Вывести имена и должность всех QA инженеров.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%QA engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков

select distinct r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Java developer%';

-- 16. Вывести зарплаты Python разработчиков

select distinct r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Python developer%'; 

-- 17. Вывести имена и зарплаты Junior Python разработчиков

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name like '%Junior Python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name like '%Middle JavaScript developer%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
where role_name in ('Senior Java developer');

-- 20. Вывести зарплаты Junior QA инженеров

select r.role_name, e.employee_name, s.monthly_salary from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
left join employee_salary es on es.employee_id = e.id
left join salary s on s.id = es.salary_id 
--where role_name in ('Junior Manual QA engineer', 'Junior Automation QA engineer');
where role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(s.monthly_salary) as "Average salary of all Juniors" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(s.monthly_salary) as "Sum salaries of all JavaScript developers" from roles r 
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(s.monthly_salary) as "Min salary of QA engieers" from roles r 
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%QA engineer%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(s.monthly_salary) as "Max salary of QA engieers" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%QA engineer%';

-- 25. Вывести количество QA инженеров

select count(*) as "number of QA engineers" from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
where role_name like '%QA engineer%';

-- 26. Вывести количество Middle специалистов.

select count(*) as "number of Middle" from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
where role_name like '%Middle%';


-- 27. Вывести количество разработчиков

select count(*) as "number of developers" from roles r
left join roles_employee re on re.role_id = r.id 
left join employees e on e.id = re.employee_id 
where role_name like '%developer%';

select count(employees.employee_name)
from employees
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where roles.role_name like '%developer';

select count(roles.role_name)
from roles_employee 
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(s.monthly_salary) as "Sum salary of all Dev" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
order by s.monthly_salary ;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary >= 1700 and s.monthly_salary <=2300
order by s.monthly_salary asc;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary < 2300
order by s.monthly_salary ;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary ;

