-- Gelirine göre müşteri segmentasyonu (High / Mid / Low)

WITH CustRevenue AS
(
    SELECT
        s.CustomerID,
        SUM(s.LineAmount) AS TotalRevenue
    FROM dm.vw_SalesClean AS s
    WHERE s.CustomerID IS NOT NULL
    GROUP BY s.CustomerID
),
CustSegment AS
(
    SELECT
        CustomerID,
        TotalRevenue,
        NTILE(3) OVER (ORDER BY TotalRevenue DESC) AS RevTier
        -- 1: en yüksek gelir, 3: en düşük
    FROM CustRevenue
)
SELECT
    CASE RevTier
        WHEN 1 THEN 'High Value'
        WHEN 2 THEN 'Mid Value'
        WHEN 3 THEN 'Low Value'
    END AS Segment,
    COUNT(*)              AS CustomerCount,
    SUM(TotalRevenue)     AS SegmentRevenue
FROM CustSegment
GROUP BY RevTier
ORDER BY RevTier;
