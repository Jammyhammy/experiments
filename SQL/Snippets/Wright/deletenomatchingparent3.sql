USE [Wright2015]
GO

DELETE FROM [dbo].[FormulaFormulation] FROM            dbo.FormulaFormulation LEFT OUTER JOIN
                         dbo.FormulaInformation ON dbo.FormulaFormulation.Formula = dbo.FormulaInformation.Formula
WHERE        (dbo.FormulaInformation.ID IS NULL)
GO


