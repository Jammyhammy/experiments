UPDATE O1
SET O1.StatusHistory = (SELECT O2.[Status history] FROM dbo.Orders2 as O2 WHERE LEFT(O2.SYSOrder,5) = O1.SYSOrder)
FROM dbo.Orders AS O1