
	ORACLE_PACKAGES
	***************
	
	*	CREATE TABLE FOR PACKAGES
		*************************
		
		CREATE TABLE Product_Package(
		Product_ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
		Product_Name VARCHAR2(20) NOT NULL,
		Price INT NOT NULL,
		Quantity INT NOT NULL,
		Product_Status VARCHAR2(20) NOT NULL);
		ADD PRIMARY KEY(Product_ID);
		
	*	INSERT DATA INTO THE TABLE
		**************************
		
		INSERT INTO Product_Package(Product_Name,Price,Quantity,Product_Status) VALUES('Oppo',25000,25,'Shipped');
		INSERT INTO Product_Package(Product_Name,Price,Quantity,Product_Status) VALUES('Redmi',22000,50,'Shipped');
		INSERT INTO Product_Package(Product_Name,Price,Quantity,Product_Status) VALUES('Nokia',16000,10,'Canceled');
		INSERT INTO Product_Package(Product_Name,Price,Quantity,Product_Status) VALUES ('Sony',30000,20,'Pending');
		INSERT INTO Product_Package(Product_Name,Price,Quantity,Product_Status) VALUES ('Samsung',20000,30,'Pending');
	
		SELECT * FROM Product_Package;
  
--------------------------------------------------------------------------------------------------------------------------------------------------
		
		
	*	CREATE PACKAGES
		***************
		
		CREATE OR REPLACE PACKAGE Package_Demo
		AS
		shipped_status  CONSTANT VARCHAR(10) := 'Shipped';
		pending_status CONSTANT VARCHAR(10) := 'Pending';
		canceled_status CONSTANT VARCHAR(10) := 'Canceled';
 
		-- cursor that returns the order detail
		CURSOR Cursor_Products(P_Product_ID NUMBER)
		IS
		SELECT
			Product_ID,
			Product_Name,
			Price,
			Quantity,
			Product_Status
		FROM
			Product_Package
		WHERE
			Product_ID = P_Product_ID;
      
		Function get_net_value(
		P_Product_ID NUMBER)
		RETURN NUMBER;
    
		Function get_net_value_by_price(
		P_Price NUMBER)
		RETURN NUMBER;
      
		END Package_Demo;
    
--------------------------------------------------------------------------------------------------------------------------------------------------
	
	*	CREATE PACKAGES BODY
		********************

		CREATE OR REPLACE PACKAGE BODY Package_Demo
		AS
		-- get net value of a order
			FUNCTION get_net_value(
			P_Product_ID NUMBER)
			RETURN NUMBER
			IS
			net_value NUMBER;
		BEGIN
			SELECT
				SUM(PRICE * QUANTITY)
			INTO
				net_value
			FROM
				Product_Package
			WHERE
				Product_ID = P_Product_ID;
 
			RETURN net_value;
 
			EXCEPTION
			WHEN no_data_found THEN
			DBMS_OUTPUT.PUT_LINE( SQLERRM );
		END get_net_value;
 
		-- Get net value by customer
			FUNCTION get_net_value_by_price(
			P_Price NUMBER)
			RETURN NUMBER
			IS
			net_value_by_price NUMBER;
		BEGIN
			SELECT
				SUM(Price * Quantity)
			INTO
				net_value_by_price
			FROM
				Product_Package
			WHERE
				Price = P_Price;
			RETURN net_value_by_price;
			
			EXCEPTION
			WHEN no_data_found THEN
			DBMS_OUTPUT.PUT_LINE( SQLERRM );
		END get_net_value_by_price;
 
		END Package_Demo;
  
--------------------------------------------------------------------------------------------------------------------------------------------------
  
	*	EXECUTE PACKAGE 
		***************
		
		SELECT
			Package_Demo.get_net_value_by_price(25000) As Price_of_Sales 
		FROM
			dual;

--------------------------------------------------------------------------------------------------------------------------------------------------