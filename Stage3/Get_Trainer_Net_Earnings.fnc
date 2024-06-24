CREATE OR REPLACE FUNCTION Get_Trainer_Net_Earnings (
  v_trainer_ID IN Trainer.Person_ID%TYPE,
  cur OUT SYS_REFCURSOR
) RETURN SYS_REFCURSOR
IS
  v_trainer_exists NUMBER;
  v_row_count NUMBER;
BEGIN
  -- Check if the trainer exists
  SELECT COUNT(*)
  INTO v_trainer_exists
  FROM Trainer
  WHERE Person_ID = v_trainer_ID;

  IF v_trainer_exists = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Trainer ID does not exist.');
  END IF;

  -- Check for trainings in the last 5 months before opening cursor
  SELECT COUNT(*)
  INTO v_row_count
  FROM Actual_Training at
  JOIN Trainer tr ON at.Person_ID2 = tr.Person_ID
  WHERE at.Person_ID2 = v_trainer_ID
    AND at.Training_Date >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -5);

  IF v_row_count = 0 THEN
    -- Handle no training data found (optional: raise specific error or return empty cursor)
    RETURN NULL; -- Replace with appropriate action
  END IF;

 OPEN cur FOR
    WITH MonthData AS (
      SELECT ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -level) AS training_month
      FROM DUAL
      CONNECT BY LEVEL <= 5
    )
    SELECT MD.training_month AS month,
           NVL( (SELECT SUM(at.Training_Cost - NVL(tr.Salary, 0))
                  FROM Actual_Training at
                  JOIN Trainer tr ON at.Person_ID2 = tr.Person_ID
                  WHERE at.Person_ID2 = v_trainer_ID
                    AND at.Training_Date >= MD.training_month), 0) AS net_revenue
    FROM MonthData MD
    ORDER BY MD.training_month DESC;

  RETURN cur;
END Get_Trainer_Net_Earnings;
/
