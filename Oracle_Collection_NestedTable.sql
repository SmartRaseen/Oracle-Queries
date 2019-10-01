-- Collection : Nested Table
--------------------------------

-- Nested Table

  -- Nested table allows group of elements of same datatype.
  -- Size is not declared with nested table.
  -- It has the same effect as that of varray but has no limit.

-- Nested table can be created using 

  -- Oracle predefined data types
  -- OR
  -- User defined data types

-- Steps to Create and Use Nested Table

  -- [create object type]
  -- Create nested table [using the object type]
  -- Use the nested table in creating table
  
--------------------------------------------------------------------------------------------------------------------------------------------

--	CREATE TYPE

	CREATE TYPE LOCATION AS OBJECT(City VARCHAR2(30),
	PIN NUMBER(6));

	CREATE TYPE NEST_TABLE AS TABLE OF LOCATION;

--  CREATE TABLE

	CREATE TABLE STUDENT
	(
		Stud_Num NUMBER(10),
		NAME VARCHAR2(20),
		Address NEST_TABLE
	)
	NESTED TABLE ADDRESS
	STORE AS STUDENT_TEMP;
  
-- INSERT RECORD INTO THAT TABLE

	INSERT INTO STUDENT VALUES(1,'RSN',NEST_TABLE(LOCATION('NAGORE',611002)));

	INSERT INTO STUDENT VALUES(2,'Aysha',NEST_TABLE(LOCATION('NAGORE',611002),LOCATION('Chennai',600001)));

-- RETRIVE RECORDS FROM THAT TABLE
	
	SELECT * FROM STUDENT;

	SELECT STUD_NUM,NAME,S.CITY,S.PIN FROM STUDENT S1, TABLE(S1.ADDRESS) S;

-- UPDATE RECORDS FROM THAT TABLE
	
	UPDATE TABLE(SELECT ADDRESS FROM STUDENT WHERE STUD_NUM = 1) S SET S.CITY = 'Bangalore' WHERE S.CITY = 'NAGORE';

	SELECT STUD_NUM,NAME,S.CITY,S.PIN FROM STUDENT S1, TABLE(S1.ADDRESS) S;

	UPDATE STUDENT SET NAME='Ayisha' WHERE NAME = 'Aysha'; 

	UPDATE TABLE(SELECT ADDRESS FROM STUDENT WHERE NAME ='Ayisha') S SET S.CITY='Bangalore' WHERE S.CITY = 'Chennai'; 

	SELECT STUD_NUM,NAME,S.CITY,S.PIN FROM STUDENT S1, TABLE(S1.ADDRESS) S;

	INSERT INTO STUDENT VALUES(3,'Hameed',NEST_TABLE(LOCATION('Chennai',600001)));

	INSERT INTO STUDENT VALUES(2,'Aysha',NEST_TABLE(LOCATION('NAGORE',611002),LOCATION('Chennai',600001)));

-- DELETE RECORDS FROM THAT TABLE

	DELETE STUDENT WHERE STUD_NUM = 3;

	SELECT STUD_NUM,NAME,S.CITY,S.PIN FROM STUDENT S1, TABLE(S1.ADDRESS) S;

	DELETE TABLE(SELECT ADDRESS FROM STUDENT WHERE NAME = 'Hameed') S WHERE S.CITY='Chennai';

-------------------------------------------------------------------------------------------------------------------------------------------------------------