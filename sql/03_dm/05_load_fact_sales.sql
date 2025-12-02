-- core.OnlineRetail'den FactSales'e yükleme

INSERT INTO dm.FactSales
(
    DateKey,
    CustomerKey,
    ProductKey,
    InvoiceNo,
    Quantity,
    UnitPrice,
    LineAmount
)
SELECT
    CONVERT(INT, FORMAT(c.InvoiceDate, 'yyyyMMdd')) AS DateKey,
    dc.CustomerKey,
    dp.ProductKey,
    c.InvoiceNo,
    c.Quantity,
    c.UnitPrice,
    CAST(c.Quantity * c.UnitPrice AS DECIMAL(18,4)) AS LineAmount
FROM core.OnlineRetail AS c
INNER JOIN dm.DimProduct  AS dp ON c.StockCode  = dp.StockCode
LEFT  JOIN dm.DimCustomer AS dc ON c.CustomerID = dc.CustomerID;
GO

-- Kontrol
SELECT COUNT(*) AS FactSalesRowCount FROM dm.FactSales;
SELECT SUM(LineAmount) AS TotalRevenue FROM dm.FactSales;
GO
