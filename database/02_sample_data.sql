INSERT INTO departments (department_name) VALUES ('Human Resources');
INSERT INTO departments (department_name) VALUES ('Finance');
INSERT INTO departments (department_name) VALUES ('IT');
INSERT INTO departments (department_name) VALUES ('Sales');

INSERT INTO job_titles (job_title, min_salary, max_salary) VALUES ('Manager',    5000, 9000);
INSERT INTO job_titles (job_title, min_salary, max_salary) VALUES ('Specialist', 2500, 5000);
INSERT INTO job_titles (job_title, min_salary, max_salary) VALUES ('Developer',  3000, 6000);
INSERT INTO job_titles (job_title, min_salary, max_salary) VALUES ('Accountant', 2500, 5000);

-- مدیران (بدون مدیر مستقیم)
INSERT INTO employees (national_cod,first_name, last_name, email, salary, department_id, job_id)
SELECT '1171111111','Ali', 'Karimi', 'ali.karimi@example.com', 8000, d.department_id, j.job_id
FROM departments d, job_titles j
WHERE d.department_name = 'IT' AND j.job_title = 'Manager';

INSERT INTO employees (national_cod,first_name, last_name, email, salary, department_id, job_id)
SELECT '1171111112','Sara', 'Ahmadi', 'sara.ahmadi@example.com', 7500, d.department_id, j.job_id
FROM departments d, job_titles j
WHERE d.department_name = 'Human Resources' AND j.job_title = 'Manager';

-- کارمندان زیرمجموعه
INSERT INTO employees (national_cod,first_name, last_name, email, salary, department_id, job_id, manager_id)
SELECT '1171111113','Reza', 'Mohammadi', 'reza.mohammadi@example.com', 4500, d.department_id, j.job_id,
       (SELECT employee_id FROM employees WHERE email = 'ali.karimi@example.com')
FROM departments d, job_titles j
WHERE d.department_name = 'IT' AND j.job_title = 'Developer';

INSERT INTO employees (national_cod,first_name, last_name, email, salary, department_id, job_id, manager_id)
SELECT '1171111114','Maryam', 'Hosseini', 'maryam.hosseini@example.com', 3500, d.department_id, j.job_id,
       (SELECT employee_id FROM employees WHERE email = 'sara.ahmadi@example.com')
FROM departments d, job_titles j
WHERE d.department_name = 'Human Resources' AND j.job_title = 'Specialist';

COMMIT;
