DECLARE
    CURSOR loan_cursor IS
        SELECT l.loan_id, l.customer_id, c.name, l.due_date
        FROM loans l
        JOIN customers c ON l.customer_id = c.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;
    v_loan_id loans.loan_id%TYPE;
    v_customer_id loans.customer_id%TYPE;
    v_customer_name customers.name%TYPE;
    v_due_date loans.due_date%TYPE;
BEGIN
    OPEN loan_cursor;
    LOOP
        FETCH loan_cursor INTO v_loan_id, v_customer_id, v_customer_name, v_due_date;
        EXIT WHEN loan_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Reminder: Customer ' || v_customer_name || 
                             ' (ID: ' || v_customer_id || ') has a loan (ID: ' || v_loan_id || 
                             ') due on ' || TO_CHAR(v_due_date, 'YYYY-MM-DD'));
    END LOOP;
    CLOSE loan_cursor;
END;
/
