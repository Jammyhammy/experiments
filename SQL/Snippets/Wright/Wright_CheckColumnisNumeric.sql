SELECT        TOP (200) ID, Formula, Ingredient, Concentration, Filler1, Filler2, IsRawMaterial, Vendor1, Vendor2, Vendor3, RevisionDate, LastModifiedBy, WSNumber, LabelRange, Declared, AltIngredientName, 
                         AltAmount
FROM            FormulaFormulation
WHERE        (ISNUMERIC(WSNumber) <> 1)