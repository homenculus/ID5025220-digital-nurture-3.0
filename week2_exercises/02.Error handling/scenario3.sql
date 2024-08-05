CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_age IN NUMBER,
    p_balance IN NUMBER
) IS
BEGIN
    INSERT INTO customers (customer_id, name, age, balance)
    VALUES (p_customer_id, p_name, p_age, p_balance);

    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        INSERT INTO error_log (error_message, error_date)
        VALUES ('Customer ID already exists: ' || p_customer_id, SYSDATE);
    WHEN OTHERS THEN
        INSERT INTO error_log (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        ROLLBACK;
END AddNewCustomer;
/
