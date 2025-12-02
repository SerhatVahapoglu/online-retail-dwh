-- FactSales

IF OBJECT_ID('dm.FactSales', 'U') IS NOT NULL
    DROP TABLE dm.FactSales;
GO

CREATE TABLE dm.FactSales
(
    SalesKey    BIGINT IDENTITY(1,1) PRIMARY KEY,
    DateKey     INT            NOT NULL,
    CustomerKey INT            NULL,    -- bazı satırlarda CustomerID yok
    ProductKey  INT            NOT NULL,
    InvoiceNo   NVARCHAR(20)   NULL,
    Quantity    INT            NOT NULL,
    UnitPrice   DECIMAL(18,4)  NOT NULL,
    LineAmount  DECIMAL(18,4)  NOT NULL  -- Quantity * UnitPrice
);

-- Foreign key'ler
ALTER TABLE dm.FactSales
ADD CONSTRAINT FK_FactSales_DimDate
    FOREIGN KEY (DateKey) REFERENCES dm.DimDate(DateKey);

ALTER TABLE dm.FactSales
ADD CONSTRAINT FK_FactSales_DimCustomer
    FOREIGN KEY (CustomerKey) REFERENCES dm.DimCustomer(CustomerKey);

ALTER TABLE dm.FactSales
ADD CONSTRAINT FK_FactSales_DimProduct
    FOREIGN KEY (ProductKey) REFERENCES dm.DimProduct(ProductKey);
GO
