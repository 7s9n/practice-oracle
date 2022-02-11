-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/tree/master/plsql/variables.pls
-- Author       : Hussein Sarea
-- Description  : learn about PL/SQL variables and how to use them effectively.
-- Last Modified: 11/02/2022
-- -----------------------------------------------------------------------------------

/*
    In PL/SQL, a variable is named storage location that stores a value of a particular data type.
    The value of the variable changes through the program.
    Before using a variable, you must declare it in the declaration section of a block.

    -- Syntax
        variable_name datatype [NOT NULL] [:= initial_value];

*/

SET SERVEROUTPUT ON

-- Declaring variables

DECLARE
    l_total_salary NUMBER(15, 2);
    l_average_salary NUMBER(5, 2);
    l_employee_name VARCHAR2(60);
BEGIN
    NULL;
END;
/

/*
    -- Default values

    PL/SQL allows you to set a default value for a variable at the declaration time.
    To assign a default value to a variable, 
    you use the assignment operator (:=) or the DEFAULT keyword.
*/

DECLARE
    l_employee_name VARCHAR2(60) := 'Hussein Sarea';
BEGIN
    NULL;
END;
/

/*
    In this example, instead of using the assignment operator := , 
    we used the DEFAULT keyword to initialize a variable.
*/

DECLARE
    l_employee_name VARCHAR2(60) DEFAULT 'Hussein Sarea';
BEGIN
    NULL;
END;
/

/*
    -- NOT NULL constraint

    If you impose the NOT NULL constraint on a value,
    then the variable cannot accept a NULL value.
    Besides, a variable declared with the NOT NULL must be initialized with a non-null value.
    Note that PL/SQL treats a zero-length string as a NULL value.
*/

DECLARE
    l_employee_name VARCHAR2(60) NOT NULL DEFAULT 'Hussein Sarea';
BEGIN
    l_employee_name := ''; -- ERROR it could not accept a NULL value or zero-length string in this case.
END;
/

-- Variable assignments

DECLARE
    l_employee_name VARCHAR2(60) NOT NULL DEFAULT 'Hussein Sarea';
BEGIN
    l_employee_name := 'Moataz Sarea';
    DBMS_OUTPUT.PUT_LINE(l_employee_name);
END;
/

/*
    -- Anchored declarations
        Typically, you declare a variable and select a value from a table column to this variable.
        If the data type of the table column changes,
        you must adjust the program to make it work with the new type.

        PL/SQL allows you to declare a variable whose data type anchor to a table column or another variable.
*/
DECLARE
    l_employee_id employees.employee_id%TYPE;
    l_employee_name employees.first_name%TYPE;
    l_employee_salary employees.salary%TYPE;
BEGIN
    SELECT
        employee_id, first_name, salary
    INTO
        l_employee_id, l_employee_name, l_employee_salary
    FROM
        EMPLOYEES
    WHERE 
        employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(l_employee_id || ', ' || l_employee_name || ', ' || l_employee_salary);
END;
/

DECLARE
    l_employee_salary employees.salary%TYPE;
    l_max_salary l_employee_salary%TYPE;
    l_min_salary l_employee_salary%TYPE;
    l_avg_salary l_employee_salary%TYPE;
BEGIN
    SELECT
        MAX(SALARY), MIN(SALARY), AVG(SALARY)
    INTO
        l_max_salary, l_min_salary, l_avg_salary
    FROM
        EMPLOYEES;
    
    DBMS_OUTPUT.PUT_LINE('Maximum salary: ' || l_max_salary);
    DBMS_OUTPUT.PUT_LINE('Minimum salary: ' || l_min_salary);
    DBMS_OUTPUT.PUT_LINE('Average salary: ' || l_avg_salary);
END;
/