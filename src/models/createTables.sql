-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE Weeks (
    week_id INT PRIMARY KEY
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ExerciseQuotas (
    exercise_quota_id INT PRIMARY KEY AUTO_INCREMENT,
    week_id INT,
    days INT,
    total_quota INT,
    FOREIGN KEY (week_id) REFERENCES Weeks(week_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE Workouts (
    workout_id INT PRIMARY KEY AUTO_INCREMENT,
    exercise_quota_id INT,
    name VARCHAR(50),
    pert INT,
    FOREIGN KEY (exercise_quota_id) REFERENCES ExerciseQuotas(exercise_quota_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

