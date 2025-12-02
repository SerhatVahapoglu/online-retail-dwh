-- Staging tablo: CSV olduğu gibi

IF OBJECT_ID('stg.OnlineRetailRaw', 'U') IS NOT NULL
    DROP TABLE stg.OnlineRetailRaw;
GO

CREATE TABLE stg.OnlineRetailRaw
(
    InvoiceNo    NVARCHAR(20)  NULL,
    StockCode    NVARCHAR(50)  NULL,
    [Description] NVARCHAR(4000) NULL,
    Quantity     INT           NULL,
    InvoiceDate  NVARCHAR(50)  NULL,  -- önce text olarak alıyoruz
    UnitPrice    NVARCHAR(50)  NULL,
    CustomerID   NVARCHAR(50)  NULL,
    Country      NVARCHAR(100) NULL
);
GO
