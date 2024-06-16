--Select the average, minimum, and maximum salary of trainers for each seniority level who have conducted trainings in the last year
SELECT Tr.Seniority, AVG(Tr.Salary) AS Average_Salary, MIN(Tr.Salary) AS Minimum_Salary, MAX(Tr.Salary) AS Maximum_Salary
FROM Trainer Tr
WHERE Tr.Person_ID IN (SELECT AT.Person_ID2
                       FROM Actual_Training AT
                       WHERE AT.Training_Date >= ADD_MONTHS(SYSDATE, -12) )
GROUP BY Tr.Seniority
ORDER BY Tr.Seniority;

--Select the type of training that uses the heaviest total weight of items, the total weight, and the times that this type of training was actually taken: 
SELECT T.TRAINING_TYPE, SUM(I.Weight) AS Total_Weight, COUNT(DISTINCT AT.Actual_Training_Code) AS Training_Count
FROM Training T
JOIN Uses U ON T.Training_Code = U.Training_Code
JOIN Item I ON U.Item_Code = I.Item_Code
JOIN Actual_Training AT ON T.Training_Code = AT.Training_Code
GROUP BY T.Training_Code, T.TRAINING_TYPE
HAVING SUM(I.Weight) = (SELECT MAX(Total_Weight)
                        FROM (SELECT SUM(I2.Weight) AS Total_Weight
                              FROM Uses U2
                              JOIN Item I2 ON U2.Item_Code = I2.Item_Code
                              GROUP BY U2.Training_Code))
                              
--Select pairs of ids of trainers and trainees so that the coach trained the trainee more than once, and how many times they actually trained together:
SELECT DISTINCT Trainee_ID, Trainer_ID, Training_Count+1 AS Number_Of_Sessions
FROM (SELECT t1.Person_ID1 AS Trainee_ID, t2.Person_ID2 AS Trainer_ID,(SELECT COUNT(*)
                                                                       FROM Actual_Training t3
                                                                       WHERE t3.Person_ID1 = t1.Person_ID1
                                                                       AND t3.Person_ID2 = t2.Person_ID2
                                                                       AND t3.Actual_Training_Code != t1.Actual_Training_Code) AS Training_Count
    FROM Actual_Training t1
    JOIN Actual_Training t2 ON t1.Person_ID2 = t2.Person_ID2) 
WHERE Training_Count >= 1;

--Select the month in which a certain training type was repeated the most times, the training type, and how many times it was performed
SELECT EXTRACT(MONTH FROM A.Training_Date) AS Popular_Month, T.Training_Type, COUNT(*) AS Most_Sessions
FROM Training T
JOIN Actual_Training A ON T.Training_Code = A.Training_Code
GROUP BY T.Training_Type, EXTRACT(MONTH FROM A.Training_Date)
HAVING COUNT(*) = (SELECT MAX(CountSessions)
                   FROM (SELECT COUNT(*) AS CountSessions
                         FROM Training T2
                         JOIN Actual_Training A2 ON T2.Training_Code = A2.Training_Code
                         GROUP BY T2.Training_Type, EXTRACT(MONTH FROM A2.Training_Date)));



--Raise the salary by 10% for the trainer(s) with the highest seniority and rating.
UPDATE Trainer
SET Salary = Salary * 1.1
WHERE Person_ID IN (
    SELECT T.Person_ID
    FROM Trainer T
    JOIN Person P ON T.Person_ID = P.Person_ID
    WHERE T.Seniority >= (SELECT MAX(Seniority)
                         FROM Trainer)
    AND T.Rating = (SELECT MAX(Rating)
                    FROM Trainer));
                    
                    
   
rollback;
--Updating the training cost for future sessions where the trainee has a birthday in the same month of the training.
UPDATE Actual_Training AT
SET Training_Cost = Training_Cost * 0.5
WHERE AT.Training_Date >= SYSDATE
AND EXISTS (SELECT 1
            FROM Trainee TR
            JOIN Person P ON TR.Person_ID = P.Person_ID
            WHERE AT.Person_ID1 = TR.Person_ID
            AND EXRACT(MONTH FROM AT.Training_Date) = EXTRACT(MONTH FROM P.Birth_Date)
);


--Delete trainers that are older than 90 and trainees that are older than 120
DELETE FROM Person
WHERE Person_ID IN (
    SELECT p.Person_ID
    FROM Person p
    LEFT JOIN Trainer t ON p.Person_ID = t.Person_ID
    LEFT JOIN Trainee tr ON p.Person_ID = tr.Person_ID
    WHERE (t.Person_ID IS NOT NULL AND TRUNC(MONTHS_BETWEEN(SYSDATE, p.Birth_Date) / 12) > 90)
       OR (tr.Person_ID IS NOT NULL AND TRUNC(MONTHS_BETWEEN(SYSDATE, p.Birth_Date) / 12) >= 120)
);



--Delete items that has no use, and no weight and that there are more than 50 items from the same type.
DELETE FROM Item
WHERE Item_Code IN (SELECT I.Item_Code
                    FROM Item I
                    LEFT JOIN Uses U ON I.Item_Code = U.Item_Code
                    WHERE U.Item_Code IS NULL
                    AND I.Weight IS NULL
                    AND I.Item_Name IN (SELECT Item_Name
                                        FROM Item
                                        GROUP BY Item_Name
                                        HAVING COUNT(*) > 50));


rollback;
