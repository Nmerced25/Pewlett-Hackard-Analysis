-- Use Dictinct with Orderby to remove duplicate rows
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO Mod_challenge_table
FROM employees as employees
LEFT JOIN titles as titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC;

Select * From Mod_challenge_table

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (modtable.emp_no) modtable.emp_no,
modtable.first_name,
modtable.last_name,
modtable.title

INTO unique_titles
FROM mod_challenge_table AS modtable
WHERE (modtable.to_date BETWEEN '9999-01-01' AND '9999-01-01')
ORDER BY modtable.emp_no, modtable.from_date DESC;

SELECT * FROM unique_titles

DROP TABLE retiring_titles

--COUNT THE NUMBER OF RETIREES BY JOB TITLE
SELECT COUNT (uniquetitles.emp_no), uniquetitles.title
INTO retiring_titles
FROM unique_titles AS uniquetitles
GROUP BY uniquetitles.title 
ORDER BY COUNT DESC

SELECT * FROM retiring_titles

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept.from_date,
dept.to_date,
title.title
INTO mentorship
FROM employees AS employees
LEFT JOIN dept_emp AS dept
ON (eemployees.emp_no = dept.emp_no)
LEFT JOIN titles AS titles
ON (employees.emp_no = titles.emp_no)
WHERE (dept.to_date BETWEEN '9999-01-01' AND '9999-01-01')
AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no

SELECT * FROM mentorship
