BEGIN
    FOR customer_record IN (SELECT customer_id, age, loan_interest_rate
                            FROM customers
                            JOIN loans ON customers.customer_id = loans.customer_id) LOOP
        IF customer_record.age > 60 THEN
            UPDATE loans
            SET loan_interest_rate = loan_interest_rate - 0.01
            WHERE customer_id = customer_record.customer_id;
        END IF;
    END LOOP;
    
    COMMIT;
END;
/
