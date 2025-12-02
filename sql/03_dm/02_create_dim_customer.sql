-- DimCustomer

IF OBJECT_ID('dm.DimCustomer', 'U') IS NOT NULL
    DROP TABLE dm.DimCustomer;
GO

CREATE TABLE dm.DimCustomer
(
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID  INT           NOT NULL,
    Country     NVARCHAR(100) NULL
);
GO

INSERT INTO dm.DimCustomer (CustomerID, Country)
SELECT DISTINCT
    CustomerID,
    Country
FROM core.OnlineRetail
WHERE CustomerID IS NOT NULL;
GO

SELECT COUNT(*) AS DimCustomerRowCount FROM dm.DimCustomer;
GO
