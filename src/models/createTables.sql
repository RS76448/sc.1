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

CREATE TABLE days(
    id INT PRIMARY KEY AUTO_INCREMENT,
    day VARCHAR(255) NOT NULL,
)

INSERT INTO days (day) VALUES
    ("Monday"),
    ("Tuesday"),
    ("Wednesday"),
    ("Thursday"),
    ("Friday"),
    ("Saturday"),
    ("Sunday");

CREATE TABLE `days_options` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `run_days_per_week` INT,
    `options` INT,
    `day` VARCHAR(50),
    `workout` VARCHAR(50),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`day`) REFERENCES `days`(`day`) -- Assuming that `day` is the referencing column in the `days` table
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE running_schedule (
    week INT PRIMARY KEY,
    5_days INT,
    4_days INT,
    3_days INT,
    2_days INT,
    first DECIMAL(5, 2),
    second DECIMAL(5, 2),
    third DECIMAL(5, 2),
    fourth DECIMAL(5, 2),
    fifth DECIMAL(5, 2)
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


CREATE TABLE workout_schedule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    week INT NOT NULL,
    date DATE NOT NULL,
    day VARCHAR(10) NOT NULL,
    total_quota_for_week VARCHAR(10) NOT NULL,
    day_quota VARCHAR(10) NOT NULL,
    phase_id INT NOT NULL,
    phase_name VARCHAR(50) NOT NULL,
    workout VARCHAR(50) NOT NULL,
    sub_workout VARCHAR(50) NOT NULL,
    numofrunningdays INT NOT NULL,
    daysoption INT NOT NULL,
    identifier VARCHAR(50) NOT NULL,
    actual_workout INT DEFAULT 0,
    goal VARCHAR(50)
);




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
    sunday VARCHAR(50),
    dayscode VARCHAR(50),
    activities VARCHAR(50),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `days_options` (`id`, `run_days_per_week`, `options`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `dayscode`,`activities`) VALUES
(1, 5, 1, 'Rest Day', 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout 2', 'Long Workout', '02346','1'),
(2, 5, 2, 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '12356','1'),
(3, 5, 3, 'Short Workout', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '01245','1'),
(4, 4, 1, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', '0246','1'),
(5, 4, 2, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '1356','1'),
(6, 4, 3, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '0245','1'),
(7, 3, 1, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', '024','1'),
(8, 3, 2, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', 'Rest Day', '246','1'),
(9, 3, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', '035','1'),
(10, 3, 4, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '136','1'),
(11, 3, 5, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Medium Workout 2', '146','1'),
(12, 2, 1, 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '16','1'),
(13, 2, 2, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '03','1'),
(14, 2, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '36','1'),
(15, 2, 4, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '02','1'),
(16, 2, 5, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '26','1'),
(17, 2, 6, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Rest Day', '25','1');

INSERT INTO `days_options` (`id`, `run_days_per_week`, `options`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `dayscode`,`activities`) VALUES
(18, 5, 1, 'Rest Day', 'Short/Medium Ride', 'Short Ride', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', '12356', '2'),
(19, 5, 2, 'Short/Medium Ride', 'Short Ride', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', '01245', '2'),
(20, 5, 3, 'Short Ride', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', 'Short/Medium Ride', '01346', '2'),
(21, 4, 1, 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', '1356', '2'),
(22, 4, 2, 'Short/Medium Ride', 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', '0245', '2'),
(23, 4, 3, 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', 'Short/Medium Ride', '1346', '2'),
(24, 3, 1, 'Rest Day', 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', '256', '2'),
(25, 3, 2, 'Rest Day', 'Short/Medium Ride', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', '145', '2'),
(26, 3, 3, 'Short/Medium Ride', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', 'Rest Day', '034', '2'),
(27, 2, 1, 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', '56', '2'),
(28, 2, 2, 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', 'Long Ride', '456', '2'),
(29, 2, 3, 'Rest Day', 'Rest Day', 'Rest Day', 'Medium Ride', 'Long Ride', 'Rest Day', 'Rest Day', '34', '2'),
(30, 2, 4, 'Rest Day', 'Rest Day', 'Medium Ride', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Ride', '26', '2'),
(31, 2, 5, 'Rest Day', 'Rest Day', 'Medium Ride', 'Rest Day', 'Rest Day', 'Long Ride', 'Rest Day', '25', '2'),
(32, 2, 6, 'Rest Day', 'Medium Ride', 'Rest Day', 'Rest Day', 'Long Ride', 'Rest Day', 'Rest Day', '14', '2');




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







CREATE TABLE activities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO activities (activity_name) VALUES
    ("Running"),
    ("Cycling"),
    ("Swimming");

CREATE TABLE levels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    level VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO levels (level) VALUES
    ("Beginner"),
    ("Novice"),
    ("Intermediate"),
    ("Advanced"),
    ("Elite");

CREATE TABLE zones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT NOT NULL,
    zone VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    offset_start INT NOT NULL,
    offset_end INT NOT NULL,
    level_id INT NOT NULL,
    
    FOREIGN KEY (activity_id) REFERENCES activites(id),
    FOREIGN KEY (level_id) REFERENCES lelel(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- for activity 1
INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(1, 'Zone 1', 'Easy Run', 90, 120, 1),
(1, 'Zone 2', 'Aerobic Run', 60, 90, 1),
(1, 'Zone 3', 'Tempo Run', 30, 50, 1),
(1, 'Zone 4', 'Speed Interval - 2 km', 20, 0, 1),
(1, 'Zone 5', 'Speed Interval - 1 km', 40, 20, 1),
(1, 'Zone 6', 'Speed Interval - 800 m Repeats', 50, 40, 1),
(1, 'Zone 7', 'Speed Interval - 400 m Repeats', 60, 50, 1),
(1, 'Zone 8', 'Speed Interval - 200 m Repeats', 70, 60, 1);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(1, 'Zone 1', 'Easy Run', 90, 120, 2),
(1, 'Zone 2', 'Aerobic Run', 60, 90, 2),
(1, 'Zone 3', 'Tempo Run', 30, 50, 2),
(1, 'Zone 4', 'Speed Interval - 2 km', 20, 0, 2),
(1, 'Zone 5', 'Speed Interval - 1 km', 40, 20, 2),
(1, 'Zone 6', 'Speed Interval - 800 m Repeats', 50, 40, 2),
(1, 'Zone 7', 'Speed Interval - 400 m Repeats', 60, 50, 2);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(1, 'Zone 1', 'Easy Run', 80, 140, 3),
(1, 'Zone 2', 'Aerobic Run', 60, 80, 3),
(1, 'Zone 3', 'Tempo Run', 30, 50, 3),
(1, 'Zone 4', 'Speed Interval - 2 km', 0, 10, 3),
(1, 'Zone 5', 'Speed Interval - 1 km', 10, 0, 3),
(1, 'Zone 6', 'Speed Interval - 800 m Repeats', 20, 10, 3),
(1, 'Zone 7', 'Speed Interval - 400 m Repeats', 30, 20, 3),
(1, 'Zone 8', 'Speed Interval - 200 m Repeats', 40, 30, 3);

INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(1, 'Zone 1', 'Easy Run', 80, 140, 4),
(1, 'Zone 2', 'Aerobic Run', 60, 80, 4),
(1, 'Zone 3', 'Tempo Run', 30, 50, 4),
(1, 'Zone 4', 'Speed Interval - 2 km', 0, 10, 4),
(1, 'Zone 5', 'Speed Interval - 1 km', 10, 0, 4),
(1, 'Zone 6', 'Speed Interval - 800 m Repeats', 20, 10, 4),
(1, 'Zone 7', 'Speed Interval - 400 m Repeats', 30, 20, 4),
(1, 'Zone 8', 'Speed Interval - 200 m Repeats', 40, 30, 4);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(1, 'Zone 1', 'Easy Run', 80, 140, 5),
(1, 'Zone 2', 'Aerobic Run', 60, 80, 5),
(1, 'Zone 3', 'Tempo Run', 30, 50, 5),
(1, 'Zone 4', 'Speed Interval - 2 km', 0, 10, 5),
(1, 'Zone 5', 'Speed Interval - 1 km', 10, 0, 5),
(1, 'Zone 6', 'Speed Interval - 800 m Repeats', 20, 10, 5),
(1, 'Zone 7', 'Speed Interval - 400 m Repeats', 30, 20, 5),
(1, 'Zone 8', 'Speed Interval - 200 m Repeats', 40, 30, 5);

-- for activity 2
INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(2, 'Zone 1', 'Easy', -3, 0, 1),
(2, 'Zone 2', 'Endurance', -3, -2, 1),
(2, 'Zone 3', 'Tempo', -2, -1, 1),
(2, 'Zone 4', 'Threshold', -1, 0, 1),
(2, 'Zone 5', 'Best Effort - 4 to 8 Minute intervals', 0, 2, 1),
(2, 'Zone 6', 'Best Effort - 1 to 4 Minute intervals', 2, 4, 1),
(2, 'Zone 7', 'Best Effort - 0 to 1 minute intervals', 4, 6, 1),

(2, 'Zone 1', 'Easy', -8, -5, 2),
(2, 'Zone 2', 'Endurance', -5, -2, 2),
(2, 'Zone 3', 'Tempo', -2, -1, 2),
(2, 'Zone 4', 'Threshold', -1, 0, 2),
(2, 'Zone 5', 'Best Effort - 4 to 8 Minute intervals', 0, 2, 2),
(2, 'Zone 6', 'Best Effort - 1 to 4 Minute intervals', 2, 4, 2),
(2, 'Zone 7', 'Best Effort - 0 to 1 minute intervals', 4, 6, 2),

(2, 'Zone 1', 'Easy', -8, -5, 3),
(2, 'Zone 2', 'Endurance', -4, -2, 3),
(2, 'Zone 3', 'Tempo', -2, 0, 3),
(2, 'Zone 4', 'Threshold', 0, 1, 3),
(2, 'Zone 5', 'Best Effort - 4 to 8 Minute intervals', 1, 2, 3),
(2, 'Zone 6', 'Best Effort - 1 to 4 Minute intervals', 2, 4, 3),
(2, 'Zone 7', 'Best Effort - 0 to 1 minute intervals', 4, 6, 3),

(2, 'Zone 1', 'Easy', -12, -9, 4),
(2, 'Zone 2', 'Endurance', -7, -5, 4),
(2, 'Zone 3', 'Tempo', -5, -3, 4),
(2, 'Zone 4', 'Threshold', -3, 0, 4),
(2, 'Zone 5', 'Best Effort - 4 to 8 Minute intervals', 0, 2, 4),
(2, 'Zone 6', 'Best Effort - 1 to 4 Minute intervals', 2, 4, 4),
(2, 'Zone 7', 'Best Effort - 0 to 1 minute intervals', 4, 6, 4),

(2, 'Zone 1', 'Easy', -15, -14, 5),
(2, 'Zone 2', 'Endurance', -12, -8, 5),
(2, 'Zone 3', 'Tempo', -8, -5, 5),
(2, 'Zone 4', 'Threshold', -5, 0, 5),
(2, 'Zone 5', 'Best Effort - 4 to 8 Minute intervals', -2, 2, 5),
(2, 'Zone 6', 'Best Effort - 1 to 4 Minute intervals', 2, 4, 5),
(2, 'Zone 7', 'Best Effort - 0 to 1 minute intervals', 4, 6, 5);

-- for activity 3
-- Swimming - Beginner
INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(3, 'Zone 1', 'Easy', 25, 30, 1),
(3, 'Zone 2', 'Moderate', 15, 20, 1),
(3, 'Zone 3', 'Hard', 5, 10, 1),
(3, 'Zone 4', 'Best Effort', 5, 0, 1);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(3, 'Zone 1', 'Easy', 25, 30, 2),
(3, 'Zone 2', 'Moderate', 15, 20, 2),
(3, 'Zone 3', 'Hard', 5, 10, 2),
(3, 'Zone 4', 'Best Effort', 5, 0, 2);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(3, 'Zone 1', 'Easy', 25, 30, 3),
(3, 'Zone 2', 'Moderate', 15, 20, 3),
(3, 'Zone 3', 'Hard', 5, 10, 3),
(3, 'Zone 4', 'Best Effort', 5, 0, 3);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(3, 'Zone 1', 'Easy', 25, 40, 4),
(3, 'Zone 2', 'Moderate', 15, 25, 4),
(3, 'Zone 3', 'Hard', 5, 10, 4),
(3, 'Zone 4', 'Best Effort', 5, 0, 4);


INSERT INTO zones (activity_id, zone, name, offset_start, offset_end, level_id) VALUES 
(3, 'Zone 1', 'Easy', 25, 35, 5),
(3, 'Zone 2', 'Moderate', 15, 20, 5),
(3, 'Zone 3', 'Hard', 5, 10, 5),
(3, 'Zone 4', 'Best Effort', 5, 0, 5);



CREATE TABLE activites_classifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT NOT NULL,
    distance INT NOT NULL,
    level_id INT NOT NULL,
    from_range TIME NOT NULL,
    end_range TIME NOT NULL,
    FOREIGN KEY (activity_id) REFERENCES activities(id),
    FOREIGN KEY (level_id) REFERENCES levels(id)
);

INSERT INTO activites_classifications (activity_id, distance, level_id, from_range, end_range) VALUES
    (1, 5000, 1, "0:40:01", "1:00:00"),
    (1,5000, 2, "0:30:01", "0:40:00"),
    (1,5000,3,"0:25:01",	"0:30:00"),
     (1,5000,4,"0:20:01",	"0:25:00"),
      (1,5000,5,"0:00:00",	"0:20:00");


INSERT INTO activites_classifications (activity_id, distance, level_id, from_range, end_range) VALUES
    (2, 10000, 1, "0:30:00", "0:50:00"),
    (2,10000, 2, "0:22:14", "0:29:59"),
    (2,10000,3,"0:18:11",	"0:22:13"),
     (2,10000,4,"0:15:47",	"0:18:10"),
      (2,10000,5,"0:10:00",	"0:15:46");

INSERT INTO activites_classifications (activity_id, distance, level_id, from_range, end_range) VALUES
    (3, 100, 1, "0:03:45", "0:05:00"),
    (3,100, 2, "0:02:30", "0:03:45"),
    (3,100,3,"0:02:00",	"0:02:30"),
     (3,100,4,"0:01:30",	"0:02:00"),
      (3,100,5,"0:00:00",	"0:01:30");

INSERT INTO activites_classifications (activity_id, distance, level_id, from_range, end_range) VALUES
    (3, 400, 1, "0:15:01", "0:20:00"),
    (3,400, 2, "0:10:01", "0:15:00"),
    (3,400,3,"0:08:01",	"0:10:00"),
     (3,400,4,"0:06:01",	"0:08:00"),
      (3,400,5,"0:00:00",	"0:06:00");


CREATE TABLE phasename (
    id INT PRIMARY KEY AUTO_INCREMENT,
   
    phase VARCHAR(255) NOT NULL,
   
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO phasename (phase) VALUES
("Base"),
("Build"),
("Peak");

CREATE TABLE phase (
    id INT PRIMARY KEY AUTO_INCREMENT,
    week INT NOT NULL,
    phase INT NOT NULL,
    phaseno INT NOT NULL,
    activities VARCHAR(255) NOT NULL,
    FOREIGN KEY (phase) REFERENCES phasename(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





-- phase no 1
INSERT INTO phase (week, phase, phaseno,activities) VALUES
(1, 1, 1,1),
(2, 1, 1,1),
(3, 2, 1,1),
(4, 1, 1,1),
(5, 1, 1,1),
(6, 2, 1,1),
(7, 3, 1,1),
(8, 1, 1,1),
(9, 1, 1,1),
(10, 3, 1,1),
(11, 3, 1,1),
(12, 1, 1,1),
(13, 1, 1,1),
(14, 1, 1,1),
(15, 2, 1,1),
(16, 1, 1,1),
(17, 1, 1,1),
(18, 2, 1,1),
(19, 3, 1,1),
(20, 1, 1,1),
(21, 1, 1,1),
(22, 3, 1,1),
(23, 3, 1,1),
(24, 1, 1,1),
(25, 1, 1,1),
(26, 1, 1,1);

-- phase no2
INSERT INTO phase (week, phase, phaseno,activities) VALUES
(1, 1, 2,1),
(2, 1, 2,1),
(3, 2, 2,1),
(4, 1, 2,1),
(5, 1, 2,1),
(6, 2, 2,1),
(7, 3, 2,1),
(8, 1, 2,1),
(9, 1, 2,1),
(10, 3, 2,1),
(11, 3, 2,1),
(12, 1, 2,1),
(13, 1, 2,1),
(14, 1, 2,1),
(15, 2, 2,1),
(16, 1, 2,1),
(17, 1, 2,1),
(18, 2, 2,1),
(19, 3, 2,1),
(20, 1, 2,1),
(21, 1, 2,1),
(22, 3, 2,1),
(23, 3, 2,1),
(24, 1, 2,1),
(25, 1, 2,1),
(26, 1, 2,1);
-- activity 2 cycling
-- phase 1
INSERT INTO phase (week, phase, phaseno, activities) VALUES
(1, 1, 1, 2),
(2, 1, 1, 2),
(3, 2, 1, 2),
(4, 1, 1, 2),
(5, 1, 1, 2),
(6, 2, 1, 2),
(7, 3, 1, 2),
(8, 1, 1, 2),
(9, 1, 1, 2),
(10, 3, 1, 2),
(11, 3, 1, 2),
(12, 1, 1, 2),
(13, 1, 1, 2),
(14, 1, 1, 2),
(15, 2, 1, 2),
(16, 1, 1, 2),
(17, 1, 1, 2),
(18, 2, 1, 2),
(19, 3, 1, 2),
(20, 1, 1, 2),
(21, 1, 1, 2),
(22, 3, 1, 2),
(23, 3, 1, 2),
(24, 1, 1, 2),
(25, 1, 1, 2),
(26, 1, 1, 2);

-- phase 2

INSERT INTO phase (week, phase, phaseno, activities) VALUES
(1, 1, 2, 2),
(2, 2, 2, 2),
(3, 2, 2, 2),
(4, 1, 2, 2),
(5, 2, 2, 2),
(6, 2, 2, 2),
(7, 1, 2, 2),
(8, 3, 2, 2),
(9, 1, 2, 2),
(10, 2, 2, 2),
(11, 1, 2, 2),
(12, 3, 2, 2),
(13, 1, 2, 2),
(14, 2, 2, 2),
(15, 2, 2, 2),
(16, 1, 2, 2),
(17, 2, 2, 2),
(18, 2, 2, 2),
(19, 1, 2, 2),
(20, 3, 2, 2),
(21, 1, 2, 2),
(22, 2, 2, 2),
(23, 1, 2, 2),
(24, 3, 2, 2),
(25, 1, 2, 2),
(26, 2, 2, 2);






-- here ends phase
CREATE TABLE workout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    workout varchar(255) NOT NULL,
    activity_id INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO workout(workout,activity_id) VALUES
("Long Workout",1),
("Medium Workout 1",1),
("Medium Workout 2",1),
("Short Workout 1",1),
("Short Workout 2",1),
("Rest Day",1);


INSERT INTO workout(workout,activity_id) VALUES
("Ride 1",2),
("Ride 2",2),
("Ride 3",2),
("Ride 4",2),
("Ride 5",2),
("Rest Day",1)

CREATE TABLE subworkout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subworkout varchar(255) NOT NULL,
    activites varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

//for running
INSERT INTO subworkout (subworkout,activities) VALUES
("Time Trial",'1'),
("Race Pace",'1'),
("Aerobic Run",'1'),
("Tempo",'1'),
("Easy",'1'),
("Interval",'1'),
("Easy Run",'1'),
("Fartlek",'1'),
("Long",'1'),
("Hill",'1'),
("Aerobic",'1');
//for Cycling
INSERT INTO subworkout (subworkout, activities) VALUES
("Easy", 2),
("Endurance", 2),
("Hill", 2),
("Interval", 2),
("Long", 2),
("Race Pace", 2),
("Tempo", 2),
("Time Trial", 2);


CREATE TABLE phasesubactivity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phase_id INT NOT NULL,
    workout_id INT NOT NULL,
    subworkout_id INT NOT NULL,
    activities VARCHAR(255) NOT NULL,
    FOREIGN KEY (subworkout_id) REFERENCES subworkout(id)
    FOREIGN KEY (phase_id) REFERENCES phase(id),
    FOREIGN KEY (workout_id) REFERENCES workout(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO phasesubactivity (phase_id, workout_id, subworkout_id,activities) VALUES
(1, 1, 9,'1'),
(1, 2, 1,'1'),
(1, 3, 5,'1'),
(1, 4, 3,'1'),
(1, 5, 8,'1'),
(1, 1, 9,'1'),
(1, 2, 3,'1'),
(1, 3, 6,'1'),
(1, 4, 3,'1'),
(1, 5, 3,'1'),
(1, 1, 9,'1'),
(1, 2, 3,'1'),
(1, 3, 3,'1'),
(1, 4, 3,'1'),
(1, 5, 8,'1'),
(1, 1, 4,'1'),
(1, 2, 3,'1'),
(1, 3, 6,'1'),
(1, 4, 3,'1'),
(1, 5, 8,'1'),
(2, 1, 9,'1'),
(2, 2, 6,'1'),
(2, 3, 3,'1'),
(2, 4, 3,'1'),
(2, 5, 3,'1'),
(2, 1, 2,'1'),
(2, 2, 3,'1'),
(2, 3, 6,'1'),
(2, 4, 3,'1'),
(2, 5, 8,'1'),
(2, 1, 4,'1'),
(2, 2, 3,'1'),
(2, 3, 7,'1'),
(2, 4, 3,'1'),
(2, 5, 8,'1'),
(3, 1, 2,'1'),
(3, 2, 7,'1'),
(3, 3, 6,'1'),
(3, 4, 3,'1'),
(3, 5, 3,'1'),
(3, 1, 10,'1'),
(3, 2, 7,'1'),
(3, 3, 11,'1'),
(3, 4, 3,'1'),
(3, 5, 3,'1'),
(1, 1, 9,'1'),
(1, 2, 3,'1'),
(1, 3, 3,'1'),
(1, 4, 3,'1'),
(1, 5, 8,'1');

//for cycling
INSERT INTO phasesubactivity (phase_id, workout_id, subworkout_id, activities) VALUES
(4, 7, 16, '2'),
(4, 8, 19, '2'),
(4, 9, 13, '2'),
(4, 10, 13, '2'),
(4, 11, 12, '2'),
(1, 7, 16, '2'),
(1, 8, 13, '2'),
(1, 9, 18, '2'),
(1, 10, 13, '2'),
(1, 11, 13, '2'),
(1, 7, 16, '2'),
(1, 8, 13, '2'),
(1, 9, 13, '2'),
(1, 10, 13, '2'),
(1, 11, 12, '2'),
(1, 7, 14, '2'),
(1, 8, 13, '2'),
(1, 9, 18, '2'),
(1, 10, 13, '2'),
(1, 11, 12, '2'),
(2, 7, 16, '2'),
(2, 8, 18, '2'),
(2, 9, 13, '2'),
(2, 10, 13, '2'),
(2, 11, 13, '2'),
(2, 7, 17, '2'),
(2, 8, 13, '2'),
(2, 9, 18, '2'),
(2, 10, 13, '2'),
(2, 11, 12, '2'),
(2, 7, 14, '2'),
(2, 8, 13, '2'),
(2, 9, 15, '2'),
(2, 10, 13, '2'),
(2, 11, 12, '2'),
(3, 7, 17, '2'),
(3, 8, 15, '2'),
(3, 9, 18, '2'),
(3, 10, 13, '2'),
(3, 11, 13, '2'),
(3, 7, 19, '2'),
(3, 8, 15, '2'),
(3, 9, 15, '2'),
(3, 10, 13, '2'),
(3, 11, 13, '2');


CREATE TABLE `workout_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `week` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `day` varchar(10) NOT NULL,
  `total_quota_for_week` varchar(10) NOT NULL,
  `day_quota` varchar(10) NOT NULL,
  `phase_id` int(11) NOT NULL,
  `phase_name` varchar(50) NOT NULL,
  `workout` varchar(50) NOT NULL,
  `sub_workout` varchar(50) NOT NULL,
  `workout_id` int(11) NOT NULL,
  `sub_workout_id` int(11) NOT NULL,
  `numofrunningdays` int(11) NOT NULL,
  `daysoption` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `actual_workout` int(11) DEFAULT 0,
  `goal` varchar(50) DEFAULT NULL,
  `process` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE trainingzones (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    date DATETIME,
    zone VARCHAR(50) NOT NULL,
    zone_name VARCHAR(255) NOT NULL,
    offset_start DECIMAL(10, 3) NOT NULL,
    offset_end DECIMAL(10, 3) NOT NULL,
    pace_start_range DECIMAL(10, 3) NOT NULL,
    pace_end_range DECIMAL(10, 3) NOT NULL,
    fitnesslevel_id INTEGER NOT NULL,
    identifier VARCHAR(100) NOT NULL,
    activity_id INTEGER NOT NULL
);


CREATE TABLE workoutdonebyuserforday (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    unique_identifier VARCHAR(100) NOT NULL,
    
    date DATE NOT NULL,
    given_workout INTEGER(20) NOT NULL,
    actual_workout INTEGER(20) NOT NULL,
);


-- CREATE TABLE `Workoutonday` (
--     `id` INT NOT NULL AUTO_INCREMENT,
--     `daysperweek` INT,
--     `options` INT,
--     `day` VARCHAR(50),
--     `workout` VARCHAR(50),
--     PRIMARY KEY (`id`),
--     FOREIGN KEY (`day`) REFERENCES `days`(`day`) -- Assuming that `day` is the referencing column in the `days` table
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- INSERT INTO `Workoutonday` ('id', 'daysperweek','option','day','workout') VALUES
-- (1,2,1,1,)

-- INSERT INTO `Workoutonday` (`id`, `run_days_per_week`, `options`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `dayscode`) VALUES
-- (1, 5, 1, 'Rest Day', 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout 2', 'Long Workout', '02346'),
-- (2, 5, 2, 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '12356'),
-- (3, 5, 3, 'Short Workout', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '01245'),
-- (4, 4, 1, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', '0246'),
-- (5, 4, 2, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '1356'),
-- (6, 4, 3, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '0245'),
-- (7, 3, 1, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', '024'),
-- (8, 3, 2, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', 'Rest Day', '246'),
-- (9, 3, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', '035'),
-- (10, 3, 4, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '136'),
-- (11, 3, 5, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Medium Workout 2', '146'),
-- (12, 2, 1, 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '16'),
-- (13, 2, 2, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '03'),
-- (14, 2, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '36'),
-- (15, 2, 4, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '02'),
-- (16, 2, 5, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '26'),
-- (17, 2, 6, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Rest Day', '25');


CREATE TABLE goals (
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `week` INT,
    `sevendays` INT,
    `sixdays` INT,
    `fivedays` INT,
    `fourdays` INT,
    `threedays` INT,
    `twodays` INT,
    `onedays` INT,
    `first` DECIMAL(5, 2) NOT NULL,
    `second` DECIMAL(5, 2) NOT NULL,
    `third` DECIMAL(5, 2) NOT NULL,
    `fourth` DECIMAL(5, 2) NOT NULL,
    `fifth` DECIMAL(5, 2) NOT NULL,
    `sixth` DECIMAL(5, 2) NOT NULL,
    `seventh` DECIMAL(5, 2) NOT NULL,
    `activity_id` INT,
    `goal` VARCHAR(255),
    FOREIGN KEY (`activity_id`) REFERENCES activities(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `goals` (week, `5_days`, `4_days`, `3_days`, `2_days`, long_workout, medium_workout_1, medium_workout_2, short_workout_1, short_workout_2, goal, activity_id) VALUES 
(1, 40, 35, 30, 23, 37, 20, 17, 13, 12, 'Marathon', 1),
(2, 46, 40, 33, 25, 35, 20, 17, 15, 13, 'Marathon', 1),
(3, 47, 42, 36, 28, 38, 21, 17, 13, 11, 'Marathon', 1),
(4, 38, 38, 33, 25, 43, 23, 20, 15, 0, 'Marathon', 1),
(5, 53, 48, 40, 31, 39, 20, 17, 15, 9, 'Marathon', 1),
(6, 55, 49, 42, 32, 39, 20, 17, 13, 11, 'Marathon', 1),
(7, 57, 52, 44, 34, 40, 20, 17, 14, 9, 'Marathon', 1),
(8, 37, 37, 31, 24, 43, 22, 20, 15, 0, 'Marathon', 1),
(9, 56, 51, 44, 34, 41, 20, 17, 13, 9, 'Marathon', 1),
(10, 59, 53, 46, 36, 41, 19, 17, 13, 10, 'Marathon', 1),
(11, 60, 55, 47, 37, 42, 20, 17, 13, 8, 'Marathon', 1),
(12, 39, 39, 33, 26, 44, 22, 19, 15, 0, 'Marathon', 1),
(13, 57, 52, 45, 35, 42, 19, 17, 13, 9, 'Marathon', 1),
(14, 62, 56, 48, 38, 42, 19, 17, 13, 10, 'Marathon', 1),
(15, 64, 59, 51, 40, 43, 20, 17, 13, 8, 'Marathon', 1),
(16, 37, 37, 32, 23, 40, 22, 24, 14, 0, 'Marathon', 1),
(17, 66, 61, 53, 42, 45, 18, 17, 12, 8, 'Marathon', 1),
(18, 71, 65, 57, 45, 45, 18, 17, 11, 8, 'Marathon', 1),
(19, 68, 68, 60, 48, 51, 19, 18, 12, 0, 'Marathon', 1),
(20, 43, 43, 37, 28, 42, 22, 21, 15, 0, 'Marathon', 1),
(21, 64, 59, 52, 42, 47, 18, 16, 12, 8, 'Marathon', 1),
(22, 53, 47, 42, 34, 45, 19, 15, 9, 11, 'Marathon', 1),
(23, 61, 56, 48, 38, 42, 20, 16, 14, 8, 'Marathon', 1),
(24, 41, 41, 36, 28, 44, 25, 20, 12, 0, 'Marathon', 1),
(25, 55, 55, 55, 50, 76, 15, 9, 0, 0, 'Marathon', 1),
(26, 32, 32, 27, 20, 38, 25, 22, 16, 0, 'Marathon', 1);




INSERT INTO `goals` (week, `5_days`, `4_days`, `3_days`, `2_days`, long_workout, medium_workout_1, medium_workout_2, short_workout_1, short_workout_2, goal, activity_id) VALUES 
(1, 34, 29, 24, 19, 35, 20, 17, 13, 15, 'Half Marathon', 1),
(2, 38, 32, 28, 21, 34, 21, 18, 11, 16, 'Half Marathon', 1),
(3, 43, 36, 31, 22, 33, 18, 21, 12, 16, 'Half Marathon', 1),
(4, 35, 31, 26, 18, 31, 20, 23, 14, 11, 'Half Marathon', 1),
(5, 40, 35, 30, 21, 38, 15, 23, 12, 13, 'Half Marathon', 1),
(6, 45, 39, 33, 25, 36, 20, 18, 13, 13, 'Half Marathon', 1),
(7, 42, 38, 32, 25, 41, 20, 17, 13, 10, 'Half Marathon', 1),
(8, 39, 34, 30, 20, 36, 16, 25, 10, 13, 'Half Marathon', 1),
(9, 41, 35, 30, 24, 39, 18, 16, 12, 15, 'Half Marathon', 1),
(10, 44, 40, 34, 25, 39, 19, 21, 12, 9, 'Half Marathon', 1),
(11, 48, 43, 37, 26, 38, 17, 23, 11, 10, 'Half Marathon', 1),
(12, 40, 34, 29, 20, 33, 18, 23, 12, 15, 'Half Marathon', 1),
(13, 42, 38, 33, 26, 43, 19, 16, 12, 10, 'Half Marathon', 1),
(14, 43, 38, 32, 25, 45, 14, 17, 13, 12, 'Half Marathon', 1),
(15, 47, 41, 36, 27, 42, 15, 19, 11, 13, 'Half Marathon', 1),
(16, 38, 34, 30, 21, 39, 16, 24, 11, 10, 'Half Marathon', 1),
(17, 43, 38, 33, 24, 38, 18, 21, 12, 12, 'Half Marathon', 1),
(18, 46, 40, 34, 25, 39, 15, 20, 13, 13, 'Half Marathon', 1),
(19, 45, 41, 35, 28, 45, 18, 16, 12, 9, 'Half Marathon', 1),
(20, 38, 33, 29, 19, 34, 16, 26, 11, 13, 'Half Marathon', 1),
(21, 45, 39, 34, 26, 38, 20, 18, 10, 13, 'Half Marathon', 1),
(22, 42, 38, 33, 25, 43, 17, 19, 11, 10, 'Half Marathon', 1),
(23, 43, 38, 34, 27, 42, 21, 16, 9, 12, 'Half Marathon', 1),
(24, 41, 35, 30, 21, 34, 18, 22, 12, 15, 'Half Marathon', 1),
(25, 33, 33, 33, 28, 64, 21, 15, 0, 0, 'Half Marathon', 1),
(26, 21, 21, 21, 16, 43, 33, 24, 0, 0, 'Half Marathon', 1);



INSERT INTO `goals` (week, `5_days`, `4_days`, `3_days`, `2_days`, long_workout, medium_workout_1, medium_workout_2, short_workout_1, short_workout_2, goal, activity_id) VALUES 
(1, 23, 19, 15, 11, 26, 22, 17, 17, 17, '10K', 1),
(2, 29, 24, 19, 14, 28, 21, 18, 16, 18, '10K', 1),
(3, 29, 25, 20, 15, 31, 21, 17, 17, 14, '10K', 1),
(4, 23, 23, 19, 13, 35, 22, 26, 17, 0, '10K', 1),
(5, 29, 25, 20, 15, 31, 21, 17, 17, 14, '10K', 1),
(6, 31, 26, 21, 16, 32, 19, 16, 16, 16, '10K', 1),
(7, 31, 27, 21, 14, 30, 16, 23, 18, 13, '10K', 1),
(8, 23, 23, 19, 13, 35, 22, 26, 17, 0, '10K', 1),
(9, 32, 28, 23, 16, 31, 19, 22, 15, 13, '10K', 1),
(10, 30, 25, 20, 14, 30, 16, 20, 18, 16, '10K', 1),
(11, 31, 27, 22, 16, 29, 22, 19, 17, 13, '10K', 1),
(12, 26, 26, 21, 16, 39, 23, 19, 18, 0, '10K', 1),
(13, 31, 27, 22, 16, 29, 23, 19, 16, 13, '10K', 1),
(14, 31, 26, 21, 16, 32, 19, 16, 16, 16, '10K', 1),
(15, 33, 29, 24, 18, 33, 21, 18, 16, 12, '10K', 1),
(16, 24, 24, 20, 15, 37, 25, 22, 17, 0, '10K', 1),
(17, 33, 29, 24, 18, 36, 18, 18, 15, 12, '10K', 1),
(18, 33, 28, 22, 15, 28, 18, 21, 17, 15, '10K', 1),
(19, 32, 28, 23, 17, 31, 22, 19, 17, 12, '10K', 1),
(20, 25, 25, 20, 15, 36, 25, 20, 19, 0, '10K', 1),
(21, 34, 30, 25, 19, 35, 21, 18, 15, 12, '10K', 1),
(22, 34, 29, 24, 17, 32, 17, 20, 16, 15, '10K', 1),
(23, 32, 28, 23, 17, 31, 22, 19, 17, 12, '10K', 1),
(24, 25, 25, 20, 15, 32, 29, 20, 19, 0, '10K', 1),
(25, 20, 20, 20, 15, 50, 25, 25, 0, 0, '10K', 1),
(26, 17, 17, 17, 12, 41, 29, 29, 0, 0, '10K', 1);


INSERT INTO `goals` (week, 5_days, 4_days, 3_days, 2_days, long_workout, medium_workout_1, medium_workout_2, short_workout_1, short_workout_2, activity_id, goal) 
VALUES 
(1, 23, 19, 15, 11, 26, 22, 17, 17, 17, 1, 'Goal X'), 
(2, 29, 24, 19, 14, 28, 21, 18, 16, 18, 1, 'Goal X'), 
(3, 29, 25, 20, 15, 31, 21, 17, 17, 14, 1, 'Goal X'), 
(4, 23, 23, 19, 13, 35, 22, 26, 17, 0, 1, 'Goal X'), 
(5, 29, 25, 20, 15, 31, 21, 17, 17, 14, 1, 'Goal X'), 
(6, 31, 26, 21, 16, 32, 19, 16, 16, 16, 1, 'Goal X'), 
(7, 31, 27, 21, 14, 30, 16, 23, 18, 13, 1, 'Goal X'), 
(8, 23, 23, 19, 13, 35, 22, 26, 17, 0, 1, 'Goal X'), 
(9, 32, 28, 23, 16, 31, 19, 22, 15, 13, 1, 'Goal X'), 
(10, 30, 25, 20, 14, 30, 16, 20, 18, 16, 1, 'Goal X'), 
(11, 31, 27, 22, 16, 29, 22, 19, 17, 13, 1, 'Goal X'), 
(12, 26, 26, 21, 16, 39, 23, 19, 18, 0, 1, 'Goal X'), 
(13, 31, 27, 22, 16, 29, 23, 19, 16, 13, 1, 'Goal X'), 
(14, 31, 26, 21, 16, 32, 19, 16, 16, 16, 1, 'Goal X'), 
(15, 33, 29, 24, 18, 33, 21, 18, 16, 12, 1, 'Goal X'), 
(16, 24, 24, 20, 15, 37, 25, 22, 17, 0, 1, 'Goal X'), 
(17, 33, 29, 24, 18, 36, 18, 18, 15, 12, 1, 'Goal X'), 
(18, 33, 28, 22, 15, 28, 18, 21, 17, 15, 1, 'Goal X'), 
(19, 32, 28, 23, 17, 31, 22, 19, 17, 12, 1, 'Goal X'), 
(20, 25, 25, 20, 15, 36, 25, 20, 19, 0, 1, 'Goal X'), 
(21, 34, 30, 25, 19, 35, 21, 18, 15, 12, 1, 'Goal X'), 
(22, 34, 29, 24, 17, 32, 17, 20, 16, 15, 1, 'Goal X'), 
(23, 32, 28, 23, 17, 31, 22, 19, 17, 12, 1, 'Goal X'), 
(24, 25, 25, 20, 15, 32, 29, 20, 19, 0, 1, 'Goal X'), 
(25, 20, 20, 20, 15, 50, 25, 25, 0, 0, 1, 'Goal X'), 
(26, 17, 17, 17, 12, 41, 29, 29, 0, 0, 1, 'Goal X');

-- goals for cycling

INSERT INTO `goals` (week, `5_days`, `4_days`, `3_days`, `2_days`, first, second, third, fourth, fifth, goal, activity_id) VALUES 
(1, 300, 165, 105, 75, 45, 43, 24, 15, 11, '300K', 2),
(2, 315, 180, 105, 75, 60, 43, 24, 14, 10, '300K', 2),
(3, 330, 165, 90, 90, 45, 46, 23, 13, 13, '300K', 2),
(4, 270, 120, 75, 60, 0, 51, 23, 14, 11, '300K', 2),
(5, 315, 180, 120, 90, 60, 41, 24, 16, 12, '300K', 2),
(6, 330, 165, 105, 75, 45, 46, 23, 15, 10, '300K', 2),
(7, 345, 180, 90, 90, 60, 45, 24, 12, 12, '300K', 2),
(8, 300, 105, 90, 60, 0, 54, 19, 16, 11, '300K', 2),
(9, 330, 180, 120, 90, 60, 42, 23, 15, 12, '300K', 2),
(10, 360, 180, 105, 90, 45, 46, 23, 13, 12, '300K', 2),
(11, 330, 180, 120, 90, 75, 42, 23, 15, 11, '300K', 2),
(12, 360, 120, 90, 60, 0, 57, 19, 14, 10, '300K', 2),
(13, 300, 165, 105, 75, 45, 43, 24, 15, 11, '300K', 2),
(14, 315, 180, 105, 75, 60, 43, 24, 14, 10, '300K', 2),
(15, 330, 165, 90, 90, 45, 46, 23, 13, 13, '300K', 2),
(16, 270, 120, 75, 60, 0, 51, 23, 14, 11, '300K', 2),
(17, 315, 180, 120, 90, 60, 41, 24, 16, 12, '300K', 2),
(18, 330, 165, 105, 75, 45, 46, 23, 15, 10, '300K', 2),
(19, 345, 180, 90, 90, 60, 45, 24, 12, 12, '300K', 2),
(20, 300, 105, 90, 60, 0, 54, 19, 16, 11, '300K', 2),
(21, 330, 180, 120, 90, 60, 42, 23, 15, 12, '300K', 2),
(22, 360, 180, 105, 90, 45, 46, 23, 13, 12, '300K', 2),
(23, 330, 180, 120, 90, 75, 42, 23, 15, 11, '300K', 2),
(24, 360, 120, 90, 60, 0, 57, 19, 14, 10, '300K', 2);







-- goal for cyling ends here
CREATE TABLE `users`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    dateofbirth DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users (name, dateofbirth) VALUES
("John", "1990-03-12"),
("Jane", "1995-04-14"),
("Jack", "1999-12-13"),
("Jill", "2001-02-01"),
("Joe", "1945-09-07"),
("Jenny", "1970-04-27"),
("James", "1980-05-28");


//rules

rules on age

CREATE TABLE `rulesforage`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    minage INTEGER(20),
    maxage  INTEGER(20),
    changepercentage DECIMAL(10,2)
);

INSERT INTO rulesforage(minage,maxage,changepercentage) VALUES 
(18,30,0),
(31,45,-2),
(46,60,-3),
(60,200,-4);


CREATE TABLE `rulesforfitnesslevel`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    level_id INTEGER(20),
    changepercentage DECIMAL(10,2),
    FOREIGN KEY (`level_id`) REFERENCES levels(id)
);

INSERT INTO rulesforfitnesslevel(level_id,changepercentage) VALUES 
(1,-5),
(2,-2.5),
(3,0),
(4,2.5),
(5,5)

CREATE TABLE plannedworkout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    
    sub_workout_id INT NOT NULL,
    workout VARCHAR(255) NOT NULL,
    planned_quota FLOAT NOT NULL,
    description VARCHAR(2550) NOT NULL,
   
    FOREIGN KEY (sub_workout_id) REFERENCES subworkout(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO plannedworkout (title,  workout,sub_workout_id, planned_quota, description) VALUES
("first table", "Long Workout", 1, 4, "Long Workout"),
("Second table", "Long Workout", 2, 6.2, "Medium Workout 1"),
("Third table", "Long Workout", 3, 8.6, "Medium Workout 2"),
("Fourth table", "Long Workout", 4, 5.2, "Short Workout 1"),
("Fifth table", "Long Workout", 5, 2, "Short Workout 2"),
("sixth table", "Long Workout", 6, 20, "Short Workout 2"),
("seventh table","Long Workout",7,56,"seven times "),
("eight talbe","Long Workout",8,9,"eight times is the table"),
("nine table","Long Workout",9,21,"nine table is ok as well"),
("ten table","Long Workout",10,11,"nine table is ok as well"),
("eleven table","Long Workout",11,3,"nine table is ok as well");

INSERT INTO plannedworkout (title,  workout,sub_workout_id, planned_quota, description) VALUES
("first table", "Medium Workout 1", 1, 7, "Long Workout"),
("Second table", "Medium Workout 1", 2, 9, "Medium Workout 1"),
("Third table", "Medium Workout 1", 3, 2.6, "Medium Workout 2"),
("Fourth table", "Medium Workout 1", 4, 4.2, "Short Workout 1"),
("Fifth table", "Medium Workout 1", 5, 74, "Short Workout 2"),
("sixth table", "Medium Workout 1", 6, 20, "Short Workout 2"),
("seventh table","Medium Workout 1",7,56,"seven times "),
("eight talbe","Medium Workout 1",8,9,"eight times is the table"),
("nine table","Medium Workout 1",9,21,"nine table is ok as well"),
("ten table","Medium Workout 1",10,11,"nine table is ok as well"),
("eleven table","Medium Workout 1",11,3,"nine table is ok as well");


INSERT INTO plannedworkout (title,  workout,sub_workout_id, planned_quota, description) VALUES
("first table", "Medium Workout 2", 1, 7, "Long Workout"),
("Second table", "Medium Workout 2", 2, 66, "Medium Workout 1"),
("Third table", "Medium Workout 2", 3, 8.2, "Medium Workout 2"),
("Fourth table", "Medium Workout 2", 4, 4, "Short Workout 1"),
("Fifth table", "Medium Workout 2", 5, 3, "Short Workout 2"),
("sixth table", "Medium Workout 2", 6, 20, "Short Workout 2"),
("seventh table","Medium Workout 2",7,56,"seven times "),
("eight talbe","Medium Workout 2",8,9,"eight times is the table"),
("nine table","Medium Workout 2",9,21,"nine table is ok as well"),
("ten table","Medium Workout 2",10,11,"nine table is ok as well"),
("eleven table","Medium Workout 2",11,3,"nine table is ok as well");

INSERT INTO plannedworkout (title,  workout,sub_workout_id, planned_quota, description) VALUES
("first table", "Short Workout 1", 1, 5, "Long Workout"),
("Second table", "Short Workout 1", 2, 11, "Medium Workout 1"),
("Third table", "Short Workout 1", 3, 6, "Medium Workout 2"),
("Fourth table", "Short Workout 1", 4, 21, "Short Workout 1"),
("Fifth table", "Short Workout 1", 5, 25, "Short Workout 2"),
("sixth table", "Short Workout 1", 6, 20, "Short Workout 2"),
("seventh table","Short Workout 1",7,56,"seven times "),
("eight talbe","Short Workout 1",8,9,"eight times is the table"),
("nine table","Short Workout 1",9,21,"nine table is ok as well"),
("ten table","Short Workout 1",10,11,"nine table is ok as well"),
("eleven table","Short Workout 1",11,3,"nine table is ok as well");

INSERT INTO plannedworkout (title,  workout,sub_workout_id, planned_quota, description) VALUES
("first table", "Short Workout 2", 1,41, "Long Workout"),
("Second table", "Short Workout 2", 2, 5, "Medium Workout 1"),
("Third table", "Short Workout 2", 3, 8, "Medium Workout 2"),
("Fourth table", "Short Workout 2", 4, 2, "Short Workout 1"),
("Fifth table", "Short Workout 2", 5, 3, "Short Workout 2"),
("sixth table", "Short Workout 2", 6, 20, "Short Workout 2"),
("seventh table","Short Workout 2",7,56,"seven times "),
("eight talbe","Short Workout 2",8,9,"eight times is the table"),
("nine table","Short Workout 2",9,21,"nine table is ok as well"),
("ten table","Short Workout 2",10,11,"nine table is ok as well"),
("eleven table","Short Workout 2",11,3,"nine table is ok as well")


CREATE TABLE `columnworkoutmapping`(
    id INT PRIMARY KEY AUTO_INCREMENT,
    activities VARCHAR(255) NOT NULL,
    columnname VARCHAR(255) NOT NULL,
    workout VARCHAR(255) NOT NULL
    )

INSERT INTO columnworkoutmapping(activities,columnname,workout) VALUES
('1','first','long_workout'),
('1','second','medium_workout_1'),
('1','third','medium_workout_2'),
('1','fourth','short_workout_1'),
('1','fifth','short_workout_2');

INSERT INTO columnworkoutmapping(activities,columnname,workout) VALUES
('2','first','Ride 1'),
('2','second','Ride 2'),
('2','third','Ride 3'),
('2','fourth','Ride 4'),
('2','fifth','Ride 5');







INSERT INTO goals 
(`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES
 (25, 0, 0, 55, 55, 55, 50, 0,  76, 15, 9, 0, 0,0, 0, 1, 'Half Marathon'),
  (26, 0, 0, 32, 32, 27, 20, 0,  38, 25, 22, 16, 0,0, 0, 1, 'Half Marathon'), 
  (1, 0, 0, 33.82, 28.82, 24.47, 18.67, 0, 35, 20, 17, 13, 15,0, 0, 1, 'Half Marathon'),
   (2, 0, 0, 38, 32, 28, 21, 0,  34, 21, 18, 11, 16,0, 0, 1, 'Half Marathon'),
    (3, 0, 0, 42.54, 35.54, 30.59, 21.59, 0,  33, 18, 21, 12, 16,0, 0, 1, 'Half Marathon'), 
    (4, 0, 0, 35, 31, 26, 18, 0,  31, 20, 23, 14, 11,0, 0, 1, 'Half Marathon'), 
    (5, 0, 0, 39.95, 34.95, 30, 21, 0,  38, 15, 23, 12, 13,0, 0, 1, 'Half Marathon'), 
    (6, 0, 0, 45, 39, 33, 25, 0,  36, 20, 18, 13, 13 ,0,0, 1, 'Half Marathon'),
     (7, 0, 0, 41.68, 37.68, 32.28, 25.28, 0,  41, 20, 17, 13, 10,0, 0, 1, 'Half Marathon'),
      (8, 0, 0, 39.26, 34.26, 30.21, 20.21, 0,  36, 16, 25, 10, 13,0, 0, 1, 'Half Marathon'),
       (9, 0, 0, 41.14, 35.14, 30.19, 23.59, 0,  39, 18, 16, 12, 15,0, 0, 1, 'Half Marathon'), 
       (10, 0, 0, 43.68, 39.68, 34.28, 25.28, 0,  39, 19, 21, 12, 9,0, 0, 1, 'Half Marathon'), 
       (11, 0, 0, 47.68, 42.68, 37.28, 26.28, 0,  38, 17, 23, 11, 10,0, 0, 1, 'Half Marathon'),
        (12, 0, 0, 39.78, 33.78, 29.13, 20.13, 0,  33, 18, 23, 12, 15,0, 0, 1, 'Half Marathon'), 
        (13, 0, 0, 41.72, 37.72, 32.62, 25.82, 0,  43, 19, 16, 12, 10,0, 0, 1, 'Half Marathon'),
         (14, 0, 0, 42.6, 37.6, 32.2, 25, 0,  45, 14, 17, 13, 12,0, 0, 1, 'Half Marathon'), 
         (15, 0, 0, 47.25, 41.25, 36, 27, 0,  42, 15, 19, 11, 13,0, 0, 1, 'Half Marathon'), 
         (16, 0, 0, 38.26, 34.26, 30.21, 21.21, 0,  39, 16, 24, 11, 10,0, 0, 1, 'Half Marathon'),
          (17, 0, 0, 42.54, 37.54, 32.59, 23.59, 0,  38, 18, 21, 12, 12,0, 0, 1, 'Half Marathon'), 
          (18, 0, 0, 46, 40, 34, 25, 0,  39, 15, 20, 13, 13,0, 0, 1, 'Half Marathon'), 
(19, 0, 0, 44.88, 40.88, 35.48, 28.28, 0,  45, 18, 16, 12, 9,0, 0, 1, 'Half Marathon'), 
(20, 0, 0, 38.26, 33.26, 29.21, 19.21, 0,  34, 16, 26, 11, 13,0, 0, 1, 'Half Marathon'), 
(21, 0, 0, 44.65, 38.65, 34, 26, 0,  38, 20, 18, 10, 13,0, 0, 1, 'Half Marathon'),
(22, 0, 0, 53, 47, 42, 34, 0,  38, 20, 18, 10, 13,0, 0, 1, 'Half Marathon'),
(23, 0, 0, 44.65, 38.65, 34, 26, 0,  38, 20, 18, 10, 13,0, 0, 1, 'Half Marathon'),
(24, 0, 0, 44.65, 38.65, 34, 26, 0,  38, 20, 18, 10, 13,0, 0, 1, 'Half Marathon');








INSERT INTO goals 
(`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES
 (24, 0, 0, 41.001, 35.001, 30.186, 21.186, 0, 34, 18, 22, 12, 15, 0,0, 1, '10K'),
  (25, 0, 0, 33, 33, 33, 28, 0, 64, 21, 15, 0, 0, 0, 0,1, '10K'), 
  (26, 0, 0, 21, 21, 21, 16, 0, 43, 33, 24, 0, 0, 0,0, 1, '10K'),
   (1, 0, 0, 23.02, 19.02, 15.02, 11.02, 0,  26, 22, 17, 17, 17, 0,0, 1, '10K'), 
   (2, 0, 0, 28.5, 23.5, 19, 14, 0,  28, 21, 18, 16, 18, 0, 0,1, '10K'), 
   (3, 0, 0, 28.95, 24.95, 20, 15, 0,  31, 21, 17, 17, 14, 0, 0,1, '10K'), 
   (4, 0, 0, 22.9, 22.9, 19, 13, 0, 35, 22, 26, 17, 0, 0,0, 1, '10K'), 
   (5, 0, 0, 28.95, 24.95, 20, 15, 0,  31, 21, 17, 17, 14, 0,0, 1, '10K'), 
   (6, 0, 0, 31.1, 26.1, 21, 16, 0,  32, 19, 16, 16, 16, 0, 0,1, '10K'),
    (7, 0, 0, 30.6, 26.6, 21.2, 14.2, 0,  30, 16, 23, 18, 13, 0, 0,1, '10K'),
     (8, 0, 0, 23.22, 23.22, 19.17, 13.17, 0, 35, 22, 26, 17, 0, 0, 0,1, '10K'), 
     (9, 0, 0, 31.95, 27.95, 23, 16, 0,  31, 19, 22, 15, 13, 0, 0,1, '10K'), 
     (10, 0, 0, 30.4, 25.4, 20, 14, 0,  30, 16, 20, 18, 16, 0, 0,1, '10K'), 
     (11, 0, 0, 31.4, 27.4, 22, 16, 0,  29, 22, 19, 17, 13, 0, 0,1, '10K'),
      (12, 0, 0, 25.65, 25.65, 21, 16, 0 ,39, 23, 19, 18, 0, 0, 0,1, '10K'),
       (13, 0, 0, 30.95, 26.95, 22, 16, 0,  29, 23, 19, 16, 13, 0, 0,1, '10K'), 
       (14, 0, 0, 31.1, 26.1, 21, 16, 0,  32, 19, 16, 16, 16, 0,0, 1, '10K'), 
       (15, 0, 0, 33.4, 29.4, 24, 18, 0,  33, 21, 18, 16, 12, 0, 0,1, '10K'),
        (16, 0, 0, 24.45, 24.45, 20.4, 15, 0, 37, 25, 22, 17, 0, 0, 0,1, '10K'), 
        (17, 0, 0, 32.95, 28.95, 24, 18, 0,  36, 18, 18, 15, 12, 0, 0,1, '10K'), 
        (18, 0, 0, 32.6, 27.6, 22.2, 15.2, 0,  28, 18, 21, 17, 15, 0, 0,1, '10K'), 
        (19, 0, 0, 32.4, 28.4, 23, 17, 0,  31, 22, 19, 17, 12, 0, 0,1, '10K'),
        (20, 0, 0,25, 25, 20, 15, 0,  36, 25, 20, 19,0, 0, 0,1, '10K'),
        (21, 0, 0, 34, 30, 25, 19, 0,  35, 21, 18, 15, 12, 0, 0,1, '10K'),
        (22, 0, 0, 34, 29, 24, 17, 0,  32, 17, 20, 16, 15, 0,0, 1, '10K'),
        (23, 0, 0, 32, 28, 23, 17, 0,  31, 22, 19, 17, 12, 0, 0,1, '10K');


INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) 
VALUES (22, 0, 0, 34.4, 29.4, 24, 17, 0,  32, 17, 20, 16, 15,0, 0, 1, 'GoalX'), 
(23, 0, 0, 32.4, 28.4, 23, 17, 0,  31, 22, 19, 17, 12,0, 0, 1, 'GoalX'), 
(24, 0, 0, 25.033, 25.033, 20.383, 15.383, 0 ,32, 29, 20, 19, 0,0, 0, 1, 'GoalX'), 
(25, 0, 0, 20, 20, 20, 15, 0,50, 25, 25, 0, 0, 0,0, 1, 'GoalX'), 
(26, 0, 0, 17, 17, 17, 12, 0,41, 29, 29, 0, 0, 0,0, 1, 'GoalX'), 
(1, 0, 0, 23.02, 19.02, 15.02, 11.02, 0,  26, 22, 17, 17, 17, 0,0, 1, 'GoalX'), 
(2, 0, 0, 28.5, 23.5, 19, 14, 0,  28, 21, 18, 16, 18, 0,0, 1, 'GoalX'), 
(3, 0, 0, 28.95, 24.95, 20, 15, 0,  31, 21, 17, 17, 14, 0,0, 1, 'GoalX'), 
(4, 0, 0, 22.9, 22.9, 19, 13, 0,35, 22, 26, 17, 0,0, 0, 1, 'GoalX'), 
(5, 0, 0, 28.95, 24.95, 20, 15, 0,  31, 21, 17, 17, 14,0, 0, 1, 'GoalX'), 
(6, 0, 0, 31.1, 26.1, 21, 16, 0,  32, 19, 16, 16, 16, 0,0, 1, 'GoalX'), 
(7, 0, 0, 30.6, 26.6, 21.2, 14.2, 0,  30, 16, 23, 18, 13,0, 0, 1, 'GoalX'), 
(8, 0, 0, 23.22, 23.22, 19.17, 13.17, 0,35, 22, 26, 17, 0, 0,0, 1, 'GoalX'), 
(9, 0, 0, 31.95, 27.95, 23, 16, 0,  31, 19, 22, 15, 13,0, 0, 1, 'GoalX'), 
(10, 0, 0, 30.4, 25.4, 20, 14, 0,  30, 16, 20, 18, 16, 0,0, 1, 'GoalX'), 
(11, 0, 0, 31.4, 27.4, 22, 16, 0,  29, 22, 19, 17, 13,0, 0, 1, 'GoalX'), 
(12, 0, 0, 25.65, 25.65, 21, 16, 0,39, 23, 19, 18, 0,0, 0, 1, 'GoalX'), 
(13, 0, 0, 30.95, 26.95, 22, 16, 0,  29, 23, 19, 16, 13,0, 0, 1, 'GoalX'), 
(14, 0, 0, 31.1, 26.1, 21, 16, 0,  32, 19, 16, 16, 16,0, 0, 1, 'GoalX'), 
(15, 0, 0, 33.4, 29.4, 24, 18, 0,  33, 21, 18, 16, 12,0, 0, 1, 'GoalX'), 
(16, 0, 0, 24.45, 24.45, 20.4, 15, 0 ,37, 25, 22, 17, 0, 0,0, 1, 'GoalX'), 
(17, 0, 0, 32.95, 28.95, 24, 18, 0,  36, 18, 18, 15, 12,0, 0, 1, 'GoalX'), 
(18, 0, 0, 32.6, 27.6, 22.2, 15.2, 0,  28, 18, 21, 17, 15, 0,0, 1, 'GoalX'),
(19, 0, 0, 32, 28, 23, 17, 0,  31, 22, 19, 17, 12,0, 0, 1, 'GoalX'),
(20, 0, 0, 25, 25, 20, 15, 0,  36, 25, 20, 19, 0,0, 0, 1, 'GoalX'),
(21, 0, 0, 34, 30, 25,19, 0,  35, 21, 18, 15, 12,0, 0, 1, 'GoalX');

INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 135, 75, 75, 60, 45, 35, 19, 19, 15, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 150, 90, 60, 45, 45, 38, 23, 15, 12, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 165, 75, 60, 60, 45, 41, 19, 15, 15, 11, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 105, 45, 45, 45, 0, 44, 19, 19, 19, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 150, 75, 90, 75, 45, 34, 17, 21, 17, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 165, 90, 75, 60, 60, 37, 20, 17, 13, 13, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 180, 90, 75, 60, 45, 40, 20, 17, 13, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 135, 60, 45, 45, 0, 47, 21, 16, 16, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 165, 75, 90, 75, 60, 35, 16, 19, 16, 13, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 195, 90, 75, 60, 45, 42, 19, 16, 13, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 165, 105, 90, 75, 60, 33, 21, 18, 15, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 195, 75, 60, 45, 0, 52, 20, 16, 12, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 135, 75, 75, 60, 45, 35, 19, 19, 15, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 150, 90, 60, 45, 45, 38, 23, 15, 12, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 165, 75, 60, 60, 45, 41, 19, 15, 15, 11, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 105, 45, 45, 45, 0, 44, 19, 19, 19, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 150, 75, 90, 75, 45, 34, 17, 21, 17, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 165, 90, 75, 60, 60, 37, 20, 17, 13, 13, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 180, 90, 75, 60, 45, 40, 20, 17, 13, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 135, 60, 45, 45, 0, 47, 21, 16, 16, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 165, 75, 90, 75, 60, 35, 16, 19, 16, 13, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 195, 90, 75, 60, 45, 42, 19, 16, 13, 10, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 165, 105, 90, 75, 60, 33, 21, 18, 15, 12, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 195, 75, 60, 45, 0, 52, 20, 16, 12, 0, 0, 0, 2, '75K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 210, 105, 90, 60, 45, 41, 21, 18, 12, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 225, 120, 75, 60, 45, 43, 23, 14, 11, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 240, 105, 60, 75, 45, 46, 20, 11, 14, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 180, 75, 45, 45, 0, 52, 22, 13, 13, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 225, 105, 105, 75, 45, 41, 19, 19, 14, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 240, 120, 90, 60, 60, 42, 21, 16, 11, 11, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 255, 120, 75, 60, 45, 46, 22, 14, 11, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 210, 90, 45, 45, 0, 54, 23, 12, 12, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 240, 105, 105, 75, 60, 41, 18, 18, 13, 10, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 270, 120, 90, 60, 45, 46, 21, 15, 10, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 240, 135, 105, 75, 60, 39, 22, 17, 12, 10, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 270, 105, 60, 45, 0, 56, 22, 12, 9, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 210, 105, 90, 60, 45, 41, 21, 18, 12, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 225, 120, 75, 60, 45, 43, 23, 14, 11, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 240, 105, 60, 75, 45, 46, 20, 11, 14, 9, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 180, 75, 45, 45, 0, 52, 22, 13, 13, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 225, 105, 105, 75, 45, 41, 19, 19, 14, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 240, 120, 90, 60, 60, 42, 21, 16, 11, 11, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 255, 120, 75, 60, 45, 46, 22, 14, 11, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 210, 90, 45, 45, 0, 54, 23, 12, 12, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 240, 105, 105, 75, 60, 41, 18, 18, 13, 10, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 270, 120, 90, 60, 45, 46, 21, 15, 10, 8, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 240, 135, 105, 75, 60, 39, 22, 17, 12, 10, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 270, 105, 60, 45, 0, 56, 22, 12, 9, 0, 0, 0, 2, '100K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 240, 120, 105, 75, 45, 41, 21, 18, 13, 8, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 255, 135, 90, 75, 60, 41, 22, 15, 12, 10, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 270, 120, 75, 90, 45, 45, 20, 12, 15, 8, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 210, 90, 60, 60, 0, 50, 21, 14, 14, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 255, 120, 120, 90, 60, 40, 19, 19, 14, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 270, 135, 105, 75, 45, 43, 21, 17, 12, 7, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 285, 135, 90, 75, 60, 44, 21, 14, 12, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 240, 105, 60, 60, 0, 52, 23, 13, 13, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 270, 120, 120, 90, 60, 41, 18, 18, 14, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 300, 135, 105, 75, 45, 45, 20, 16, 11, 7, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 270, 150, 120, 90, 75, 38, 21, 17, 13, 11, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 300, 120, 75, 60, 0, 54, 22, 14, 11, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 240, 120, 105, 75, 45, 41, 21, 18, 13, 8, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 255, 135, 90, 75, 60, 41, 22, 15, 12, 10, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 270, 120, 75, 90, 45, 45, 20, 12, 15, 8, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 210, 90, 60, 60, 0, 50, 21, 14, 14, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 255, 120, 120, 90, 60, 40, 19, 19, 14, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 270, 135, 105, 75, 45, 43, 21, 17, 12, 7, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 285, 135, 90, 75, 60, 44, 21, 14, 12, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 240, 105, 60, 60, 0, 52, 23, 13, 13, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 270, 120, 120, 90, 60, 41, 18, 18, 14, 9, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 300, 135, 105, 75, 45, 45, 20, 16, 11, 7, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 270, 150, 120, 90, 75, 38, 21, 17, 13, 11, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 300, 120, 75, 60, 0, 54, 22, 14, 11, 0, 0, 0, 2, '125K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 255, 135, 105, 75, 45, 41, 22, 17, 12, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 270, 150, 90, 75, 60, 42, 23, 14, 12, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 285, 120, 75, 90, 45, 46, 20, 12, 15, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 225, 120, 60, 60, 0, 48, 26, 13, 13, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 270, 135, 120, 90, 60, 40, 20, 18, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 285, 150, 105, 75, 45, 43, 23, 16, 11, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 300, 150, 90, 90, 60, 43, 22, 13, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 255, 105, 60, 60, 0, 53, 22, 12, 12, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 285, 135, 120, 90, 60, 41, 20, 17, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 315, 150, 105, 90, 45, 45, 21, 15, 13, 6, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 285, 150, 120, 90, 75, 40, 21, 17, 12, 10, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 315, 120, 75, 60, 0, 55, 21, 13, 11, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 255, 135, 105, 75, 45, 41, 22, 17, 12, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 270, 150, 90, 75, 60, 42, 23, 14, 12, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 285, 120, 75, 90, 45, 46, 20, 12, 15, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 225, 120, 60, 60, 0, 48, 26, 13, 13, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 270, 135, 120, 90, 60, 40, 20, 18, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 285, 150, 105, 75, 45, 43, 23, 16, 11, 7, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 300, 150, 90, 90, 60, 43, 22, 13, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 255, 105, 60, 60, 0, 53, 22, 12, 12, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 285, 135, 120, 90, 60, 41, 20, 17, 13, 9, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 315, 150, 105, 90, 45, 45, 21, 15, 13, 6, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 285, 150, 120, 90, 75, 40, 21, 17, 12, 10, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 315, 120, 75, 60, 0, 55, 21, 13, 11, 0, 0, 0, 2, '150K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 300, 165, 105, 75, 45, 43, 24, 15, 11, 7, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 315, 180, 105, 75, 60, 43, 24, 14, 10, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 330, 165, 90, 90, 45, 46, 23, 12, 12, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 270, 120, 75, 60, 0, 51, 23, 14, 11, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 315, 180, 120, 90, 60, 41, 24, 16, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 330, 165, 105, 75, 45, 46, 23, 15, 10, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 345, 180, 90, 90, 60, 45, 24, 12, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 300, 105, 90, 60, 0, 54, 19, 16, 11, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 330, 180, 120, 90, 60, 42, 23, 15, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 360, 180, 105, 90, 45, 46, 23, 13, 12, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 330, 180, 120, 90, 75, 42, 23, 15, 11, 9, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 360, 120, 90, 60, 0, 57, 19, 14, 10, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 300, 165, 105, 75, 45, 43, 24, 15, 11, 7, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 315, 180, 105, 75, 60, 43, 24, 14, 10, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 330, 165, 90, 90, 45, 46, 23, 12, 12, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 270, 120, 75, 60, 0, 51, 23, 14, 11, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 315, 180, 120, 90, 60, 41, 24, 16, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 330, 165, 105, 75, 45, 46, 23, 15, 10, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 345, 180, 90, 90, 60, 45, 24, 12, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 300, 105, 90, 60, 0, 54, 19, 16, 11, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 330, 180, 120, 90, 60, 42, 23, 15, 12, 8, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 360, 180, 105, 90, 45, 46, 23, 13, 12, 6, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 330, 180, 120, 90, 75, 42, 23, 15, 11, 9, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 360, 120, 90, 60, 0, 57, 19, 14, 10, 0, 0, 0, 2, '300K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (1, 0, 0, 270, 165, 105, 75, 45, 41, 25, 16, 11, 7, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (2, 0, 0, 285, 180, 105, 75, 60, 40, 26, 15, 11, 9, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (3, 0, 0, 300, 150, 90, 90, 45, 44, 22, 13, 13, 7, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (4, 0, 0, 240, 120, 60, 60, 0, 50, 25, 12, 12, 0, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (5, 0, 0, 285, 165, 120, 90, 60, 40, 23, 17, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (6, 0, 0, 300, 180, 105, 75, 45, 43, 26, 15, 11, 6, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (7, 0, 0, 315, 180, 90, 90, 60, 43, 24, 12, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (8, 0, 0, 270, 105, 60, 60, 0, 55, 21, 12, 12, 0, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (9, 0, 0, 300, 165, 120, 90, 60, 41, 22, 16, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (10, 0, 0, 330, 180, 105, 90, 45, 44, 24, 14, 12, 6, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (11, 0, 0, 300, 180, 120, 90, 75, 39, 24, 16, 12, 10, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (12, 0, 0, 330, 120, 75, 60, 0, 56, 21, 13, 10, 0, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (13, 0, 0, 270, 165, 105, 75, 45, 41, 25, 16, 11, 7, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (14, 0, 0, 285, 180, 105, 75, 60, 40, 26, 15, 11, 9, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (15, 0, 0, 300, 150, 90, 90, 45, 44, 22, 13, 13, 7, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (16, 0, 0, 240, 120, 60, 60, 0, 50, 25, 12, 12, 0, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (17, 0, 0, 285, 165, 120, 90, 60, 40, 23, 17, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (18, 0, 0, 300, 180, 105, 75, 45, 43, 26, 15, 11, 6, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (19, 0, 0, 315, 180, 90, 90, 60, 43, 24, 12, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (20, 0, 0, 270, 105, 60, 60, 0, 55, 21, 12, 12, 0, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (21, 0, 0, 300, 165, 120, 90, 60, 41, 22, 16, 12, 8, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (22, 0, 0, 330, 180, 105, 90, 45, 44, 24, 14, 12, 6, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (23, 0, 0, 300, 180, 120, 90, 75, 39, 24, 16, 12, 10, 0, 0, 2, '200K');
INSERT INTO goals (`week`, `sevendays`, `sixdays`, `fivedays`, `fourdays`, `threedays`, `twodays`, `onedays`, `first`, `second`, `third`, `fourth`, `fifth`, `sixth`, `seventh`, `activity_id`, `goal`) VALUES  (24, 0, 0, 330, 120, 75, 60, 0, 56, 21, 13, 10, 0, 0, 0, 2, '200K');
