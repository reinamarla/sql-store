IF object_id('P_OBTAIN_BILL_DETAIL') is not null
	DROP PROC P_OBTAIN_BILL_DETAIL;
GO

CREATE PROC P_OBTAIN_BILL_DETAIL
@ID_BILL INT
AS
BEGIN
	SELECT P.DESCRIPTION 'PRODUCTO'
	, BD.PRICE 'PRECIO UNITARIO'
	, BD.AMOUNT 'CANTIDAD'
	, (BD.PRICE * BD.AMOUNT) 'SUBTOTAL'
	FROM BILL_DETAILS BD
	JOIN PRODUCTS P ON P.ID = BD.ID_PRODUCT
	WHERE BD.ID_BILL = @ID_BILL
END
GO