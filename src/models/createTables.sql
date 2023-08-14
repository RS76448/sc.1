-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

-- CREATE TABLE Weeks (
--     week_id INT PRIMARY KEY
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- CREATE TABLE DaysTypes (
--     id INT PRIMARY KEY,

--     day_type_name VARCHAR(20) NOT NULL,
--     exersice_type VARCHAR(20) NOT NULL,
--     exersice_name VARCHAR(20) NOT NULL,

-- )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE running_schedule (
    week INT PRIMARY KEY,
    5_days INT,
    4_days INT,
    3_days INT,
    2_days INT,
    long_workout DECIMAL(5, 2),
    medium_workout_1 DECIMAL(5, 2),
    medium_workout_2 DECIMAL(5, 2),
    short_workout_1 DECIMAL(5, 2),
    short_workout_2 DECIMAL(5, 2)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;








INSERT INTO running_schedule (week, 5_days, 4_days, 3_days, 2_days, long_workout, medium_workout_1, medium_workout_2, short_workout_1, short_workout_2)
VALUES
    (1, 40, 35, 30, 23, 37.0, 20.0, 17.0, 13.0, 12.0),
    (2, 46, 40, 33, 25, 35.0, 20.0, 17.0, 15.0, 13.0),
    (3, 47, 42, 36, 28, 38.0, 21.0, 17.0, 13.0, 11.0),
    (4, 38, 38, 33, 25, 43.0, 23.0, 20.0, 15.0, 0.0),
    (5, 53, 48, 40, 31, 39.0, 20.0, 17.0, 15.0, 9.0),
    (6, 55, 49, 42, 32, 39.0, 20.0, 17.0, 13.0, 11.0),
    (7, 57, 52, 44, 34, 40.0, 20.0, 17.0, 14.0, 9.0),
    (8, 37, 37, 31, 24, 43.0, 22.0, 20.0, 15.0, 0.0),
    (9, 56, 51, 44, 34, 41.0, 20.0, 17.0, 13.0, 9.0),
    (10, 59, 53, 46, 36, 41.0, 19.0, 17.0, 13.0, 10.0),
    (11, 60, 55, 47, 37, 42.0, 20.0, 17.0, 13.0, 8.0),
    (12, 39, 39, 33, 26, 44.0, 22.0, 19.0, 15.0, 0.0),
    (13,  57 , 52  ,45  ,35  ,42, 19, 17, 13, 9),
    (14,  62 , 56  ,48  ,38  ,42, 19, 17, 13, 10),
    (15,  64 , 59  ,51  ,40  ,43, 20, 17, 13, 8),
    (16,  37 , 37  ,32  ,23  ,40, 22, 24, 14, 0),
    (17 , 66,  61  ,53  ,42  ,45, 18, 17, 12, 8),
    (18 , 71 , 65  ,57  ,45  ,45, 18, 17, 11, 8),
    (19 , 68 , 68  ,60  ,48  ,51, 19, 18, 12, 0),
    (20 , 43 , 43  ,37  ,28  ,42, 22, 21, 15, 0),
    (21 , 64 , 59  ,52  ,42  ,47, 18, 16, 12, 8),
    (22 , 53 , 47  ,42  ,34  ,45, 19, 15, 9, 11),
    (23 , 61 , 56  ,48  ,38  ,42, 20, 16, 14, 8),
    (24 , 41 , 41 , 36  ,28  ,44, 25, 20, 12, 0),
    (25 , 55 , 55 , 55  ,50  ,76, 15, 9, 0, 0),
    (26, 32, 32, 27, 20, 38.0, 25.0, 22.0, 16.0, 0.0);




CREATE TABLE days_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    days VARCHAR(512) NOT NULL,
    value VARCHAR(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE exercise_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255) NOT NULL,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE workout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    workout_percent DECIMAL(5, 2) NOT NULL,
    daysoption_id INT NOT NULL,
    week INT NOT NULL,
    exercise_type_id INT NOT NULL,
    FOREIGN KEY (daysoption_id) REFERENCES days_options(id),
    FOREIGN KEY (exercise_type_id) REFERENCES exercise_type(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO days_options ( days, value) VALUES
    ("12", "[ Monday - Tuesday ]"),
    ("35", "[Wednesday - Friday ]"),
    ("123", "[ Monday - Tuesday- Wednesday ]"),
    ("456", "[ Thursday, Friday, Saturday]"),
    ("135", "[MOnday, Wednesday, Friday]"),
    ("1234", "[ Mon-Tue-Wed, Thurs]"),
    ("2345", "[ Thuesday, Wed, Thursday, Friday]"),
    ("12345", "[ monday, Tuesday, Wed, Thursday, Friday]");


INSERT INTO exercise_type (type_name) VALUES
    ("Running"),
    ("Swimming"),
    ("Cycling"),
    ("Weightlifting"),
    ("Yoga"),
    ("Pilates"),
    ("CrossFit"),
    ("Aerobics");

CREATE TABLE days_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    run_days_per_week INT,
    options INT,
    monday VARCHAR(50),
    tuesday VARCHAR(50),
    wednesday VARCHAR(50),
    thursday VARCHAR(50),
    friday VARCHAR(50),
    saturday VARCHAR(50),
    sunday VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;








INSERT INTO days_options (run_days_per_week, options, monday, tuesday, wednesday, thursday, friday, saturday, sunday) VALUES
(5, 1, 'Rest Day', 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout 2', 'Long Workout'),
(5, 2, 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day'),
(5, 3, 'Short Workout', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2'),
(4, 1, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout'),
(4, 2, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day'),
(4, 3, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2'),
(3, 1, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout'),
(3, 2, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', 'Rest Day'),
(3, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout'),
(3, 4, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day'),
(3, 5, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Medium Workout 2'),
(2, 1, 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day'),
(2, 2, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout'),
(2, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day'),
(2, 4, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout'),
(2, 5, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day'),
(2, 6, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Rest Day');
