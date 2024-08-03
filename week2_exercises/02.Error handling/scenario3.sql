CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_balance IN NUMBER
) AS
BEGIN
    SAVEPOINT start_insert;
    
    BEGIN
        INSERT INTO customers (customer_id, name, balance)
        VALUES (p_customer_id, p_name, p_balance);

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20006, 'Failed to insert new customer.');
        END IF;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK TO start_insert;
            RAISE_APPLICATION_ERROR(-20007, 'Customer with this ID already exists.');
        WHEN OTHERS THEN
            ROLLBACK TO start_insert;
            RAISE_APPLICATION_ERROR(-20008, 'Error adding new customer.');
    END;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END AddNewCustomer;
/
