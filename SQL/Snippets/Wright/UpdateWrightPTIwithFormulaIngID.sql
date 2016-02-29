USE [Wright2015]
GO

UPDATE PTI
   SET [FormulaFormulation_fk] = FF.ID
FROM            dbo.ProductionTicket AS PT INNER JOIN
                         dbo.ProductionTicketIngredient AS PTI ON PT.WEProductionLotNo = PTI.WEProductionLot INNER JOIN
                         dbo.FormulaFormulation AS FF ON PTI.IngredientName = FF.Ingredient AND PT.Formula = FF.Formula
GO


