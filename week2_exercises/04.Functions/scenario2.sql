CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount IN NUMBER,
    p_annual_interest_rate IN NUMBER,
    p_loan_duration_years IN NUMBER
) RETURN NUMBER AS
    v_monthly_installment NUMBER;
    v_monthly_rate NUMBER;
    v_total_payments NUMBER;
BEGIN
    v_monthly_rate := p_annual_interest_rate / 1200;
    v_total_payments := p_loan_duration_years * 12;

    IF v_monthly_rate = 0 THEN
        v_monthly_installment := p_loan_amount / v_total_payments;
    ELSE
        v_monthly_installment := p_loan_amount * (v_monthly_rate / (1 - POWER(1 + v_monthly_rate, -v_total_payments)));
    END IF;

    RETURN v_monthly_installment;
END CalculateMonthlyInstallment;
/
