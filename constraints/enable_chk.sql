-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/constraints/enable_chk.sql
-- Author       : Hussein Sarea
-- Description  : Enables all check constraints for a specified table, or all tables.
-- Call Syntax  : @enable_chk (table-name or all) (schema-name)
-- Last Modified: 31/01/2022
-- -----------------------------------------------------------------------------------

SET FEEDBACK OFF
SET VERIFY OFF

SPOOL temp.sql

SELECT 'ALTER TABLE "' || a.table_name || '" ENABLE CONSTRAINT "' || a.constraint_name || '";'
FROM all_constraints a
WHERE a.constraint_type = 'C'
AND a.owner = UPPER('&2')
AND a.table_name = DECODE(UPPER('&1'), 'ALL', a.table_name, UPPER('&1'));

SPOOL OFF

-- Comment out following line to prevent immediate run
@temp.sql

SET FEEDBACK ON
SET VERIFY ON