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

LOAD DATA LOCAL INFILE 'D:/Curses/Web/web-development/lw11/faculty.txt' INTO TABLE `faculty`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'D:/Curses/Web/web-development/lw11/group.txt' INTO TABLE `group`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'D:/Curses/Web/web-development/lw11/student.txt' INTO TABLE `student`
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

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