DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, interest_rate
        FROM loans;

    v_loan_id loans.loan_id%TYPE;
    v_current_rate loans.interest_rate%TYPE;
    v_new_rate CONSTANT NUMBER := 0.05; -- Example new interest rate

BEGIN
    OPEN loan_cursor;
    LOOP
        FETCH loan_cursor INTO v_loan_id, v_current_rate;
        EXIT WHEN loan_cursor%NOTFOUND;

        UPDATE loans
        SET interest_rate = v_new_rate
        WHERE loan_id = v_loan_id;
    END LOOP;
    CLOSE loan_cursor;

    COMMIT;
END;
/
