-- Ülke bazında yıl yıl ciro ve YoY (Year-over-Year) büyüme

WITH CountryYear AS
(
    SELECT
        s.[Year],
        s.Country,
        SUM(s.LineAmount) AS TotalRevenue
    FROM dm.vw_SalesClean AS s
    GROUP BY s.[Year], s.Country
),
CountryGrowth AS
(
    SELECT
        cy.Country,
        cy.[Year],
        cy.TotalRevenue,
        LAG(cy.TotalRevenue) OVER
            (PARTITION BY cy.Country ORDER BY cy.[Year]) AS PrevYearRevenue
    FROM CountryYear AS cy
)
SELECT
    Country,
    [Year],
    TotalRevenue,
    PrevYearRevenue,
    CASE
        WHEN PrevYearRevenue IS NULL OR PrevYearRevenue = 0
            THEN NULL
        ELSE (TotalRevenue - PrevYearRevenue) * 1.0 / PrevYearRevenue
    END AS YoYGrowthRate
FROM CountryGrowth
ORDER BY Country, [Year];
