-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/oracle-practice/miscellaneous/compile_all_specs.sql
-- Author       : Hussein Sarea
-- Description  : Compiles all invalid package specifications for specified schema, or all schema.
-- Call Syntax  : @compile_all_specs (schema-name or all)
-- Last Modified: 31/01/2022
-- -----------------------------------------------------------------------------------
SET FEEDBACK OFF
SET VERIFY OFF

SPOOL temp.sql

SELECT 'ALTER PACKAGE ' || a.owner || '.' || a.object_name || ' COMPILE;'
FROM all_objects a
WHERE a.object_type = 'PACKAGE'
AND a.status = 'INVALID'
AND a.owner = DECODE(UPPER('&&1'), 'ALL', a.owner, UPPER('&&1'));

SPOOL OFF

-- Comment out following line to prevent immediate run
@temp.sql

SET FEEDBACK ON
SET VERIFY ON
