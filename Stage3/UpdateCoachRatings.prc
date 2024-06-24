CREATE OR REPLACE PROCEDURE UpdateCoachRatings(
  p_month IN NUMBER,
  p_num_trainings IN NUMBER,
  p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE)
) IS
  CURSOR coach_cursor IS
    SELECT t.Person_ID, t.Rating, t.Salary, p.First_Name, p.Last_Name,
           COUNT(at.Actual_Training_Code) as training_count
    FROM Trainer t
    JOIN Person p ON t.Person_ID = p.Person_ID
    JOIN Actual_Training at ON t.Person_ID = at.Person_ID2
    WHERE EXTRACT(MONTH FROM at.Training_Date) = p_month
    AND EXTRACT(YEAR FROM at.Training_Date) = p_year
    GROUP BY t.Person_ID, t.Rating, t.Salary, p.First_Name, p.Last_Name
    HAVING COUNT(at.Actual_Training_Code) >= p_num_trainings;

  TYPE coach_record IS RECORD (
    person_id Trainer.Person_ID%TYPE,
    rating Trainer.Rating%TYPE,
    salary Trainer.Salary%TYPE,
    first_name Person.First_Name%TYPE,
    last_name Person.Last_Name%TYPE,
    training_count NUMBER
  );
  
  TYPE coach_table_type IS TABLE OF coach_record INDEX BY PLS_INTEGER;
  v_coach_table coach_table_type;

  v_coaches_updated NUMBER := 0;
  
  no_qualifying_coaches EXCEPTION;
  invalid_month EXCEPTION;
  invalid_year EXCEPTION;

BEGIN
  -- Input validation
  IF p_month < 1 OR p_month > 12 THEN
    RAISE invalid_month;
  END IF;
  
  IF p_year < 2000 OR p_year > EXTRACT(YEAR FROM SYSDATE) THEN
    RAISE invalid_year;
  END IF;

  -- Populate the coach table
  OPEN coach_cursor;
  FETCH coach_cursor BULK COLLECT INTO v_coach_table;
  CLOSE coach_cursor;

  -- Check if any coaches qualify
  IF v_coach_table.COUNT = 0 THEN
    RAISE no_qualifying_coaches;
  END IF;

  -- Process each qualifying coach
  FOR i IN 1..v_coach_table.COUNT LOOP
    v_coaches_updated := v_coaches_updated + 1;
    
    IF v_coach_table(i).rating < 5 THEN
      UPDATE Trainer
      SET Rating = Rating + 1
      WHERE Person_ID = v_coach_table(i).person_id;
      
      DBMS_OUTPUT.PUT_LINE('Coach ' || v_coach_table(i).first_name || ' ' || v_coach_table(i).last_name || 
                           ' rating increased to ' || (v_coach_table(i).rating + 1));
    ELSE
      UPDATE Trainer
      SET Salary = Salary * 1.05  -- 5% salary bonus
      WHERE Person_ID = v_coach_table(i).person_id;
      
      DBMS_OUTPUT.PUT_LINE('Coach ' || v_coach_table(i).first_name || ' ' || v_coach_table(i).last_name || 
                           ' received a 5% salary increase');
    END IF;
  END LOOP;

  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('-------- Summary --------');
  DBMS_OUTPUT.PUT_LINE(v_coaches_updated || ' coaches updated for ' || p_month || '/' || p_year);

EXCEPTION
  WHEN no_qualifying_coaches THEN
    RAISE_APPLICATION_ERROR(-20001, 'No coaches found with ' || p_num_trainings || ' or more trainings in month ' || p_month || ' of year ' || p_year);
  WHEN invalid_month THEN
    RAISE_APPLICATION_ERROR(-20002, 'Invalid month. Please provide a number between 1 and 12.');
  WHEN invalid_year THEN
    RAISE_APPLICATION_ERROR(-20003, 'Invalid year. Please provide a year between 2000 and the current year.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    RAISE;
END UpdateCoachRatings;
/
