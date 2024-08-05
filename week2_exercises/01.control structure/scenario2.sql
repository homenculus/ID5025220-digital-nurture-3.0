DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000;
    v_customer_id customers.customer_id%TYPE;
BEGIN
    OPEN customer_cursor;
    LOOP
        FETCH customer_cursor INTO v_customer_id;
        EXIT WHEN customer_cursor%NOTFOUND;
        
        UPDATE customers
        SET IsVIP = TRUE
        WHERE customer_id = v_customer_id;
    END LOOP;
    CLOSE customer_cursor;
END;
/
