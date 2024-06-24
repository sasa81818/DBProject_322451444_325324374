CREATE OR REPLACE PROCEDURE apply_training_discount (
    p_month IN NUMBER,
    p_training_type IN VARCHAR2
)
IS
    v_discounted_count NUMBER := 0;
    v_current_month NUMBER;
    v_current_year NUMBER;
    v_start_date DATE;
    v_end_date DATE;
    
    -- Cursor to fetch relevant trainings
    CURSOR c_trainings IS
        SELECT at.Actual_Training_Code, at.Training_Cost
        FROM Actual_Training at
        JOIN Training t ON at.Training_Code = t.Training_Code
        WHERE t.Training_Type = p_training_type
        AND EXTRACT(MONTH FROM at.Training_Date) = p_month
        AND at.Training_Date BETWEEN v_start_date AND v_end_date;
    
    -- Exception declarations
    invalid_month EXCEPTION;
    no_trainings_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(invalid_month, -20001);
    PRAGMA EXCEPTION_INIT(no_trainings_found, -20002);

BEGIN
    -- Input validation
    IF p_month < 1 OR p_month > 12 THEN
        RAISE invalid_month;
    END IF;

    -- Calculate date range
    v_current_month := EXTRACT(MONTH FROM SYSDATE);
    v_current_year := EXTRACT(YEAR FROM SYSDATE);

    IF p_month > v_current_month THEN
        -- The month is later this year
        v_start_date := TO_DATE('01-' || LPAD(p_month, 2, '0') || '-' || v_current_year, 'DD-MM-YYYY');
    ELSE
        -- The month is in the next year
        v_start_date := TO_DATE('01-' || LPAD(p_month, 2, '0') || '-' || (v_current_year + 1), 'DD-MM-YYYY');
    END IF;

    v_end_date := LAST_DAY(v_start_date);

    -- Apply discount using cursor
    FOR training IN c_trainings LOOP
        UPDATE Actual_Training
        SET Training_Cost = Training_Cost * 0.8
        WHERE Actual_Training_Code = training.Actual_Training_Code;
        
        v_discounted_count := v_discounted_count + 1;
    END LOOP;

    -- Check if any trainings were discounted
    IF v_discounted_count = 0 THEN
        RAISE no_trainings_found;
    END IF;

    -- Print result
    DBMS_OUTPUT.PUT_LINE('Number of trainings discounted: ' || v_discounted_count);

    COMMIT;

EXCEPTION
    WHEN invalid_month THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid month. Please enter a number between 1 and 12.');
    WHEN no_trainings_found THEN
        RAISE_APPLICATION_ERROR(-20002, 'No trainings found for the specified month and training type.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'An error occurred: ' || SQLERRM);
END apply_training_discount;
/
