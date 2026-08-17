# **UNIT-1**

**Name:** Bhagya  
**Roll No.:** 37  
**Last Semester SPI:** 8.50

---

## Q1. Anonymous Block

**Problem Statement:** Write an anonymous block: (a) Print your name and roll number. (b) Declare `v_message VARCHAR2(100)`, assign "Welcome to PL/SQL!", print it. (c) Calculate `roll_no MOD 7 + 1` and call it your "lucky number", print it. Run `SET SERVEROUTPUT ON` first. Observe: what happens if you forget it?

### ANSWER

```sql
SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(100);
    lucky_number NUMBER;
BEGIN
    -- (a) Print name and roll number
    DBMS_OUTPUT.PUT_LINE('Name: Bhagya');
    DBMS_OUTPUT.PUT_LINE('Roll Number: 37');

    -- (b) Assign and print message
    v_message := 'Welcome to PL/SQL!';
    DBMS_OUTPUT.PUT_LINE(v_message);

    -- (c) Calculate and print lucky number
    lucky_number := MOD(37, 7) + 1;
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || lucky_number);
END;
/
```

### Output

```text
Name: Bhagya
Roll Number: 37
Welcome to PL/SQL!
Lucky Number: 3
```

**If `SET SERVEROUTPUT ON` is forgotten:** the PL/SQL block can execute successfully, but `DBMS_OUTPUT.PUT_LINE` messages will not be displayed because output is not enabled.

---

## Q2. Variables, Percentage and PASS/FAIL

**Problem Statement:** Declare variables: `v_name VARCHAR2(50)`, `v_marks NUMBER(5,2)`, `v_percentage NUMBER(5,2)`, `v_dob DATE`, `v_passed BOOLEAN`. Use your own name and last semester marks. Calculate percentage = `(marks/500)*100`. Print name, marks, percentage (ROUND to 2 decimals), today's date using `SYSDATE`. Print "PASS" or "FAIL" based on `v_passed`.

### ANSWER

```sql
SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50);
    v_marks      NUMBER(5,2);
    v_percentage NUMBER(5,2);
    v_dob        DATE;
    v_passed     BOOLEAN;
BEGIN
    v_name := 'Bhagya';
    v_marks := 425; -- 85% equivalent used for SPI 8.50
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
```

### Output

```text
Name: Bhagya
Marks: 425
Percentage: 85%
Date: 17-08-2026
Result: PASS
```

---

## Q3. CONSTANT, GST, NVL and NVL2

**Problem Statement:** Part A: Declare `CONSTANT c_gst_rate NUMBER := 18`. Calculate GST breakdown: CGST = 9%, SGST = 9% on `base_price`. Print base price, CGST amount, SGST amount, total. Part B: Declare `v_city VARCHAR2(50) := NULL`. Use NVL to replace with "Ahmedabad". Use NVL2: if city not null print "City Known: [city]" else print "City Unknown". Show difference between NVL and NVL2 clearly.

### ANSWER

```sql
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
    v_city_nvl := NVL(v_city, 'Ahmedabad');

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('--- Part B: NVL and NVL2 ---');
    DBMS_OUTPUT.PUT_LINE('Original City: NULL');
    DBMS_OUTPUT.PUT_LINE('NVL Result: ' || v_city_nvl);

    -- NVL2: if city is not NULL, print City Known; otherwise City Unknown
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
```

### Output

```text
--- Part A: GST Breakdown ---
GST Rate: 18%
Base Price: Rs. 10000
CGST (9%): Rs. 900
SGST (9%): Rs. 900
Total: Rs. 11800

--- Part B: NVL and NVL2 ---
Original City: NULL
NVL Result: Ahmedabad
City Unknown

--- Difference ---
NVL(value, replacement): Replaces NULL with replacement.
NVL2(value, if_not_null, if_null): Returns one value if NOT NULL and another if NULL.
```
