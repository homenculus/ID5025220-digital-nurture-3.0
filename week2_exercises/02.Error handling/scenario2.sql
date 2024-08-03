CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) AS
BEGIN
    SAVEPOINT start_update;
    
    BEGIN
        UPDATE employees
        SET salary = salary * (1 + p_percentage / 100)
        WHERE employee_id = p_employee_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'Employee ID does not exist.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO start_update;
            RAISE_APPLICATION_ERROR(-20005, 'Error updating salary.');
    END;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END UpdateSalary;
/
