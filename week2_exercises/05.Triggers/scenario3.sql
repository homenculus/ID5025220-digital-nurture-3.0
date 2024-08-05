CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    IF :NEW.transaction_type = 'WITHDRAWAL' THEN
        DECLARE
            v_balance NUMBER;
        BEGIN
            SELECT balance INTO v_balance FROM accounts WHERE account_id = :NEW.account_id;
            IF v_balance < :NEW.amount THEN
                RAISE_APPLICATION_ERROR(-20002, 'Insufficient funds for withdrawal.');
            END IF;
        END;
    ELSIF :NEW.transaction_type = 'DEPOSIT' THEN
        IF :NEW.amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20003, 'Deposit amount must be positive.');
        END IF;
    END IF;
END CheckTransactionRules;
/
