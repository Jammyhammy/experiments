USE [Wright2015]
GO

UPDATE FI
   SET FI.[Procedures] = FI2.[Procedure]
FROM            dbo.FormulaInformation AS FI LEFT OUTER JOIN
                         dbo.[Formula Information] AS FI2 ON FI.Formula = FI2.[Formula #] AND FI.FormulaName = FI2.[Formula Name] AND FI.SubFormula = FI2.[Sub Formula #] AND 
                         FI.RestrictedToCustomer = FI2.[Restricted To Customer #]
GO


