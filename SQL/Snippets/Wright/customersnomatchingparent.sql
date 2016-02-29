DELETE C
FROM Customer As C LEFT JOIN [CustomerDefault] As CD ON C.[CustomerID] = CD.CustomerID
WHERE (CD.CustomerID Is Null);
