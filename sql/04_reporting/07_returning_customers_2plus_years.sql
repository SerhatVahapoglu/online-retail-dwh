-- En az 2 farklı yılda alışveriş yapan müşteriler (retention)

WITH CustYear AS
(
    SELECT DISTINCT
        CustomerID,
        [Year]
    FROM dm.vw_SalesClean
    WHERE CustomerID IS NOT NULL
)
SELECT
    cy.CustomerID
FROM CustYear AS cy
GROUP BY cy.CustomerID
HAVING COUNT(DISTINCT cy.[Year]) >= 2
ORDER BY cy.CustomerID;
