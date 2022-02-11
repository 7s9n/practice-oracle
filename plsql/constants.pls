-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/tree/master/plsql/constants.pls
-- Author       : Hussein Sarea
-- Last Modified: 11/02/2022
-- -----------------------------------------------------------------------------------

/*
    Unlike a variable, a constant holds a value that does not change throughout the execution of the program.

    Constants make your code more readable.

    -- Syntax
        constant_name CONSTANT datatype [NOT NULL]  := expression

*/

SET SERVEROUTPUT ON

DECLARE
    l_pi CONSTANT REAL := 3.14159;
    l_radius CONSTANT REAL := 10;
    l_area CONSTANT REAL := (l_pi * l_radius**2);
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_area);
END;
/

DECLARE
    l_comm CONSTANT REAL := 3.14159;
BEGIN
    l_comm := 1; -- Error
END;
/

DECLARE
    l_comm CONSTANT REAL;
BEGIN
    l_comm := 66.2; -- Error
END;