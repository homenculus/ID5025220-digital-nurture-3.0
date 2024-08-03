DECLARE
    CURSOR customer_cursor IS
        SELECT DISTINCT customer_id
        FROM transactions
        WHERE transaction_date BETWEEN TRUNC(SYSDATE, 'MONTH') AND LAST_DAY(SYSDATE);
    
    v_customer_id NUMBER;
    
    CURSOR transaction_cursor(p_customer_id NUMBER) IS
        SELECT transaction_id, transaction_date, amount
        FROM transactions
        WHERE customer_id = p_customer_id
        AND transaction_date BETWEEN TRUNC(SYSDATE, 'MONTH') AND LAST_DAY(SYSDATE);
    
    v_transaction_id NUMBER;
    v_transaction_date DATE;
    v_amount NUMBER;
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        v_customer_id := customer_rec.customer_id;
        
        DBMS_OUTPUT.PUT_LINE('Statement for Customer ID: ' || v_customer_id);
        
        FOR transaction_rec IN transaction_cursor(v_customer_id) LOOP
            v_transaction_id := transaction_rec.transaction_id;
            v_transaction_date := transaction_rec.transaction_date;
            v_amount := transaction_rec.amount;
            
            DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || v_transaction_id || 
                                 ', Date: ' || v_transaction_date || 
                                 ', Amount: ' || v_amount);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
END;
/
