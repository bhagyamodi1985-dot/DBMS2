-- DBMS 2 - PL/SQL
-- Question 3: CONSTANT, GST, NVL and NVL2
-- Name: Bhagya
-- Roll No.: 37

SET SERVEROUTPUT ON;

DECLARE
    -- Part A
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := 10000;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;

    -- Part B
    v_city VARCHAR2(50) := NULL;
    v_city_nvl VARCHAR2(50);
BEGIN
    -- GST breakdown: CGST = 9%, SGST = 9%
    v_cgst := v_base_price * 9 / 100;
    v_sgst := v_base_price * 9 / 100;
    v_total := v_base_price + v_cgst + v_sgst;

    DBMS_OUTPUT.PUT_LINE('--- Part A: GST Breakdown ---');
    DBMS_OUTPUT.PUT_LINE('GST Rate: ' || c_gst_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Base Price: Rs. ' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs. ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs. ' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total: Rs. ' || v_total);

    -- Part B: NVL
    -- NVL replaces NULL with the specified replacement value.
    v_city_nvl := NVL(v_city, 'Ahmedabad');

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('--- Part B: NVL and NVL2 ---');
    DBMS_OUTPUT.PUT_LINE('Original City: NULL');
    DBMS_OUTPUT.PUT_LINE('NVL Result: ' || v_city_nvl);

    -- NVL2 checks whether the original value is NULL or NOT NULL.
    DBMS_OUTPUT.PUT_LINE(
        NVL2(
            v_city,
            'City Known: ' || v_city,
            'City Unknown'
        )
    );

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('--- Difference ---');
    DBMS_OUTPUT.PUT_LINE('NVL(value, replacement): Replaces NULL with replacement.');
    DBMS_OUTPUT.PUT_LINE('NVL2(value, if_not_null, if_null): Returns one value if NOT NULL and another if NULL.');
END;
/
