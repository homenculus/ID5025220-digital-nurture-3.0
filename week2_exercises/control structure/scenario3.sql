BEGIN
    FOR loan_record IN (SELECT customer_id, loan_due_date
                        FROM loans
                        WHERE loan_due_date BETWEEN SYSDATE AND SYSDATE + 30) LOOP
        -- Assuming there's a procedure to send reminders
        send_reminder(loan_record.customer_id, loan_record.loan_due_date);
    END LOOP;
    
    COMMIT;
END;
/
