--Select the training type, average duration of trainings from this type and the count of distinct actual training codes for a specific training type selected by the user from a list of options.
SELECT T.Training_Type, AVG(T.Duration) AS Duration_AVG, COUNT(DISTINCT AT.Actual_Training_Code) AS Training_Count
FROM Training T
JOIN Uses U ON T.Training_Code = U.Training_Code
JOIN Actual_Training AT ON T.Training_Code = AT.Training_Code
WHERE T.Training_Type = &<name="Type" required=true 
list="'Zumba', 'Yoga', 'Pilates', 'CrossFit', 'Spinning', 'Boxing', 'HIIT', 'Strength Training', 'Cardio', 'Dance'" restricted="yes" >
GROUP BY T.Training_Type;


--Select the first name, last name, training type, and training date for all actual trainings that occurred between a specified start and end date range provided by the user.
SELECT P.First_Name, P.Last_Name, T.Training_Type, AT.Training_Date
FROM Person P
JOIN Trainee TR ON P.Person_ID = TR.Person_ID
JOIN Actual_Training AT ON TR.Person_ID = AT.Person_ID1
JOIN Training T ON AT.Training_Code = T.Training_Code
WHERE AT.Training_Date BETWEEN &<name="Start_Date" type="DATE" hint="dd/mm/yyyy" required=true> AND &<name="End_Date" type="DATE" hint="dd/mm/yyyy" required=true>
ORDER BY AT.Training_Date;

--Select the item name, purpose, and the count of training types that use each item. It filters the training codes based on the user's selection of one or more training codes from a multi-select list populated with distinct training codes.
SELECT I.Item_Name, I.Purpose, COUNT(U.Training_Code) AS Training_Count
FROM Item I
LEFT JOIN Uses U ON I.Item_Code = U.Item_Code
WHERE U.Training_Code IN (
  SELECT Training_Code
  FROM Training
  WHERE Training_Code IN (&<name="Training" required=true multiselect="yes"
list="SELECT DISTINCT Training_Code FROM Training ORDER BY Training_Code" restricted="yes">)
)
GROUP BY I.Item_Name, I.Purpose
ORDER BY I.Item_Name;


--Select the first name, last name, seniority, salary, and rating of trainers whose rating is greater than or equal to a minimum rating value provided by the user. The results can be sorted by seniority and rating in either ascending or descending order based on the user's selection from two separate checkbox parameters.
SELECT P.First_Name, P.Last_Name, TR.Seniority, TR.Salary, TR.Rating
FROM Person P
JOIN Trainer TR ON P.Person_ID = TR.Person_ID
WHERE TR.Rating >= &<name="Min_Rating" type="INTEGER" default="3" hint="number between 1-5">
ORDER BY
  TR.Seniority &<name="Sort_Seniority" checkbox="DESC,ASC" default="DESC">,
  TR.Rating &<name="Sort_Rating" checkbox="DESC,ASC" default="DESC">;



