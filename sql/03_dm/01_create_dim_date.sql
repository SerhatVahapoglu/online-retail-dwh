-- DimDate

IF OBJECT_ID('dm.DimDate', 'U') IS NOT NULL
    DROP TABLE dm.DimDate;
GO

CREATE TABLE dm.DimDate
(
    DateKey    INT          NOT NULL PRIMARY KEY,  -- YYYYMMDD
    [Date]     DATE         NOT NULL,
    [Year]     INT          NOT NULL,
    [Month]    TINYINT      NOT NULL,
    [Day]      TINYINT      NOT NULL,
    [MonthName] NVARCHAR(20) NOT NULL,
    [DayName]   NVARCHAR(20) NOT NULL,
    [Quarter]   TINYINT      NOT NULL
);
GO

DECLARE @MinDate DATE = (SELECT MIN(InvoiceDate) FROM core.OnlineRetail);
DECLARE @MaxDate DATE = (SELECT MAX(InvoiceDate) FROM core.OnlineRetail);

;WITH Dates AS
(
    SELECT @MinDate AS [Date]
    UNION ALL
    SELECT DATEADD(DAY, 1, [Date])
    FROM Dates
    WHERE [Date] < @MaxDate
)
INSERT INTO dm.DimDate
(
    DateKey, [Date], [Year], [Month], [Day],
    [MonthName], [DayName], [Quarter]
)
SELECT
    CONVERT(INT, FORMAT([Date], 'yyyyMMdd')) AS DateKey,
    [Date],
    YEAR([Date]),
    MONTH([Date]),
    DAY([Date]),
    DATENAME(MONTH, [Date]),
    DATENAME(WEEKDAY, [Date]),
    DATEPART(QUARTER, [Date])
FROM Dates
OPTION (MAXRECURSION 0);
GO

SELECT COUNT(*) AS DimDateRowCount FROM dm.DimDate;
SELECT MIN([Date]) AS MinDate, MAX([Date]) AS MaxDate FROM dm.DimDate;
GO
