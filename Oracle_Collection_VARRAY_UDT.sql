
	-- Collections in UDT
	-----------------------

	--    Collections

	--    * Associative array
	--    * VARRAY
	--    * Nested Table

-----------------------------------------------------------------------------
	
	-- Object type is used for composite attribute

	-- VARRAY is used for multi valued attribute

	
	-- VARRAY (Syntax)

		-- create [or replace] type type_name is 

		-- varray(array_size) of datatype[(element_size)];

------------------------------------------------------------------------------

	--	SAMPLE
	
  -- Create Type
  
	CREATE TYPE PHONE_ARRAY IS VARRAY(3) OF NUMBER(20);

  -- Create Table
  
	CREATE TABLE EMP_PHONE(EID NUMBER(3),PHONE PHONE_ARRAY);

	--  Drop Table
  
  DROP TABLE EMP_PHONE;

  -- Describe The Structure

	DESCRIBE EMP_PHONE;
  
  -- Insert Records

	INSERT INTO EMP_PHONE VALUES(101,PHONE_ARRAY(9845983579,9834892375,8374934878));

	INSERT INTO EMP_PHONE(EID,PHONE) VALUES(102,PHONE_ARRAY(8214924812,8274918788,9283463847));

	INSERT INTO EMP_PHONE(EID,PHONE) VALUES(103,PHONE_ARRAY(8327983344,7936497624,9832472368));

	INSERT INTO EMP_PHONE(EID,PHONE) VALUES(104,PHONE_ARRAY(7283759823,8579633838));

	INSERT INTO EMP_PHONE(EID,PHONE) VALUES(105,PHONE_ARRAY(8374279368));

  -- Update Records
  
  UPDATE EMP_PHONE SET PHONE = PHONE_ARRAY(8129126995) WHERE EID=101;

  -- Delete Records
  
  DELETE EMP_PHONE WHERE EID= 105;
  
  -- Retrive Records
  
  SELECT * FROM EMP_PHONE;

--------------------------------------------------------------------------------------------