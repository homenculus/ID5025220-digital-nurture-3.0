DECLARE
    CURSOR account_cursor IS
        SELECT account_id, balance
        FROM accounts;
    
    v_account_id NUMBER;
    v_balance NUMBER;
    v_annual_fee CONSTANT NUMBER := 50; -- Example annual fee amount
    
BEGIN
    FOR account_rec IN account_cursor LOOP
        v_account_id := account_rec.account_id;
        v_balance := account_rec.balance;
        
        UPDATE accounts
        SET balance = balance - v_annual_fee
        WHERE account_id = v_account_id;
        
        DBMS_OUTPUT.PUT_LINE('Applied annual fee to Account ID: ' || v_account_id ||
                             ', New Balance: ' || v_balance - v_annual_fee);
    END LOOP;
    
    COMMIT;
END;
/
