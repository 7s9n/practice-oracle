-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/tree/master/plsql/if_statement.pls
-- Author       : Hussein Sarea
-- Description  : learn how to use the PL/SQL IF statement to either execute or skip a sequence of statements based on a specified condition.
-- Last Modified: 11/02/2022
-- -----------------------------------------------------------------------------------


SET SERVEROUTPUT ON

/*
    The IF statement allows you to either execute or skip a sequence of statements,
    depending on a condition. 
    The IF statement has the three forms:

    -- IF THEN
    -- IF THEN ELSE
    -- IF THEN ELSIF
*/

/*

    IF THEN statement

    -- Syntax:

        IF condition THEN
            statements;
        END IF;

    The condition is a Boolean expression that always evaluates to TRUE, FALSE, or NULL.
    
    If the condition evaluates to TRUE,
    the statements after the THEN execute.
    Otherwise, the IF statement does nothing.
*/

DECLARE
    l_salary NUMBER := 2000;
BEGIN
    IF l_salary > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary is greater than 1000');
    END IF;
END;
/

/*

    IF THEN ELSE statement

    -- Syntax:

        IF condition THEN
            statements;
        ELSE
            else_statements;
        END IF;

    If the condition evaluates to TRUE, then the statements between THEN and ELSE execute.
    In case the condition evaluates to FALSE or NULL,
    the else_statements between ELSE and END IF executes.
*/

DECLARE
    l_salary NUMBER := 900;
BEGIN
    IF l_salary > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('Salary is greater than 1000');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary is less than 1000');
    END IF;
END;
/

/*

    IF THEN ELSIF statement

    -- Syntax:

        IF condition_1 THEN
            statements_1
        ELSIF condition_2 THEN
            statements_2
        [ ELSIF condition_3 THEN
            statements_3
        ]
        ...
        [ ELSE
            else_statements
        ]
        END IF;

    In this structure, the condition between IF and THEN,
    which is the first condition, is always evaluated.
    Each other condition between ELSEIF and THEN is evaluated only if the preceding condition is FALSE.
    For example, the condition_2 is evaluated only if the condition_1 is false, 
    the condition_3 is evaluated only if the condition_2 is false, and so on.

    If a condition is true, other subsequent conditions are not evaluated.
    If no condition is true, the else_statements between the ELSE and ENDIF execute.
    In case you skip the the ELSE clause and no condition is TRUE, then the IF THEN ELSIF does nothing.
*/

DECLARE
    l_salary NUMBER := 1001;
    l_comm NUMBER;
BEGIN
    IF l_salary > 2000 THEN
        l_comm := l_salary * 0.1;
    ELSIF l_salary > 1000 AND l_salary <= 2000 THEN
        l_comm := l_salary * 0.05;
    ELSE
        l_comm := l_salary * 0.02;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Commision: ' || l_comm);
END;
/