-- Staging'den core'a type conversion ve basic cleaning ile aktarım

INSERT INTO core.OnlineRetail
(
    InvoiceNo,
    StockCode,
    [Description],
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
SELECT
    NULLIF(InvoiceNo, '')                             AS InvoiceNo,
    StockCode,
    NULLIF([Description], '')                         AS [Description],
    TRY_CONVERT(INT, Quantity)                        AS Quantity,
    -- CSV'deki format: 'dd.MM.yyyy HH:mm'
    TRY_CONVERT(DATETIME, InvoiceDate, 104)           AS InvoiceDate,
    TRY_CONVERT(DECIMAL(18,4), UnitPrice)            AS UnitPrice,
    TRY_CONVERT(INT, CustomerID)                      AS CustomerID,
    NULLIF(Country, '')                               AS Country
FROM stg.OnlineRetailRaw
WHERE
    TRY_CONVERT(INT, Quantity) IS NOT NULL
    AND TRY_CONVERT(DATETIME, InvoiceDate, 104) IS NOT NULL
    AND TRY_CONVERT(DECIMAL(18,4), UnitPrice) IS NOT NULL;
GO

-- Kontrol
SELECT COUNT(*) AS CoreRowCount FROM core.OnlineRetail;
SELECT MIN(InvoiceDate) AS MinDate, MAX(InvoiceDate) AS MaxDate
FROM core.OnlineRetail;
GO
