/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [Wright2015].[dbo].[OrdersHistory]
  --WHERE VendorName <> 'Wright Enrichment Incorporated'
  --WHERE ReturntoCustomer is not null
  --WHERE ReturntoVendor IS NOT NULL
  --WHERE CustomerFinalConfirmation IS NOT NULL
  --WHERE VendorFinalConfirmation is not null
  --WHERE OrderTakenBy is not null
  --WHERE BuyerNo is not null
  --WHERE BuyerName IS NOT NULL
  --WHERE MethodOfPayment is not null
  --WHERE NotesToSupplier is not null
  --WHERE NotesToPurchaser is not null
  WHERE WebOrderID IS NOT NULL

