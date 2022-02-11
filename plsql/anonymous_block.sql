-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/tree/master/plsql/anonymous_block.sql
-- Author       : Hussein Sarea
-- Last Modified: 11/02/2022
-- -----------------------------------------------------------------------------------

/*
    A block without a name is an anonymous block.
    An anonymous block is not saved in the Oracle Database server, so it is just for one-time use.
    However, PL/SQL anonymous blocks can be useful for testing purposes.

    A PL/SQL block consists of three sections: declaration, executable, and exception-handling sections.
    In a block, the executable section is mandatory while the declaration and exception-handling sections are optional.

    -- Declaration section
        A declaration section where you declare variables, 
        allocate memory for cursors, and define data types.
    
    -- Executable section
        An executable section starts with the keyword BEGIN and ends with the keyword END.
        The executable section must have a least one executable statement, 
        even if it is the NULL statement which does nothing.
    
    -- Exception-handling section
        An Exception-handling section starts with the keyword EXCEPTION.
        The exception-handling section is where you catch and handle exceptions raised by the code in the execution section.

*/

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, World!');
END;
/

DECLARE
    l_message VARCHAR2(50) := 'Hello, world!';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_message);
END;
/

DECLARE
    l_result NUMBER;
BEGIN
    l_result := 5 / 0;

    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;