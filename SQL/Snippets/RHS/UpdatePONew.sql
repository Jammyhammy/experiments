UPDATE [SysproCompanyT].[dbo].[PorMasterHdr]
   SET [OrderStatus] = <OrderStatus, char(1),>  
 WHERE PurchaseOrder = ''
GO

UPDATE [SysproCompanyT].[dbo].[PorMasterDetail]
   SET [MReceivedQty] = <MReceivedQty, decimal(10,3),>
      ,[MCompleteFlag] = <MCompleteFlag, char(1),>
      ,[MGlCode] = <MGlCode, char(15),>
 WHERE PurchaseOrder = ''
GO

UPDATE [MobileOrdering].[dbo].[ReceiveTickets]
   SET [TicketStatus] = 'New'
      ,[TicketUser] = 'None'
 WHERE PurchaseOrder = ''
GO

SELECT sd.* 
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sd.[SalesOrder] = pmd.[MSalesOrder]AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
WHERE pmd.PurchaseOrder IN ('X05154','X05155','X05157','X05158')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
------------------------------
UPDATE [SysproCompanyT].[dbo].[PorMasterHdr]
   SET [OrderStatus] = '1'
 WHERE PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
GO

UPDATE [SysproCompanyT].[dbo].[PorMasterDetail]
   SET [MReceivedQty] = 0.000
      ,[MCompleteFlag] = 'N'
 WHERE PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
GO

UPDATE [MobileOrdering].[dbo].[ReceiveTickets]
   SET [TicketStatus] = 'New'	
      ,[TicketUser] = 'None'
 WHERE PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
GO



X05154
X05155
X05157
X05158
X05199
--------------------------------

UPDATE [MobileOrdering].[dbo].[PickTickets]
   SET [TicketStatus] = 'New'
      ,[TicketUser] = 'None'
WHERE OrderNumber IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874')
GO

UPDATE [MobileOrdering].[dbo].[PickTicketItems]
   SET [Complete] = 0
WHERE SalesOrder IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874')
GO

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
	   ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = 0.000
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd
WHERE sd.[SalesOrder] IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874')
AND NOT ( sd.LineType = '7' )
GO

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
	   ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = 0.000
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd
WHERE sd.[SalesOrder] IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874')
AND NOT ( sd.LineType = '7' )
GO

UPDATE [SysproCompanyT].[dbo].[SorMaster]
   SET [ReqShipDate] = '2015-02-24 00:00:00.000'
       ,[EntrySystemDate] = '2015-02-24 00:00:00.000'
       ,[OrderStatus] = 1
FROM [SysproCompanyT].[dbo].[SorMaster] AS SM, [SysproCompanyT].[dbo].[PorMasterDetail] AS PM
WHERE PM.[PurchaseOrder] IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
AND SM.[SalesOrder] = PM.[MSalesOrder]
GO

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = 0.000
       ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
	   ,[MOrderQty] = ( SELECT pmd.MOrderQty
						   FROM [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd
						   WHERE pmd.MSalesOrder = sd.SalesOrder
						   AND pmd.MSalesOrderLine = sd.SalesOrderLine )						   
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd, [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd 
WHERE pmd.PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
GO

--------------------------------------------------------------------------------------------------------

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = 0.000,
       ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd, [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd 
WHERE pmd.PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
GO

SELECT sd.* 
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd, [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd 
WHERE pmd.PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]


SELECT sd.* 
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sd.[SalesOrder] = pmd.[MSalesOrder]AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
WHERE pmd.PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]





---------------------------------

UPDATE [SysproCompanyT].[dbo].[SorDetail]
   SET [SalesOrder] = <SalesOrder, char(6),>
      ,[SalesOrderLine] = <SalesOrderLine, decimal(4,0),>
      ,[LineType] = <LineType, char(1),>
      ,[MStockCode] = <MStockCode, char(30),>
      ,[MStockDes] = <MStockDes, char(30),>
      ,[MWarehouse] = <MWarehouse, char(2),>
      ,[MBin] = <MBin, char(6),>
      ,[MShipQty] = <MShipQty, decimal(10,3),>
      ,[MBackOrderQty] = <MBackOrderQty, decimal(10,3),>
      ,[MUnitCost] = <MUnitCost, decimal(15,5),>
      ,[MBomFlag] = <MBomFlag, char(1),>
      ,[MParentKitType] = <MParentKitType, char(1),>
      ,[MQtyPer] = <MQtyPer, decimal(12,6),>
      ,[MScrapPercentage] = <MScrapPercentage, decimal(4,2),>
      ,[MPrintComponent] = <MPrintComponent, char(1),>
      ,[MComponentSeq] = <MComponentSeq, char(6),>
      ,[MQtyChangesFlag] = <MQtyChangesFlag, char(1),>
      ,[MOptionalFlag] = <MOptionalFlag, char(1),>
      ,[MDecimals] = <MDecimals, decimal(1,0),>
      ,[MOrderUom] = <MOrderUom, char(3),>
      ,[MStockQtyToShp] = <MStockQtyToShp, decimal(10,3),>
 WHERE <Search Conditions,,>
GO




--------------------------------

UPDATE [SysproCompanyT].[dbo].[PorMasterHdr]
   SET [OrderStatus] = '1'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [SysproCompanyT].[dbo].[PorMasterDetail]
   SET [MReceivedQty] = 0.000
      ,[MCompleteFlag] = 'N'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [MobileOrdering].[dbo].[ReceiveTickets]
   SET [TicketStatus] = 'New'	
      ,[TicketUser] = 'None'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
	   ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = 0.000
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sd.[SalesOrder] = pmd.[MSalesOrder]
WHERE pmd.PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
AND NOT ( sd.LineType = '7' )
GO

UPDATE [SysproCompanyT].[dbo].[SorMaster]
   SET [ReqShipDate] = '2015-02-27 00:00:00.000'
       ,[EntrySystemDate] = '2015-02-27 00:00:00.000'
       ,[OrderStatus] = 1
FROM [SysproCompanyT].[dbo].[SorMaster] AS sm INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sm.[SalesOrder] = pmd.[MSalesOrder]
WHERE pmd.PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [SysproCompanyT].[dbo].[SorDetail]
SET    [MShipQty] = 0.000
       ,[MQtyDispatched] = 0.000
      ,[MBackOrderQty] = ( SELECT sd2.MOrderQty 
						   FROM [SysproCompanyT].[dbo].[SorDetail] AS sd2
						   WHERE sd2.SalesOrder = sd.SalesOrder
						   AND sd2.SalesOrderLine = sd.SalesOrderLine )
	   ,[MOrderQty] = ( SELECT pmd.MOrderQty
						   FROM [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd
						   WHERE pmd.MSalesOrder = sd.SalesOrder
						   AND pmd.MSalesOrderLine = sd.SalesOrderLine )						   
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd, [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd 
WHERE pmd.PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
GO

--------------------------------------------------------------------------------------------------------

SELECT sd.* 
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sd.[SalesOrder] = pmd.[MSalesOrder]AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
WHERE pmd.PurchaseOrder IN ('X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]

UPDATE [MobileOrdering].[dbo].[PickTickets]
   SET [TicketStatus] = 'New'
      ,[TicketUser] = 'None'
WHERE OrderNumber IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874','X10875','X10876','X10878','X10879','X10880','X10881','X10882','X10884','X10885','X10886','X10887')
GO

UPDATE [MobileOrdering].[dbo].[PickTicketItems]
   SET [Complete] = 0
WHERE SalesOrder IN ('X10862','X10863','X10864','X10866','X10871','X10872','X10873','X10874','X10875','X10876','X10878','X10879','X10880','X10881','X10882','X10884','X10885','X10886','X10887')
GO



---------------------------------

SELECT * 
from ReceiveTicketItems 
Where PurchaseOrder IN(SELECT PurchaseOrder FROM ReceiveTicketItems
WHERE PurchaseOrder LIKE 'X%'
GROUP BY PurchaseOrder
Having COUNT(*) > 1)

UPDATE [SysproCompanyT].[dbo].[PorMasterHdr]
   SET [OrderStatus] = '1'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [SysproCompanyT].[dbo].[PorMasterDetail]
   SET [MReceivedQty] = 0.000
      ,[MCompleteFlag] = 'N'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

UPDATE [MobileOrdering].[dbo].[ReceiveTickets]
   SET [TicketStatus] = 'New'	
      ,[TicketUser] = 'None'
 WHERE PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
GO

SELECT sd.SalesOrder, pmd.PurchaseOrder, * 
FROM [SysproCompanyT].[dbo].[SorDetail] AS sd INNER JOIN [SysproCompanyT].[dbo].[PorMasterDetail] AS pmd ON sd.[SalesOrder] = pmd.[MSalesOrder]AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
WHERE pmd.PurchaseOrder IN ('X05154','X05155','X05157','X05158','X05199','X05190','X05191','X05192','X05193','X05194','X05195','X05196','X05200','X05201','X05202','X05203','X05205','X05206','X05207','X05208','X05209','X05211','X05212','X05213','X05214')
AND pmd.[MSalesOrder] IS NOT NULL
AND NOT ( pmd.[MSalesOrderLine] = '0' OR pmd.[MSalesOrderLine] IS NULL )
AND sd.[SalesOrder] = pmd.[MSalesOrder]
AND sd.[SalesOrderLine] = pmd.[MSalesOrderLine]
