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
    dayscode VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `days_options` (`id`, `run_days_per_week`, `options`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`, `dayscode`) VALUES
(1, 5, 1, 'Rest Day', 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout 2', 'Long Workout', '02346'),
(2, 5, 2, 'Medium Workout 1', 'Short Workout 1', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '12356'),
(3, 5, 3, 'Short Workout', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '01245'),
(4, 4, 1, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', '0246'),
(5, 4, 2, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', '1356'),
(6, 4, 3, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Short Workout', 'Long Workout', 'Rest Day', 'Medium Workout 2', '0245'),
(7, 3, 1, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', '024'),
(8, 3, 2, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', 'Rest Day', '246'),
(9, 3, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Long Workout', '035'),
(10, 3, 4, 'Medium Workout 1', 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '136'),
(11, 3, 5, 'Rest Day', 'Medium Workout 2', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Medium Workout 2', '146'),
(12, 2, 1, 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '16'),
(13, 2, 2, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '03'),
(14, 2, 3, 'Rest Day', 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '36'),
(15, 2, 4, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', '02'),
(16, 2, 5, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', '26'),
(17, 2, 6, 'Rest Day', 'Medium Workout 1', 'Rest Day', 'Rest Day', 'Long Workout', 'Rest Day', 'Rest Day', '25');




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
    FOREIGN KEY (phase) REFERENCES phasename(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





-- phase no 1
INSERT INTO phase (week, phase, phaseno) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 1),
(4, 1, 1),
(5, 1, 1),
(6, 2, 1),
(7, 3, 1),
(8, 1, 1),
(9, 1, 1),
(10, 3, 1),
(11, 3, 1),
(12, 1, 1),
(13, 1, 1),
(14, 1, 1),
(15, 2, 1),
(16, 1, 1),
(17, 1, 1),
(18, 2, 1),
(19, 3, 1),
(20, 1, 1),
(21, 1, 1),
(22, 3, 1),
(23, 3, 1),
(24, 1, 1),
(25, 1, 1),
(26, 1, 1);

-- phase no2
INSERT INTO phase (week, phase, phaseno) VALUES
(1, 1, 2),
(2, 1, 2),
(3, 2, 2),
(4, 1, 2),
(5, 1, 2),
(6, 2, 2),
(7, 3, 2),
(8, 1, 2),
(9, 1, 2),
(10, 3, 2),
(11, 3, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 2, 2),
(16, 1, 2),
(17, 1, 2),
(18, 2, 2),
(19, 3, 2),
(20, 1, 2),
(21, 1, 2),
(22, 3, 2),
(23, 3, 2),
(24, 1, 2),
(25, 1, 2),
(26, 1, 2);

CREATE TABLE workout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    workout varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO workout(workout) VALUES
("Long Workout"),
("Medium Workout 1"),
("Medium Workout 2"),
("Short Workout 1"),
("Short Workout 2");
("Rest Day")

CREATE TABLE subworkout (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subworkout varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO subworkout (subworkout) VALUES
("Time Trial"),
("Race Pace"),
("Aerobic Run"),
("Tempo"),
("Easy"),
("Interval"),
("Easy Run"),
("Fartlek"),
("Long"),
("Hill"),
("Aerobic");


CREATE TABLE phasesubactivity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    phase_id INT NOT NULL,
    workout_id INT NOT NULL,
    subworkout_id INT NOT NULL,
    FOREIGN KEY (subworkout_id) REFERENCES subworkout(id)
    FOREIGN KEY (phase_id) REFERENCES phase(id),
    FOREIGN KEY (workout_id) REFERENCES workout(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO phasesubactivity (phase_id, workout_id, subworkout_id) VALUES
(1, 1, 9),
(1, 2, 1),
(1, 3, 5),
(1, 4, 3),
(1, 5, 8),
(1, 1, 9),
(1, 2, 3),
(1, 3, 6),
(1, 4, 3),
(1, 5, 3),
(1, 1, 9),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(1, 5, 8),
(1, 1, 4),
(1, 2, 3),
(1, 3, 6),
(1, 4, 3),
(1, 5, 8),
(2, 1, 9),
(2, 2, 6),
(2, 3, 3),
(2, 4, 3),
(2, 5, 3),
(2, 1, 2),
(2, 2, 3),
(2, 3, 6),
(2, 4, 3),
(2, 5, 8),
(2, 1, 4),
(2, 2, 3),
(2, 3, 7),
(2, 4, 3),
(2, 5, 8),
(3, 1, 2),
(3, 2, 7),
(3, 3, 6),
(3, 4, 3),
(3, 5, 3),
(3, 1, 10),
(3, 2, 7),
(3, 3, 11),
(3, 4, 3),
(3, 5, 3),
(1, 1, 9),
(1, 2, 3),
(1, 3, 3),
(1, 4, 3),
(1, 5, 8);



CREATE TABLE WorkoutSchedule (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    week INTEGER NOT NULL,
    date DATE NOT NULL,
    day VARCHAR(10) NOT NULL,
    total_quota_for_week VARCHAR(10) NOT NULL,
    day_quota VARCHAR(10) NOT NULL,
    phase VARCHAR(50) NOT NULL,
    workout VARCHAR(50) NOT NULL,
    sub_workout VARCHAR(50) NOT NULL
);


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
    `5_days` INT,
    `4_days` INT,
    `3_days` INT,
    `2_days` INT,
    `long_workout` DECIMAL(5, 2) NOT NULL,
    `medium_workout_1` DECIMAL(5, 2) NOT NULL,
    `medium_workout_2` DECIMAL(5, 2) NOT NULL,
    `short_workout_1` DECIMAL(5, 2) NOT NULL,
    `short_workout_2` DECIMAL(5, 2) NOT NULL,
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
    workout_id INT NOT NULL,
    planned_quota FLOAT NOT NULL,
    description VARCHAR(2550) NOT NULL,
    FOREIGN KEY (workout_id) REFERENCES workout(id),
    FOREIGN KEY (sub_workout_id) REFERENCES subworkout(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO plannedworkout (title,  workout_id,sub_workout_id, planned_quota, description) VALUES
("first table", 1, 1, 4, "Long Workout"),
("Second table", 1, 2, 6.2, "Medium Workout 1"),
("Third table", 1, 3, 8.6, "Medium Workout 2"),
("Fourth table", 1, 4, 5.2, "Short Workout 1"),
("Fifth table", 1, 5, 2, "Short Workout 2"),
("sixth table", 1, 6, 20, "Short Workout 2"),
("seventh table",1,7.56,"seven times "),
("eight talbe",1,8,9,"eight times is the table"),
("nine table",1,9,21,"nine table is ok as well"),
("ten table",1,10,11,"nine table is ok as well"),
("eleven table",1,11,3,"nine table is ok as well")

INSERT INTO plannedworkout (title,  workout_id,sub_workout_id, planned_quota, description) VALUES
("first table", 2, 1, 7, "Long Workout"),
("Second table", 2, 2, 9, "Medium Workout 1"),
("Third table", 2, 3, 2.6, "Medium Workout 2"),
("Fourth table", 2, 4, 4.2, "Short Workout 1"),
("Fifth table", 2, 5, 74, "Short Workout 2")
("sixth table", 1, 6, 20, "Short Workout 2"),
("seventh table",1,7.56,"seven times "),
("eight talbe",1,8,9,"eight times is the table"),
("nine table",1,9,21,"nine table is ok as well"),
("ten table",1,10,11,"nine table is ok as well"),
("eleven table",1,11,3,"nine table is ok as well")


INSERT INTO plannedworkout (title,  workout_id,sub_workout_id, planned_quota, description) VALUES
("first table", 3, 1, 7, "Long Workout"),
("Second table", 3, 2, 66, "Medium Workout 1"),
("Third table", 3, 3, 8.2, "Medium Workout 2"),
("Fourth table", 3, 4, 4, "Short Workout 1"),
("Fifth table", 3, 5, 3, "Short Workout 2")
("sixth table", 1, 6, 20, "Short Workout 2"),
("seventh table",1,7.56,"seven times "),
("eight talbe",1,8,9,"eight times is the table"),
("nine table",1,9,21,"nine table is ok as well"),
("ten table",1,10,11,"nine table is ok as well"),
("eleven table",1,11,3,"nine table is ok as well")

INSERT INTO plannedworkout (title,  workout_id,sub_workout_id, planned_quota, description) VALUES
("first table", 4, 1, 5, "Long Workout"),
("Second table", 4, 2, 11, "Medium Workout 1"),
("Third table", 4, 3, 6, "Medium Workout 2"),
("Fourth table", 4, 4, 21, "Short Workout 1"),
("Fifth table", 4, 5, 25, "Short Workout 2")
("sixth table", 1, 6, 20, "Short Workout 2"),
("seventh table",1,7.56,"seven times "),
("eight talbe",1,8,9,"eight times is the table"),
("nine table",1,9,21,"nine table is ok as well"),
("ten table",1,10,11,"nine table is ok as well"),
("eleven table",1,11,3,"nine table is ok as well")

INSERT INTO plannedworkout (title,  workout_id,sub_workout_id, planned_quota, description) VALUES
("first table", 5, 1,41, "Long Workout"),
("Second table", 5, 2, 5, "Medium Workout 1"),
("Third table", 5, 3, 8, "Medium Workout 2"),
("Fourth table", 5, 4, 2, "Short Workout 1"),
("Fifth table", 5, 5, 3, "Short Workout 2"),
("sixth table", 1, 6, 20, "Short Workout 2"),
("seventh table",1,7.56,"seven times "),
("eight talbe",1,8,9,"eight times is the table"),
("nine table",1,9,21,"nine table is ok as well"),
("ten table",1,10,11,"nine table is ok as well"),
("eleven table",1,11,3,"nine table is ok as well")