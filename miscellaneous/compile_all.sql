-- -----------------------------------------------------------------------------------
-- File Name    : https://github.com/Ho011/practice-oracle/tree/master/miscellaneous/compile_all.sql
-- Author       : Hussein Sarea
-- Description  : Compiles all invalid objects for specified schema, or all schema.
-- Requirements : Requires all other "Compile_All" scripts.
-- Call Syntax  : @compile_all (schema-name or all)
-- Last Modified: 31/01/2022
-- -----------------------------------------------------------------------------------
@Compile_All_Specs &&1
@Compile_All_Bodies &&1
@Compile_All_Procs &&1
@Compile_All_Funcs &&1
@Compile_All_Views &&1