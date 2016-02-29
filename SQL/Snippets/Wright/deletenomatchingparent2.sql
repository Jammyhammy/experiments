USE [Wright2015]
GO

DELETE PL
FROM            dbo.PPS LEFT OUTER JOIN
                         dbo.PPSLine AS PL ON dbo.PPS.PPSID = PL.PPSID
WHERE        (PL.PPSID IS NULL)
GO