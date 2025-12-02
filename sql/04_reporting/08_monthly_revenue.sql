-- Yıl–ay bazlı ciro (sezonsallık analizi)

SELECT
    s.[Year],
    s.[Month],
    s.[MonthName],
    SUM(s.LineAmount) AS TotalRevenue
FROM dm.vw_SalesClean AS s
GROUP BY s.[Year], s.[Month], s.[MonthName]
ORDER BY s.[Year], s.[Month];
