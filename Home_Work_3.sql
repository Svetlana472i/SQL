CREATE DATABASE IF NOT EXISTS home_work_3;
USE home_Work_3;
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT *
FROM staff; 

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания
SELECT *
FROM staff
ORDER BY salary DESC; 

-- Отсортируйте данные по полю заработная плата (salary) в порядке: возрастания
SELECT *
FROM staff
ORDER BY salary ASC; 

-- Выведите 5 максимальных заработных плат (salary)
SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5; 

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, 
SUM(salary) AS "Суммарная зарплата"
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(DISTINCT id) AS "Количество рабочих в возрасте от 24 до 49 лет включительно"
FROM staff
WHERE age >=24 and age <= 49 AND post = "Рабочий";


-- Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS "Количество специальностей"
FROM staff;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет (включительно)
SELECT post AS "Специальность", AVG(age) AS "Средний возраст"
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;