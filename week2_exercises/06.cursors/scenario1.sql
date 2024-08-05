DECLARE
    CURSOR transaction_cursor IS
        SELECT t.transaction_id, t.account_id, t.transaction_date, t.amount, a.customer_id
        FROM transactions t
        JOIN accounts a ON t.account_id = a.account_id
        WHERE EXTRACT(MONTH FROM t.transaction_date) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.transaction_date) = EXTRACT(YEAR FROM SYSDATE);

    v_transaction_id transactions.transaction_id%TYPE;
    v_account_id transactions.account_id%TYPE;
    v_transaction_date transactions.transaction_date%TYPE;
    v_amount transactions.amount%TYPE;
    v_customer_id accounts.customer_id%TYPE;
BEGIN
    OPEN transaction_cursor;
    LOOP
        FETCH transaction_cursor INTO v_transaction_id, v_account_id, v_transaction_date, v_amount, v_customer_id;
        EXIT WHEN transaction_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id ||
                             ', Transaction ID: ' || v_transaction_id ||
                             ', Date: ' || TO_CHAR(v_transaction_date, 'YYYY-MM-DD') ||
                             ', Amount: ' || v_amount);
    END LOOP;
    CLOSE transaction_cursor;
END;
/
