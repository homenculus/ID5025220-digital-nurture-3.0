CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (transaction_id, action, action_date)
    VALUES (:NEW.transaction_id, 'INSERT', SYSDATE);
END LogTransaction;
/
