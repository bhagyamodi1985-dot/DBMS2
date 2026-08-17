-- DBMS 2 - PL/SQL
-- Question 2: Variables, percentage calculation and PASS/FAIL
-- Name: Bhagya
-- Roll No: 37
-- Last Semester SPI: 8.50

SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50);
    v_marks      NUMBER(5,2);
    v_percentage NUMBER(5,2);
    v_dob        DATE;
    v_passed     BOOLEAN;
BEGIN
    v_name := 'Bhagya';
    v_marks := 425; -- Using 85% equivalent for SPI 8.50 (425/500)
    v_dob := SYSDATE;

    v_percentage := ROUND((v_marks / 500) * 100, 2);

    IF v_percentage >= 40 THEN
        v_passed := TRUE;
    ELSE
        v_passed := FALSE;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_dob, 'DD-MM-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
