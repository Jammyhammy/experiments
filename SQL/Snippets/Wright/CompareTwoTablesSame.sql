SELECT * FROM FormulaFormulation As FF, FormulaFormulation2 as FF2
WHERE FF.ID = FF2.ID And
FF.Formula <> FF2.Formula