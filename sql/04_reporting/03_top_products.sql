-- En çok ciro getiren 10 ürün

SELECT TOP 10
    s.StockCode,
    s.[Description],
    SUM(s.LineAmount) AS TotalRevenue,
    SUM(s.Quantity)   AS TotalQuantity
FROM dm.vw_SalesClean AS s
GROUP BY s.StockCode, s.[Description]
ORDER BY TotalRevenue DESC;
