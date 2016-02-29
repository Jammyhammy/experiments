USE [Wright2015]
GO

UPDATE FF1
   SET [Formula] = FF2.[Formula #]
      ,[Ingredient] = FF2.[Ingredient Name]
      ,[Concentration] = FF2.[Concentration]
      ,[Filler1] = FF2.[Filler 1]
      ,[Filler2] = FF2.[Filler 2]
      ,[IsRawMaterial] = FF2.[RAW]
      ,[Vendor1] = FF2.[Vendor 1]
      ,[Vendor2] = FF2.[Vendor 2]
      ,[Vendor3] = FF2.[Vendor 3]
      ,[RevisionDate] = FF2.[Revision Date]
      ,[LastModifiedBy] = FF2.[LastModifiedBy]
      ,[SourceID_fk] = FF2.[WSNumber]
      ,[LabelRange] = FF2.[Label Range]
      ,[Declared] = FF2.[Declared]
      ,[AltIngredientName] = FF2.[AltIngredientName]
      ,[AltAmount] = FF2.[AltAmount]
 FROM [Formula Formulations] AS FF2
  LEFT OUTER JOIN [FormulaFormulation] AS FF1 ON FF1.Formula = FF2.[Formula #] And FF1.Ingredient = FF2.[Ingredient Name] And FF1.SourceID_fk = FF2.[WSNumber]
  WHERE FF1.Formula IS NULL

