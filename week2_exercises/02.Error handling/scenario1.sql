CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) IS
    v_balance NUMBER;
BEGIN
    SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from_account_id;
    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
    END IF;

    UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from_account_id;
    UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to_account_id;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        INSERT INTO error_log (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        ROLLBACK;
END SafeTransferFunds;
/
