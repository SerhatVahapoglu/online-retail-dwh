-- Yıl & ülke bazında toplam ciro

SELECT
    s.[Year],
    s.Country,
    SUM(s.LineAmount) AS TotalRevenue
FROM dm.vw_SalesClean AS s
GROUP BY s.[Year], s.Country
ORDER BY s.[Year], TotalRevenue DESC;
