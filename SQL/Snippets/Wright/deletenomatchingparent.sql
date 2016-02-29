DELETE OrderLine
FROM OrderLine LEFT OUTER JOIN Orders ON OrderLine.[SYS Order ID] = Orders.[SYS Order ID]
WHERE [Orders].[SYS Order ID] IS NULL;