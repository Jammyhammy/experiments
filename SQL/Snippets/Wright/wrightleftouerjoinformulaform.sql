/****** Script for SelectTopNRows command from SSMS  ******/
SELECT FF1., FF2.*  FROM [Formula Formulations] AS FF2
  LEFT OUTER JOIN [FormulaFormulation] AS FF1 ON FF1.Formula = FF2.[Formula #] And FF1.Ingredient = FF2.[Ingredient Name] And FF1.SourceID_fk = FF2.[WSNumber]
  WHERE FF1.Formula IS NULL