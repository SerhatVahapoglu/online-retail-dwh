-- 2010–2011 CSV

BULK INSERT stg.OnlineRetailRaw
FROM '/var/opt/mssql/data/online_retail_2010_2011_fixed.csv'
WITH
(
    FIRSTROW       = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR   = '0x0A',
    TABLOCK
);
GO
