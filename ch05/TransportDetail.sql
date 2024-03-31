USE Galactic ;
GO
DECLARE @SerialNumber VARCHAR(20) = 'P-348-23-4532-22A' ;

SELECT tt.Description
	, tt.CargoCapacity
	, tt.Range
	, t.SerialNumber
	, t.PurchaseDate
	, t.RetiredDate
	, MAX(r.BeginWorkDate) AS LatestRepairDate
FROM TransportType tt
	INNER JOIN Transport t
		ON tt.TransportTypeID = t.TransportTypeID 
	LEFT OUTER JOIN Repair r
		ON t.TransportNumber = r.TransportNumber
GROUP BY tt.Description, tt.CargoCapacity, tt.Range, t.SerialNumber, t.PurchaseDate, t.RetiredDate
HAVING (t.SerialNumber = @SerialNumber) AND (t.RetiredDate IS NULL)
ORDER BY tt.Description, t.SerialNumber