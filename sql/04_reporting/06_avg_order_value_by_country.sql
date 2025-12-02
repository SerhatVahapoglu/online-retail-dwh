-- Ülke başına ortalama sepet tutarı (Average Order Value)

SELECT
    s.Country,
    COUNT(DISTINCT s.InvoiceNo)                 AS OrderCount,
    SUM(s.LineAmount)                           AS TotalRevenue,
    SUM(s.LineAmount) * 1.0 /
        NULLIF(COUNT(DISTINCT s.InvoiceNo), 0)  AS AvgOrderValue
FROM dm.vw_SalesClean AS s
GROUP BY s.Country
ORDER BY AvgOrderValue DESC;
