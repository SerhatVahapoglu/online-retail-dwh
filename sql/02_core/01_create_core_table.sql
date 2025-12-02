-- Core tablo: tipleri düzeltilmiş transactional kayıtlar

IF OBJECT_ID('core.OnlineRetail', 'U') IS NOT NULL
    DROP TABLE core.OnlineRetail;
GO

CREATE TABLE core.OnlineRetail
(
    InvoiceNo    NVARCHAR(20)  NULL,
    StockCode    NVARCHAR(50)  NOT NULL,
    [Description] NVARCHAR(4000) NULL,
    Quantity     INT           NOT NULL,
    InvoiceDate  DATETIME      NOT NULL,
    UnitPrice    DECIMAL(18,4) NOT NULL,
    CustomerID   INT           NULL,
    Country      NVARCHAR(100) NULL
);
GO
