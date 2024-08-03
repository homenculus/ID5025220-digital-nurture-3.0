CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (TransactionID, TransactionDate, OldAmount, NewAmount, ChangedBy)
    VALUES (:NEW.TransactionID, SYSDATE, :NEW.Amount, :NEW.Amount, USER);
END LogTransaction;
/
