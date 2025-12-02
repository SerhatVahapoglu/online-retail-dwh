-- En az satılan (pozitif ama çok az) 20 ürün

SELECT TOP 20
    s.StockCode,
    s.[Description],
    SUM(s.Quantity)   AS TotalQuantity,
    SUM(s.LineAmount) AS TotalRevenue
FROM dm.vw_SalesClean AS s
GROUP BY s.StockCode, s.[Description]
HAVING SUM(s.Quantity) > 0
ORDER BY TotalQuantity ASC, TotalRevenue ASC;
