USE [Wright2015]
GO

INSERT INTO dbo.FormulaFormulation
           ([Formula]
           ,[Ingredient]
           ,[Concentration]
           ,[Filler1]
           ,[Filler2]
           ,[IsRawMaterial]
           ,[Vendor1]
           ,[Vendor2]
           ,[Vendor3]
           ,[RevisionDate]
           ,[LastModifiedBy]
           ,[SourceID_fk]
           ,[LabelRange]
           ,[Declared]
           ,[AltIngredientName]
           ,[AltAmount])
     SELECT FF2.[Formula #],
			FF2.[Ingredient Name],
			FF2.[Concentration],
			FF2.[Filler 1],
			FF2.[Filler 2],
			FF2.[RAW],
			FF2.[Vendor 1],
			FF2.[Vendor 2],
			FF2.[Vendor 3],
			FF2.[Revision Date],
			FF2.[LastModifiedBy],
			NULL,
			FF2.[Label Range],
			FF2.[Declared],
			FF2.[AltIngredientName],
			FF2.[AltAmount]
FROM            dbo.[Formula Formulations] AS FF2 LEFT OUTER JOIN
                         dbo.FormulaFormulation AS FF1 ON FF1.Formula = FF2.[Formula #] AND FF1.Ingredient = FF2.[Ingredient Name] AND FF1.SourceID_fk = FF2.WSNumber LEFT OUTER JOIN
                         dbo.IngredientSource AS INGS ON FF2.WSNumber = INGS.ID
WHERE        (FF1.Formula IS NULL) AND (INGS.ID IS NULL)
GO


