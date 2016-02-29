UPDATE t1
SET t1.VendorShipTo = NULL
FROM OrdersShipTo As t1 LEFT JOIN Shipto ON t1.[VendorShipTo] = [Shipto].[ShippingID]
WHERE ([Shipto].[ShippingID] Is Null);
