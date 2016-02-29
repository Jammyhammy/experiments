USE [Wright2015]
GO

UPDATE PT
   SET [SYSOrder] = (SELECT OL2.SYSOrder
					 FROM            dbo.Orders AS O2 INNER JOIN
									 dbo.OrdersLine AS OL2 ON O2.SYSOrder = OL2.SYSOrder INNER JOIN
									dbo.ProductionTicket AS PT2 ON O2.VenOrder = PT2.CustomerOrder AND 
									OL2.Line = PT2.LineItem AND 
									PT2.WEProductionLotNo = PT.WEProductionLotNo)
FROM [dbo].[ProductionTicket] AS PT
GO


SELECT        PD.ID
FROM            dbo.ProductionDemand AS PD INNER JOIN
                         dbo.ProductionDemandLine AS PDL ON PD.OrderNo = PDL.OrderNo
						 

						 
USE [Wright2015]
GO

UPDATE PDL
   SET [Demand_fk] = PD.ID
   FROM            dbo.ProductionDemand AS PD INNER JOIN
                         dbo.ProductionDemandLine AS PDL ON PD.OrderNo = PDL.OrderNo
GO


USE [Wright2015]
GO

UPDATE PT
   SET [DemandLine_fk] = PDL.ID
FROM            dbo.ProductionTicket AS PT LEFT OUTER JOIN
                         dbo.ProductionDemandLine AS PDL ON PT.CustomerOrder = PDL.OrderNo AND PT.LineItem = PDL.Line
GO

SELECT        OL.SYSOrder, OL.Line
FROM            dbo.OrdersLine AS OL INNER JOIN
                         dbo.Orders AS O ON OL.SYSOrder = O.SYSOrder INNER JOIN
                         dbo.ProductionDemand AS PD ON O.VenOrder = PD.OrderNo INNER JOIN
                         dbo.ProductionDemandLine AS PDL ON PD.ID = PDL.Demand_fk AND OL.Line = PDL.Line

USE [Wright2015]
GO

UPDATE [dbo].[ProductionDemandLine]
   SET [OrderLine_fk] = OL.ID
FROM            dbo.OrdersLine AS OL INNER JOIN
                         dbo.Orders AS O ON OL.SYSOrder = O.SYSOrder INNER JOIN
                         dbo.ProductionDemand AS PD ON O.VenOrder = PD.OrderNo INNER JOIN
                         dbo.ProductionDemandLine AS PDL ON PD.ID = PDL.Demand_fk AND OL.Line = PDL.Line
GO


