USE Galactic ;
GO

SELECT SerialNumber FROM Transport WHERE RetiredDate IS NULL ORDER BY SerialNumber ;