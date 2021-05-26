CREATE DATABASE lw11;

USE lw11;

CREATE TABLE `faculty`
(
    `faculty_id` INT AUTO_INCREMENT NOT NULL,
    `abbreviation` VARCHAR(255) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`faculty_id`)
)
    DEFAULT CHARACTER SET utf8mb4
    COLLATE `utf8mb4_unicode_ci`
    ENGINE = InnoDB;

CREATE TABLE `group`
(
    `group_id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `specialty` VARCHAR(255) NOT NULL,
    `faculty_id` INT NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`group_id`)
)
    DEFAULT CHARACTER SET utf8mb4
    COLLATE `utf8mb4_unicode_ci`
    ENGINE = InnoDB;

CREATE TABLE `student`
(
    `student_id` INT AUTO_INCREMENT NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `middle_name` VARCHAR(255),
    `birthdate` DATE NOT NULL,
    `group_id` INT NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`student_id`)
)
    DEFAULT CHARACTER SET utf8mb4
    COLLATE `utf8mb4_unicode_ci`
    ENGINE = InnoDB;

INSERT INTO `faculty` VALUES 
    (DEFAULT, 'ФИиВТ', 'Факультет информатики и вычислительной техники', DEFAULT),
    (DEFAULT, 'РТФ', 'Радиотехнический факультет', DEFAULT),
    (DEFAULT, 'ФСТ', 'Факультет социальных технологий', DEFAULT);

INSERT INTO `group` VALUES 
    (DEFAULT, 'ПС-11', 'Программная инженерия', 1, DEFAULT),
    (DEFAULT, 'ИВТ-22', 'Информатика и вычислительная техника', 1, DEFAULT),
    (DEFAULT, 'БИ-31', 'Информационная безопасность автоматизированных систем', 1, DEFAULT),
    (DEFAULT, 'БТС-11', 'Биотехнические системы и технологии', 2, DEFAULT),
    (DEFAULT, 'РСК-41', 'Радиоэлектронные системы и комплексы', 2, DEFAULT),
    (DEFAULT, 'ИТС-21', 'Инфокоммуникационные технологии и системы связи', 2, DEFAULT),
    (DEFAULT, 'РК-21', 'Реклама и связи с общественностью', 3, DEFAULT),
    (DEFAULT, 'ТУР-31', 'Туризм', 3, DEFAULT),
    (DEFAULT, 'СР-21', 'Социальная работа', 3, DEFAULT);

INSERT INTO `student` VALUES 
    (DEFAULT, 'Баранов', 'Всеволод', 'Константинович', '2003-12-31', 1, DEFAULT),
    (DEFAULT, 'Назаров', 'Гавриил', 'Николаевич', '2001-10-07', 1, DEFAULT),
    (DEFAULT, 'Панина', 'Анна', 'Алексеевна', '2004-05-19', 1, DEFAULT),
    (DEFAULT, 'Глебова', 'Эвелина', 'Александровна', '2003-08-28', 1, DEFAULT),
    (DEFAULT, 'Евдокимова', 'Евгения', 'Геннадьевна', '2000-06-30', 1, DEFAULT),
    (DEFAULT, 'Герасимов', 'Василий', 'Евгеньевич', '2002-07-15', 2, DEFAULT),
    (DEFAULT, 'Коновалов', 'Вадим', 'Алексеевич', '1999-01-04', 2, DEFAULT),
    (DEFAULT, 'Бутусов', 'Иосиф', 'Иванович', '2001-12-23', 2, DEFAULT),
    (DEFAULT, 'Комарова', 'Алиса', 'Александровна', '2000-06-28', 2, DEFAULT),
    (DEFAULT, 'Ульянов', 'Дементий', 'Дмитриевич', '1999-10-29', 2, DEFAULT),
    (DEFAULT, 'Сергеева', 'Серафима', 'Николаевна', '2000-09-07', 3, DEFAULT),
    (DEFAULT, 'Соколова', 'Любовь', 'Сергеевна', '1998-07-09', 3, DEFAULT),
    (DEFAULT, 'Игнатьев', 'Игорь', 'Иванович', '2000-03-14', 3, DEFAULT),
    (DEFAULT, 'Артемьев', 'Максимилиан', 'Александрович', '1999-07-12', 3, DEFAULT),
    (DEFAULT, 'Третьякова', 'Александра', 'Максимовна', '2000-05-08', 3, DEFAULT),
    (DEFAULT, 'Яшин', 'Николай', 'Петрович', '2003-12-09', 4, DEFAULT),
    (DEFAULT, 'Сикора', 'Мартин', NULL, '2001-07-20', 4, DEFAULT),
    (DEFAULT, 'Гришин', 'Дмитрий', 'Павлович', '2003-10-15', 4, DEFAULT),
    (DEFAULT, 'Ефимова', 'Лада', 'Николаевна', '2004-05-16', 4, DEFAULT),
    (DEFAULT, 'Колесникова', 'Жанна', 'Игоревна', '2003-06-19', 4, DEFAULT),
    (DEFAULT, 'Быков', 'Эмиль', 'Дмитриевич', '2000-11-24', 5, DEFAULT),
    (DEFAULT, 'Волкова', 'Екатерина', 'Геннадьевна', '2000-06-01', 5, DEFAULT),
    (DEFAULT, 'Миронов', 'Антон', 'Игоревич', '1998-06-24', 5, DEFAULT),
    (DEFAULT, 'Рожкова', 'Снежана', 'Андреевна', '1997-01-18', 5, DEFAULT),
    (DEFAULT, 'Александров', 'Антон', 'Рудольфович', '2000-01-08', 5, DEFAULT),
    (DEFAULT, 'Лебедев', 'Альберт', 'Артёмович', '2001-12-03', 6, DEFAULT),
    (DEFAULT, 'Кольцова', 'Василиса', 'Викторовна', '2002-09-15', 6, DEFAULT),
    (DEFAULT, 'Черкасов', 'Игнат', 'Андреевич', '1999-04-27', 6, DEFAULT),
    (DEFAULT, 'Артемьева', 'Виталия', 'Олеговна', '2002-08-16', 6, DEFAULT),
    (DEFAULT, 'Гаврилов', 'Ринат', 'Дмитриевич', '2002-02-03', 6, DEFAULT),
    (DEFAULT, 'Соломин', 'Георгий', 'Игоревич', '1999-01-11', 7, DEFAULT),
    (DEFAULT, 'Мордвинов', 'Леонтий', 'Олегович', '1998-11-04', 7, DEFAULT),
    (DEFAULT, 'Калинин', 'Ильдар', 'Викторович', '2001-09-16', 7, DEFAULT),
    (DEFAULT, 'Андреева', 'Олеся', 'Ивановна', '2002-09-13', 7, DEFAULT),
    (DEFAULT, 'Бобров', 'Юрий', 'Максимович', '2000-11-07', 7, DEFAULT),
    (DEFAULT, 'Харламова', 'Лилия', 'Викторовна', '1998-02-10', 8, DEFAULT),
    (DEFAULT, 'Крюкова', 'Ксения', 'Трофимовна', '1998-04-25', 8, DEFAULT),
    (DEFAULT, 'Крюков', 'Лев', 'Николаевич', '2002-03-14', 8, DEFAULT),
    (DEFAULT, 'Бобров', 'Савелий', 'Сидорович', '2002-03-13', 8, DEFAULT),
    (DEFAULT, 'Лавров', 'Сергей', 'Павлович', '2002-03-25', 8, DEFAULT),
    (DEFAULT, 'Репин', 'Григорий', 'Владимирович', '2000-06-15', 9, DEFAULT),
    (DEFAULT, 'Невзоров', 'Алексей', 'Григорьевич', '2000-08-23', 9, DEFAULT),
    (DEFAULT, 'Третьяков', 'Всеволод', 'Максимович', '1998-06-15', 9, DEFAULT),
    (DEFAULT, 'Ковалёва', 'Дарья', 'Алексеевна', '1999-06-24', 9, DEFAULT),
    (DEFAULT, 'Жданова', 'Карина', 'Владимировна', '2000-01-15', 9, DEFAULT);

SELECT
    `first_name`,
    `middle_name`,
    `last_name`,
    `birthdate`,
    (
        (YEAR(CURRENT_DATE) - YEAR(`birthdate`)) -                            
        (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(`birthdate`, '%m%d'))  
    ) AS `age`
FROM
    `student`
WHERE
    (YEAR(CURRENT_DATE) - YEAR(`birthdate`)) -                            
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(`birthdate`, '%m%d')) = 19;
    
SELECT
    student.first_name AS `first_name`,
    student.middle_name AS `middle_name`,
    student.last_name AS `last_name`,
    student.birthdate AS `birthdate`,
    group.name AS `group`
FROM
    `student`
LEFT JOIN
    `group`
ON
    student.group_id = group.group_id
WHERE
    group.name = 'ПС-11';

SELECT
    student.first_name AS `first_name`,
    student.middle_name AS `middle_name`,
    student.last_name AS `last_name`,
    student.birthdate AS `birthdate`,
    faculty.abbreviation AS `faculty`
FROM
    `student`
LEFT JOIN
    `group`
ON
    student.group_id = group.group_id
LEFT JOIN
    `faculty`
ON
    group.faculty_id = faculty.faculty_id
WHERE
    faculty.abbreviation = 'ФИиВТ';

SELECT
    faculty.abbreviation AS `faculty`,
    group.name AS `group`,
    student.first_name AS `first_name`,
    student.middle_name AS `middle_name`,
    student.last_name AS `last_name`
FROM
    `student`
LEFT JOIN
    `group`
ON
    student.group_id = group.group_id
LEFT JOIN
    `faculty`
ON
    group.faculty_id = faculty.faculty_id
WHERE
    student.last_name = 'Гаврилов' AND
    student.first_name = 'Ринат' AND
    student.middle_name = 'Дмитриевич';