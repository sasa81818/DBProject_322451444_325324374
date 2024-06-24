CREATE OR REPLACE PROCEDURE Print_type
IS
  v_trainer_id Trainer.Person_ID%TYPE;
  v_trainer_cur SYS_REFCURSOR;  -- Cursor for inner function results
  v_month DATE;
  v_net_revenue NUMBER;
  v_total_net_revenue NUMBER := 0;
  v_month_count NUMBER := 0;
  v_avg_net NUMBER := 0;
  v_max_avg_net NUMBER := 0;
  v_max_trainer_id Trainer.Person_ID%TYPE := NULL;
  v_max_training_code Training.Training_Code%TYPE;
  v_max_training_type Training.Training_Type%TYPE;
  v_max_training_count NUMBER := 0;
BEGIN
  -- Use a cursor FOR loop to iterate through trainers
  FOR trainer_rec IN (SELECT Person_ID FROM Trainer WHERE person_id >= 517199517)
  LOOP
    v_trainer_id := trainer_rec.Person_ID;
    
    -- Call Get_Trainer_Net_Earnings for the current trainer
    v_trainer_cur := Get_Trainer_Net_Earnings(v_trainer_id, v_trainer_cur);
    
    -- Initialize variables for current trainer
    v_total_net_revenue := 0;
    v_month_count := 0;
    
    -- Check if the cursor is not NULL before processing
    IF v_trainer_cur IS NOT NULL THEN
      LOOP
        FETCH v_trainer_cur INTO v_month, v_net_revenue;
        EXIT WHEN v_trainer_cur%NOTFOUND;
        
        -- Accumulate net revenue and count months
        v_total_net_revenue := v_total_net_revenue + v_net_revenue;
        v_month_count := v_month_count + 1;
      END LOOP;
      
      -- Calculate average net earnings
      IF v_month_count > 0 THEN
        v_avg_net := v_total_net_revenue / v_month_count;
        
        -- Check if this trainer has a higher average
        IF v_avg_net > v_max_avg_net THEN
          v_max_avg_net := v_avg_net;
          v_max_trainer_id := v_trainer_id;
        END IF;
      END IF;
      
      CLOSE v_trainer_cur;
    ELSE
      DBMS_OUTPUT.PUT_LINE('Trainer ID: ' || v_trainer_id || ' - No data available');
    END IF;
  END LOOP;
  
  -- Output the trainer with the maximum average net earnings
  IF v_max_trainer_id IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Trainer with maximum average net earnings:');
    DBMS_OUTPUT.PUT_LINE('Trainer ID: ' || v_max_trainer_id);
    DBMS_OUTPUT.PUT_LINE('Average Net Earnings: ' || v_max_avg_net);
    
    -- Find the most popular training type in the next year's actual trainings
    BEGIN
      SELECT t.Training_Code, t.Training_Type, COUNT(*) AS training_count
      INTO v_max_training_code, v_max_training_type, v_max_training_count
      FROM Actual_Training at
      JOIN Training t ON at.Training_Code = t.Training_Code
      WHERE at.Person_ID2 = v_max_trainer_id
        AND at.Training_Date < ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 12)
        AND at.training_date>SYSDATE
      GROUP BY t.Training_Code, t.Training_Type
      ORDER BY COUNT(*) DESC
      FETCH FIRST 1 ROWS ONLY;
      
      DBMS_OUTPUT.PUT_LINE('Most Popular Training Type Next Year:');
      DBMS_OUTPUT.PUT_LINE('Training Type: ' || v_max_training_type);
      DBMS_OUTPUT.PUT_LINE('Number of Trainings: ' || v_max_training_count);
      
      -- Call apply_training_discount procedure with the identified training type for month 8
      apply_training_discount(8, v_max_training_type);
      
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for trainer ' || v_max_trainer_id || ' in next year''s actual trainings.');
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
  ELSE
    DBMS_OUTPUT.PUT_LINE('No trainer found with data.');
  END IF;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    -- If v_trainer_cur is open, close it
    IF v_trainer_cur%ISOPEN THEN
      CLOSE v_trainer_cur;
    END IF;
END Print_type;
/
