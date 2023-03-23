TRUNCATE TABLE cohorts, students RESTART IDENTITY;

INSERT INTO cohorts (cohort_name, starting_dates) VALUES ('Feb_apprentice', '01/02/2023');
INSERT INTO cohorts (cohort_name, starting_dates) VALUES ('Mar_apprentice', '01/03/2023');

INSERT INTO students (name, cohort_id) VALUES ('Ray', '1');
INSERT INTO students (name, cohort_id) VALUES ('Jack', '2');
INSERT INTO students (name, cohort_id) VALUES ('Jay', '1');