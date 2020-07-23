IF object_id('ALTER_DB') is not null
  DROP PROC ALTER_DB; 
GO

CREATE PROC ALTER_DB
AS
BEGIN
	ALTER TABLE CUSTOMERS
		ADD CONSTRAINT FK_TIPE_CLIENT FOREIGN KEY (ID_TYPE_CLIENT) REFERENCES TYPES_CLIENT (ID)
	
	ALTER TABLE BILLS
		ADD CONSTRAINT FK_ID_CUSTOMER FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMERS (ID)
	
	ALTER TABLE BILL_DETAILS
		ADD CONSTRAINT FK_ID_BILL FOREIGN KEY (ID_BILL) REFERENCES BILLS (ID),
			CONSTRAINT FK_ID_PRODUCT FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS (ID)
END
GO

