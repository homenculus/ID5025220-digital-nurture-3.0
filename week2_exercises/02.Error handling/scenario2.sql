CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) IS
    v_current_salary NUMBER;
BEGIN
    SELECT salary INTO v_current_salary FROM employees WHERE employee_id = p_employee_id;

    UPDATE employees
    SET salary = v_current_salary * (1 + p_percentage / 100)
    WHERE employee_id = p_employee_id;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO error_log (error_message, error_date)
        VALUES ('Employee ID not found: ' || p_employee_id, SYSDATE);
    WHEN OTHERS THEN
        INSERT INTO error_log (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        ROLLBACK;
END UpdateSalary;
/
