-- Temizlenmiş satış view'i

IF OBJECT_ID('dm.vw_SalesClean', 'V') IS NOT NULL
    DROP VIEW dm.vw_SalesClean;
GO

CREATE VIEW dm.vw_SalesClean
AS
SELECT
    fs.SalesKey,
    fs.DateKey,
    fs.CustomerKey,
    fs.ProductKey,
    fs.InvoiceNo,
    fs.Quantity,
    fs.UnitPrice,
    fs.LineAmount,
    dd.[Date],
    dd.[Year],
    dd.[Month],
    dd.[MonthName],
    dc.CustomerID,
    dc.Country,
    dp.StockCode,
    dp.[Description]
FROM dm.FactSales      AS fs
JOIN dm.DimDate        AS dd ON fs.DateKey    = dd.DateKey
JOIN dm.DimProduct     AS dp ON fs.ProductKey = dp.ProductKey
LEFT JOIN dm.DimCustomer AS dc ON fs.CustomerKey = dc.CustomerKey
WHERE 1 = 1
  -- iade / iptal (C ile başlayan Invoice’lar) hariç
  AND (fs.InvoiceNo IS NULL OR CAST(fs.InvoiceNo AS NVARCHAR(20)) NOT LIKE 'C%')
  -- negatif veya 0 adet / fiyat hariç
  AND fs.Quantity  > 0
  AND fs.UnitPrice > 0
  -- posta, bank charges, damage vs. hariç
  AND dp.StockCode NOT IN ('DOT', 'M', 'BANK CHARGES')
  AND (dp.[Description] IS NULL OR dp.[Description] NOT LIKE '%damaged%');
GO
