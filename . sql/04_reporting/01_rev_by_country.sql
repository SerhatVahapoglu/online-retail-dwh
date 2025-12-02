-- Ülke bazlı toplam ciro

SELECT
    s.Country,
    SUM(s.LineAmount) AS TotalRevenue
FROM dm.vw_SalesClean AS s
GROUP BY s.Country
ORDER BY TotalRevenue DESC;
