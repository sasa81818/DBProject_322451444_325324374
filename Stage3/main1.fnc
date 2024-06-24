CREATE OR REPLACE FUNCTION main_active_person_and_update
RETURN NUMBER
IS
    v_most_active_id NUMBER;
    v_is_trainer NUMBER;
    v_max_month NUMBER;
    v_max_year NUMBER;
    v_training_count NUMBER;
BEGIN
    -- Find the most active person in the last year
    v_most_active_id := mostActivePerson(ADD_MONTHS(SYSDATE, -12), SYSDATE);

    -- Check if the most active person is a trainer
    SELECT COUNT(*) INTO v_is_trainer
    FROM Trainer
    WHERE Person_ID = v_most_active_id;

    IF v_is_trainer > 0 THEN
        -- Find the month and year with the maximum trainings for this trainer
        SELECT EXTRACT(MONTH FROM Training_Date), EXTRACT(YEAR FROM Training_Date), COUNT(*)
        INTO v_max_month, v_max_year, v_training_count
        FROM Actual_Training
        WHERE Person_ID2 = v_most_active_id
        GROUP BY EXTRACT(MONTH FROM Training_Date), EXTRACT(YEAR FROM Training_Date)
        ORDER BY COUNT(*) DESC
        FETCH FIRST 1 ROW ONLY;

        -- Call the UpdateCoachRatings procedure
        UpdateCoachRatings(v_max_month, v_training_count, v_max_year);

        DBMS_OUTPUT.PUT_LINE('UpdateCoachRatings called for trainer ID ' || v_most_active_id || 
                             ' with month ' || v_max_month || 
                             ', year ' || v_max_year || 
                             ', and training count ' || v_training_count);
    ELSE
        DBMS_OUTPUT.PUT_LINE('The most active person (ID ' || v_most_active_id || ') is not a trainer. No update needed.');
    END IF;

    RETURN v_most_active_id;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL;
END main_active_person_and_update;
/
