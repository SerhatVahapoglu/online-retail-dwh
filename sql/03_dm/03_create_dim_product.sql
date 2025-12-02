-- DimProduct

IF OBJECT_ID('dm.DimProduct', 'U') IS NOT NULL
    DROP TABLE dm.DimProduct;
GO

CREATE TABLE dm.DimProduct
(
    ProductKey  INT IDENTITY(1,1) PRIMARY KEY,
    StockCode   NVARCHAR(50)   NOT NULL,
    [Description] NVARCHAR(4000) NULL
);
GO

INSERT INTO dm.DimProduct (StockCode, [Description])
SELECT DISTINCT
    StockCode,
    [Description]
FROM core.OnlineRetail;
GO

SELECT COUNT(*) AS DimProductRowCount FROM dm.DimProduct;
GO
