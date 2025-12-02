-- En çok ciro yapan 10 müşteri

SELECT TOP 10
    s.CustomerID,
    s.Country,
    SUM(s.LineAmount) AS TotalRevenue
FROM dm.vw_SalesClean AS s
WHERE s.CustomerID IS NOT NULL
GROUP BY s.CustomerID, s.Country
ORDER BY TotalRevenue DESC;
