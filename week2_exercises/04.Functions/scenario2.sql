CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount NUMBER,
    p_interest_rate NUMBER,
    p_duration_years NUMBER
) RETURN NUMBER IS
    v_monthly_rate NUMBER;
    v_months NUMBER;
    v_installment NUMBER;
BEGIN
    v_monthly_rate := p_interest_rate / 12 / 100;
    v_months := p_duration_years * 12;
    v_installment := p_loan_amount * v_monthly_rate / (1 - POWER(1 + v_monthly_rate, -v_months));
    RETURN v_installment;
END CalculateMonthlyInstallment;
/
