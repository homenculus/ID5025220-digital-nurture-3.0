CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) AS
BEGIN
    SAVEPOINT start_transfer;
    
    DECLARE
        v_balance NUMBER;
    BEGIN
        SELECT balance INTO v_balance
        FROM accounts
        WHERE account_id = p_from_account_id;
        
        IF v_balance < p_amount THEN
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds.');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'Source account does not exist.');
    END;
    
    BEGIN
        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account_id;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account_id;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO start_transfer;
            RAISE_APPLICATION_ERROR(-20003, 'Error during fund transfer.');
    END;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END SafeTransferFunds;
/

