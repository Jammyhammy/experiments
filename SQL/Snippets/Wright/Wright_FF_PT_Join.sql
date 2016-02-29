/****** Script for SelectTopNRows command from SSMS  ******/
SELECT PTI.*, FF.*
 
FROM Wright2015.dbo.FormulaFormulation AS FF 

INNER JOIN Wright2015.dbo.ProductionTicket AS PT ON PT.Formula = FF.Formula 

INNER JOIN Wright2015.dbo.ProductionTicketIngredient AS PTI ON PTI.WEProductionLot = PT.WEProductionLotNo AND PTI.IngredientName = FF.Ingredient AND PTI.WSNumber = FF.WSNumber 