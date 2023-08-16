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


CREATE TABLE activites (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO activites (activity_name) VALUES
    ("Running"),
    ("Cycling"),
    ("Swimming");

CREATE TABLE lelel (
    id INT PRIMARY KEY AUTO_INCREMENT,
    level VARCHAR(255) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lelel (level) VALUES
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



CREATE TABLE activites_classification (
    id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT NOT NULL,
    distance INT NOT NULL,
    level_id INT NOT NULL,
    from_range TIME NOT NULL,
    end_range TIME NOT NULL,
    FOREIGN KEY (activity_id) REFERENCES activites(id),
    FOREIGN KEY (level_id) REFERENCES lelel(id)
);

INSERT INTO activites_classifications (activity_id, distance, fitness_group, from_range, end_range) VALUES
    (1, 5, 1, "0:40:01", "1:00:00"),
    (1,5, 2, "0:30:01", "0:40:00"),
    (1,5,3,"0:25:01",	"0:30:00"),
     (1,5,4,"0:20:01",	"0:25:00"),
      (1,5,5,"0:00:00",	"0:20:00");


INSERT INTO activites_classifications (activity_id, distance, fitness_group, from_range, end_range) VALUES
    (2, 10, 1, "0:30:00", "0:50:00"),
    (2,10, 2, "0:22:14", "0:29:59"),
    (2,10,3,"0:18:11",	"0:22:13"),
     (2,10,4,"0:15:47",	"0:18:10"),
      (2,10,5,"0:10:00",	"0:15:46");

INSERT INTO activites_classifications (activity_id, distance, fitness_group, from_range, end_range) VALUES
    (3, 0.1, 1, "0:03:45", "0:05:00"),
    (3,0.1, 2, "0:02:30", "0:03:45"),
    (3,0.1,3,"0:02:00",	"0:02:30"),
     (3,0.1,4,"0:01:30",	"0:02:00"),
      (3,0.1,5,"0:00:00",	"0:01:30");

INSERT INTO activites_classifications (activity_id, distance, fitness_group, from_range, end_range) VALUES
    (3, 0.4, 1, "0:15:01", "0:20:00"),
    (3,0.4, 2, "0:10:01", "0:15:00"),
    (3,0.4,3,"0:08:01",	"0:10:00"),
     (3,0.4,4,"0:06:01",	"0:08:00"),
      (3,0.4,5,"0:00:00",	"0:06:00");

