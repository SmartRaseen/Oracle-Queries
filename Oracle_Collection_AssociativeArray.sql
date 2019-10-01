
  -- Collection In Oracle
  -----------------------------

--    Associative Array

-- It is an important part of collection in Oracle.
-- Using Associative Array you can store multiple value in the same variable.

--    Syntax :

-- declare type
-- type type_name is table of element_data_type(size)
-- index by PLS_INTEGER | BINARY_INTEGER | ...;

-- declare variable
-- variable_name type_name;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

--Example 1

declare
type num_array is table of number(3)
index by pls_integer;
  n1 num_array;
  begin
      n1(1):=10;
      n1(2):=20;
      n1(3):=30;
      n1(4):=40;
      n1(5):=50;
      dbms_output.put_line(n1(&N));
  end;
  
--------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
-- Example 2
  
  declare
  type num_array is table of number(4)
  index by PLS_INTEGER;
  n1 num_array;
  begin
  for i in 1..5 loop
  n1(i) :=i*10;
  end loop;
  for i in 1..5 loop
  dbms_output.put_line(n1(i));
  end loop;
  end;
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Example 3

declare 
type state_code is table of varchar2(30)
index by varchar2(2);
STATE state_codes;
begin
state('TN') := 'Tamil Nadu';
state('KE') := 'Kerala';
state('KA') := 'Karnataka';
state('TG') := 'Telangana';
state('AP') := 'Andra Pradesh';
dbms_output.put_line(state(upper('&STATE')));
exception
when others then
dbms_ooutput.put_line('Something is wrong.');
end;

---------------------------------------------------------------------------------------------------------------------------------------------------------------
