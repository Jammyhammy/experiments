SELECT     TOP (100) PERCENT dbo.PorMasterDetail.PurchaseOrder, dbo.PorMasterDetail.Line, dbo.PorMasterDetail.MSalesOrder, dbo.PorMasterDetail.MSalesOrderLine, dbo.PorMasterDetail.LineType, 
                      dbo.PorMasterDetail.MWarehouse, dbo.PorMasterDetail.MStockCode, dbo.PorMasterDetail.MOrderQty, dbo.SorDetail.MOrderQty AS SorOrderQty, dbo.PorMasterDetail.MReceivedQty, 
                      dbo.PorMasterDetail.MGlCode, dbo.PorMasterDetail.MCompleteFlag, dbo.SorDetail.MShipQty, dbo.SorDetail.MBackOrderQty, dbo.SorDetail.MStockQtyToShp, dbo.InvWarehouse.QtyOnHand, 
                      dbo.InvWarehouse.QtyAllocated, dbo.InvWarehouse.QtyOnOrder, dbo.InvWarehouse.QtyOnBackOrder, dbo.InvWarehouse.QtyInTransit, dbo.PorMasterDetail.MLastReceiptDat, 
                      dbo.PorMasterDetail.MStockDes, dbo.SorDetail.MBin
FROM         dbo.PorMasterDetail INNER JOIN
                      dbo.SorDetail ON dbo.PorMasterDetail.MSalesOrder = dbo.SorDetail.SalesOrder AND dbo.PorMasterDetail.MSalesOrderLine = dbo.SorDetail.SalesOrderLine LEFT OUTER JOIN
                      dbo.InvWarehouse ON dbo.PorMasterDetail.MStockCode = dbo.InvWarehouse.StockCode AND dbo.PorMasterDetail.MWarehouse = dbo.InvWarehouse.Warehouse AND 
                      dbo.SorDetail.MStockCode = dbo.InvWarehouse.StockCode AND dbo.SorDetail.MWarehouse = dbo.InvWarehouse.Warehouse
WHERE     (dbo.PorMasterDetail.MSalesOrder LIKE 'X%') AND (dbo.PorMasterDetail.PurchaseOrder LIKE 'X%')
ORDER BY dbo.PorMasterDetail.PurchaseOrder, dbo.PorMasterDetail.Line, dbo.PorMasterDetail.MSalesOrder, dbo.PorMasterDetail.MSalesOrderLine