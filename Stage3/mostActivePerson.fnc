CREATE OR REPLACE FUNCTION mostActivePerson (FromDate IN DATE, ToDate IN DATE)
RETURN NUMBER
IS
  numTrainingTrainer INTEGER := 0;
  numTrainingTrainee INTEGER := 0;
  bestTrainerId NUMBER := 0;
  bestTraineeId NUMBER := 0;
  bestPersonId NUMBER := 0;
  bestPersonType VARCHAR2(30);
  bestNumTrainings INTEGER := 0;
  firstName Person.First_Name%TYPE;
  lastName Person.Last_Name%TYPE;
BEGIN
  -- Find the trainer with the most trainings in the specified date range
SELECT Person_ID2, num_trainings
INTO bestTrainerId, numTrainingTrainer
FROM (
  SELECT Person_ID2, COUNT(*) AS num_trainings
  FROM Actual_Training
  WHERE Training_Date >= FromDate AND Training_Date <= ToDate
  GROUP BY Person_ID2
  HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Actual_Training
    WHERE Training_Date >= FromDate AND Training_Date <= ToDate
    GROUP BY Person_ID2
  )
)
WHERE ROWNUM <= 1;



  -- Find the trainee with the most trainings in the specified date range
  SELECT Person_ID1, num_trainings
INTO bestTrainerId, numTrainingTrainer
FROM (
  SELECT Person_ID1, COUNT(*) AS num_trainings
  FROM Actual_Training
  WHERE Training_Date >= FromDate AND Training_Date <= ToDate
  GROUP BY Person_ID1
  HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM Actual_Training
    WHERE Training_Date >= FromDate AND Training_Date <= ToDate
    GROUP BY Person_ID1
  )
)
WHERE ROWNUM <= 1;


  -- Determine the most active person
  IF numTrainingTrainer > numTrainingTrainee THEN
    bestPersonId := bestTrainerId;
    bestPersonType := 'trainer';
    bestNumTrainings := numTrainingTrainer;
  ELSE
    bestPersonId := bestTraineeId;
    bestPersonType := 'trainee';
    bestNumTrainings := numTrainingTrainee;
  END IF;

  -- Fetch and print the most active person's name
  SELECT First_Name, Last_Name
  INTO firstName, lastName
  FROM Person
  WHERE Person_ID = bestPersonId;

  DBMS_OUTPUT.PUT_LINE('The most active person is a ' || bestPersonType || ':');
  DBMS_OUTPUT.PUT_LINE('ID: '||bestPersonId||'.' );
  DBMS_OUTPUT.PUT_LINE('NAME:'||firstName || ' ' || lastName||'.');
  DBMS_OUTPUT.PUT_LINE('with ' || bestNumTrainings || ' trainings');

  -- Return the ID of the most active person
  RETURN bestPersonId;
END mostActivePerson;
/
