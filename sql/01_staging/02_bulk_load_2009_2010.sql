-- 2009–2010 CSV (Mac + Docker path'i kendine göre güncelle)

BULK INSERT stg.OnlineRetailRaw
FROM '/var/opt/mssql/data/online_retail_2009_2010_fixed.csv'
WITH
(
    FIRSTROW       = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR   = '0x0A',
    TABLOCK
);
GO
