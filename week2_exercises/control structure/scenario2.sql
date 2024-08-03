BEGIN
    FOR customer_record IN (SELECT customer_id, balance
                            FROM customers) LOOP
        IF customer_record.balance > 10000 THEN
            UPDATE customers
            SET is_vip = TRUE
            WHERE customer_id = customer_record.customer_id;
        END IF;
    END LOOP;
    
    COMMIT;
END;
/
