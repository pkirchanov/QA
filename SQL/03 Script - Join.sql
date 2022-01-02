select * from employee_salary;
select * from roles_employee;
select * from employees;
select * from roles;
select * from salary;

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

select employees.employee_name, salary.monthly_salary from employee_salary
join employees on employee_id = employees.id
join salary on salary_id = salary.id;

-- �������� ������

select E.employee_name, S.monthly_salary from employee_salary
join employees E on employee_id = E.id
join salary S on salary_id = S.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.

select employees.employee_name, salary.monthly_salary from employee_salary 
join employees on employee_id = employees.id
join salary on salary_id = salary.id
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select r.role_name, e.employee_name, s.monthly_salary from roles r
full join roles_employee re on re.role_id = r.id 
full join employees e on e.id = re.employee_id 
full join employee_salary es on es.employee_id = e.id
full join salary s on s.id = es.salary_id 
where e.employee_name is null and s.monthly_salary is not null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select r.role_name, e.employee_name, s.monthly_salary from roles r
full join roles_employee re on re.role_id = r.id 
full join employees e on e.id = re.employee_id 
full join employee_salary es on es.employee_id = e.id
full join salary s on s.id = es.salary_id 
where s.monthly_salary < 2000 and e.employee_name is null;

-- 5. ����� ���� ���������� ���� �� ��������� ��.

select e.employee_name, s.monthly_salary from roles r
full join roles_employee re on re.role_id = r.id 
full join employees e on e.id = re.employee_id 
full join employee_salary es on es.employee_id = e.id
full join salary s on s.id = es.salary_id 
where s.monthly_salary is null and e.employee_name is not null;

-- 6. ������� ���� ���������� � ���������� �� ���������.

select employees.employee_name, roles.role_name from roles_employee
join roles on roles.id = role_id 
join employees on  employees.id = employee_id;

-- 7. ������� ����� � ��������� ������ Java �������������.

select employees.employee_name, roles.role_name from roles_employee
join roles on roles.id = role_id 
join employees on  employees.id = employee_id  
where role_name = 'Junior Java developer' or role_name = 'Middle Java developer' or role_name = 'Senior Java developer';

-- 8. ������� ����� � ��������� ������ Python �������������. (� ������� in)

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name in ('Junior Python developer', 'Middle Python developer', 'Senior Python developer');

-- 9. ������� ����� � ��������� ���� QA ���������.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%QA engineer%';

-- 10. ������� ����� � ��������� ������ QA ���������.

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Manual QA%';

-- 11. ������� ����� � ��������� ��������������� QA

select employees.employee_name, roles.role_name from roles_employee
join employees on employees.id = employee_id
join roles on roles.id = role_id
where role_name like '%Automation QA%';

-- 12. ������� ����� � �������� Junior ������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

-- 13. ������� ����� � �������� Middle ������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Middle%';

-- 14. ������� ����� � �������� Senior ������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Senior%';

-- 15. ������� �������� Java �������������

select distinct r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Java developer%';

-- 16. ������� �������� Python �������������

select distinct r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Python developer%'; 

-- 17. ������� ����� � �������� Junior Python �������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Junior Python developer%';

-- 18. ������� ����� � �������� Middle JS �������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Middle JavaScript developer%';

-- 19. ������� ����� � �������� Senior Java �������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name in ('Senior Java developer');

-- 20. ������� �������� Junior QA ���������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
--where role_name in ('Junior Manual QA engineer', 'Junior Automation QA engineer');
where role_name like '%Junior%QA%';

-- 21. ������� ������� �������� ���� Junior ������������

select r.role_name, e.employee_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Junior%';

-- 22. ������� ����� ������� JS �������������

select sum(s.monthly_salary) as "Sum salaries of all JavaScript developers" from roles r 
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%JavaScript%';

-- 23. ������� ����������� �� QA ���������

select min(s.monthly_salary) as "Min salary of QA engieers" from roles r 
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%QA engineer%';

-- 24. ������� ������������ �� QA ���������

select max(s.monthly_salary) as "Max salary of QA engieers" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%QA engineer%';

-- 25. ������� ���������� QA ���������

select count(*) as "number of QA engineers" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%QA engineer%';

-- 26. ������� ���������� Middle ������������.

select count(*) as "number of Middle" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%Middle%';

-- 27. ������� ���������� �������������

select count(*) as "number of developers" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%developer%';

-- 28. ������� ���� (�����) �������� �������������.

select sum(s.monthly_salary) as "Sum salary of all Dev" from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id 
where role_name like '%developer%';

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
order by s.monthly_salary ;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary >= 1700 and s.monthly_salary <=2300
order by s.monthly_salary ;

-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary <=2300
order by s.monthly_salary ;

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select e.employee_name, r.role_name, s.monthly_salary from roles r
join roles_employee re on re.role_id = r.id 
join employees e on e.id = re.employee_id 
join employee_salary es on es.employee_id = e.id
join salary s on s.id = es.salary_id
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary ;

