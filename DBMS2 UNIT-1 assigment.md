# &#x09;			**UNIT-1** 

**Q1 Problem Statement: Write an anonymous block: (a) Print your name and roll number. (b) Declare**

**v\_message VARCHAR2(100), assign \&quot;Welcome to PL/SQL!\&quot;, print it. (c) Calculate roll\_no MOD 7**

**+ 1 and call it your \&quot;lucky number\&quot;, print it. Run SET SERVEROUTPUT ON first. Observe: what**

**happens if you forget it?**

**take roll no. 37** 

**name Bhagya**



**ANSWER->**

SET SERVEROUTPUT ON;



DECLARE

&#x20;   v\_message VARCHAR2(100);

&#x20;   lucky\_number NUMBER;

BEGIN

&#x20;   -- (a) Print name and roll number

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Name: Bhagya');

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Roll Number: 37');



&#x20;   -- (b) Assign and print message

&#x20;   v\_message := 'Welcome to PL/SQL!';

&#x20;   DBMS\_OUTPUT.PUT\_LINE(v\_message);



&#x20;   -- (c) Calculate and print lucky number

&#x20;   lucky\_number := MOD(37, 7) + 1;

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Lucky Number: ' || lucky\_number);

END;

/



**--output--**



Name: Bhagya

Roll Number: 37

Welcome to PL/SQL!

Lucky Number: 3



**Q2 Problem Statement: Declare variables: v\_name VARCHAR2(50), v\_marks NUMBER(5,2),**

**v\_percentage NUMBER(5,2), v\_dob DATE, v\_passed BOOLEAN. Use your own name and last**

**semester marks. Calculate percentage = (marks/500)\*100. Print: name, marks, percentage**

**(ROUND to 2 decimals), today\&#39;s date using SYSDATE. Print \&quot;PASS\&quot; or \&quot;FAIL\&quot; based on v\_passed.**



**ANSWER->** SET SERVEROUTPUT ON;



DECLARE

&#x20;   v\_name       VARCHAR2(50);

&#x20;   v\_marks      NUMBER(5,2);

&#x20;   v\_percentage NUMBER(5,2);

&#x20;   v\_dob        DATE;

&#x20;   v\_passed     BOOLEAN;

BEGIN

&#x20;   v\_name := 'Bhagya';

&#x20;   v\_marks := 425;

&#x20;   v\_dob := SYSDATE;



&#x20;   v\_percentage := ROUND((v\_marks / 500) \* 100, 2);



&#x20;   IF v\_percentage >= 40 THEN

&#x20;       v\_passed := TRUE;

&#x20;   ELSE

&#x20;       v\_passed := FALSE;

&#x20;   END IF;



&#x20;   DBMS\_OUTPUT.PUT\_LINE('Name: ' || v\_name);

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Marks: ' || v\_marks);

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Percentage: ' || v\_percentage || '%');

&#x20;   DBMS\_OUTPUT.PUT\_LINE('Date: ' || TO\_CHAR(v\_dob, 'DD-MM-YYYY'));



&#x20;   IF v\_passed THEN

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Result: PASS');

&#x20;   ELSE

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Result: FAIL');

&#x20;   END IF;

END;

/

**--OUTPUT--** 



Name: Bhagya

Marks: 425

Percentage: 85%

Date: 17-08-2026

Result: PASS

