DECLARE
    CURSOR loan_cursor IS
        SELECT loan_id, interest_rate
        FROM loans;
    
    v_loan_id NUMBER;
    v_old_interest_rate NUMBER;
    v_new_interest_rate CONSTANT NUMBER := 0.05; -- Example new interest rate
    
BEGIN
    FOR loan_rec IN loan_cursor LOOP
        v_loan_id := loan_rec.loan_id;
        v_old_interest_rate := loan_rec.interest_rate;
        
        UPDATE loans
        SET interest_rate = v_new_interest_rate
        WHERE loan_id = v_loan_id;
        
        DBMS_OUTPUT.PUT_LINE('Updated Loan ID: ' || v_loan_id || 
                             ', Old Interest Rate: ' || v_old_interest_rate ||
                             ', New Interest Rate: ' || v_new_interest_rate);
    END LOOP;
    
    COMMIT;
END;
/
