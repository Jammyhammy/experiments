USE [Wright2015]
GO

DELETE FIS
FROM [dbo].[FormulaIngredientSource] AS FIS 
LEFT OUTER JOIN dbo.IngredientSource AS ISou ON ISou.ID = FIS.SourceID_fk
      WHERE (ISou.ID IS NULL)
GO