--create view based on our original tables:
--a consolidated view of personal training sessions, detailing trainees, trainers, training session specifics (date, hour, location, cost), training types and durations, and items used during the training.
CREATE OR REPLACE VIEW PersonalTrainingView AS
SELECT
    T1.Person_ID AS Trainee_ID,
    T1.First_Name AS Trainee_First_Name,
    T1.Last_Name AS Trainee_Last_Name,
    T2.Person_ID AS Trainer_ID,
    T2.First_Name AS Trainer_First_Name,
    T2.Last_Name AS Trainer_Last_Name,
    AT.Training_Date,
    AT.Training_Hour,
    AT.Training_Location,
    AT.Training_Cost,
    TRG.Training_Type,
    TRG.Duration,
    I.Item_Name,
    I.Purpose AS Item_Purpose
FROM Actual_Training AT
JOIN (SELECT Person_ID, First_Name, Last_Name FROM Person) T1 ON AT.Person_ID1 = T1.Person_ID
JOIN (SELECT Person_ID, First_Name, Last_Name FROM Person) T2 ON AT.Person_ID2 = T2.Person_ID
JOIN Trainee TR ON T1.Person_ID = TR.Person_ID
JOIN Trainer TRR ON T2.Person_ID = TRR.Person_ID
JOIN Training TRG ON AT.Training_Code = TRG.Training_Code
LEFT JOIN Uses U ON TRG.Training_Code = U.Training_Code
LEFT JOIN Item I ON U.Item_Code = I.Item_Code;

--show the results:

select * from PersonalTrainingView;

--queries of the view

--a query that calculates the average training cost per session for each trainer:
SELECT
    Trainer_ID,
    Trainer_First_Name,
    Trainer_Last_Name,
    AVG(Training_Cost) AS Avg_Training_Cost_Per_Session
FROM
    PersonalTrainingView
WHERE
    Training_Cost IS NOT NULL
GROUP BY
    Trainer_ID,
    Trainer_First_Name,
    Trainer_Last_Name
ORDER BY
    Avg_Training_Cost_Per_Session DESC;



--a query that counts the number of training types each trainee has participated in: 
SELECT
    Trainee_ID,
    Trainee_First_Name,
    Trainee_Last_Name,
    COUNT(DISTINCT Training_Type) AS Num_Distinct_Training_Types
FROM
    PersonalTrainingView
GROUP BY
    Trainee_ID,
    Trainee_First_Name,
    Trainee_Last_Name
HAVING
    COUNT(DISTINCT Training_Type) > 1
ORDER BY
    Num_Distinct_Training_Types DESC;





-------------------------------------------------
--create view based on the tables we recieved:
--a view of each class conducted in the gym, detailing the class information, the trainer assigned, the count of trainees enrolled, the gym location, and the number of devices utilized during the class.
CREATE OR REPLACE VIEW GymClassView AS
SELECT
    CI.class_number AS Class_Number,
    CI.class_name AS Class_Name,
    CI.class_day AS Class_Day,
    CI.class_hour AS Class_Hour,
    T.person_id AS Trainer_ID,
    P.first_name AS Trainer_Name,
    COUNT(distinct TK.person_id) AS Num_of_Trainees,
    G.gym_number AS Gym_Number,
    G.gym_name AS Gym_Name,
    COUNT(distinct UI.device_number) AS Num_of_Devices_Used
FROM class_lesson CI
JOIN trainer T ON CI.person_id = T.person_id
JOIN person P ON T.person_id = P.person_id
LEFT JOIN  takes TK ON CI.class_number = TK.class_number
JOIN gym G ON CI.gym_number = G.gym_number
LEFT JOIN used_in UI ON CI.class_number = UI.class_number
GROUP BY CI.class_number, CI.class_name, CI.class_day, CI.class_hour, T.person_id, P.first_name, G.gym_number, G.gym_name;



--show the results:
select * from GymClassView;

--queries of the view

--a query that identifies trainers who conduct the most classes and calculates the average number of trainees in those classes.
SELECT
    GC.Trainer_ID,
    GC.Trainer_Name,
    COUNT(GC.Class_Number) AS Num_of_Classes,
    AVG(GC.Num_of_Trainees) AS Avg_Num_of_Trainees
FROM
    GymClassView GC
GROUP BY
    GC.Trainer_ID,
    GC.Trainer_Name
HAVING COUNT(GC.Class_Number) = (
        SELECT MAX(Class_Count)
        FROM (
            SELECT Trainer_ID, COUNT(Class_Number) AS Class_Count
            FROM GymClassView
            GROUP BY Trainer_ID
        ));

--a query that shows each gym's name, number, number of different classes, and the most popular class scheduled most frequently.
SELECT
    Gym_Number,
    Gym_Name,
    COUNT(distinct Class_Name) as Number_Of_Different_Classes,
    MAX(Class_Name) as Most_Popular
FROM
    GymClassView
GROUP BY 
    Gym_Number,
    Gym_Name
ORDER BY
    Number_Of_Different_Classes DESC
