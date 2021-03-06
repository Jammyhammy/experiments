/****** Script for SelectTopNRows command from SSMS  ******/
SELECT FF.*

FROM

(SELECT [Formula]
      ,[Ingredient], COUNT(*) As Total
  FROM [Wright2015].[dbo].[FormulaFormulation]
GROUP BY Formula, Ingredient
HAVING COUNT (*) > 1) AS FFC

INNER JOIN Wright2015.dbo.FormulaFormulation AS FF ON FF.Formula = FFC.Formula AND FF.Ingredient = ffc.Ingredient

INNER JOIN Wright2015.dbo.ProductionTicket AS PT ON PT.Formula = FF.Formula 

INNER JOIN Wright2015.dbo.ProductionTicketIngredient AS PTI ON PTI.WEProductionLot = PT.WEProductionLotNo AND PTI.IngredientName = FF.Ingredient 