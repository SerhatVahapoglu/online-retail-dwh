# Online Retail Data Warehouse (SQL Server)

Bu repo, UCI Online Retail verisinden basit bir satış veri ambarı (star schema) kurar:

- **Şemalar:** `stg`, `core`, `dm`
- **Boyut tabloları:** `dm.DimDate`, `dm.DimCustomer`, `dm.DimProduct`
- **Fact tablo:** `dm.FactSales`
- **Temizlenmiş view:** `dm.vw_SalesClean`
- **Rapor sorguları:** `sql/04_reporting` altında (ülke, müşteri, ürün, YoY, segmentasyon vb.)

## Kurulum sırası

1. `sql/00_init/01_create_schemas.sql`
2. `sql/01_staging/01_create_stg_table.sql`
3. CSV dosyalarını `data/` klasörüne koy, Docker içinde uygun path'e kopyala.
4. `02_bulk_load_2009_2010.sql` ve `03_bulk_load_2010_2011.sql`
5. `02_core` altındaki scriptler
6. `03_dm` altındaki scriptler (sırasıyla)
7. `04_reporting` altındaki sorgular ile analizlerini çalıştır.

