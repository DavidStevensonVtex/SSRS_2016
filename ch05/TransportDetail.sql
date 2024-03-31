USE Galactic ;
GO

DECLARE @SerialNumber VARCHAR(20) = '3809393848' ;

SELECT t.SerialNumber
	, t.PurchaseDate
	, tt.Description
	, tt.CargoCapacity
	, tt.Range
	, tt.Cost
	, tt.Crew
	, tt.Manufacturer
	, tt.ManAddr1
	, tt.ManAddr2
	, tt.ManCity
	, tt.ManState
	, tt.ManZipCode
	, tt.ManPlanetAbbrv
	, tt.ManEmail
	, MIN(sm.ScheduledDate) AS NextMaintDate
	, r.RepairID
FROM Transport t
	INNER JOIN TransportType tt
		ON t.TransportTypeID = tt.TransportTypeID 
	LEFT OUTER JOIN ScheduledMaint sm
		ON t.TransportNumber = sm.TransportNumber 
	LEFT OUTER JOIN Repair r
		ON sm.ScheduledMaintID = r.ScheduledMaintID
WHERE t.SerialNumber = @SerialNumber 
GROUP BY t.SerialNumber
	, t.PurchaseDate
	, tt.Description
	, tt.CargoCapacity
	, tt.Range
	, tt.Cost
	, tt.Crew
	, tt.Manufacturer
	, tt.ManAddr1
	, tt.ManAddr2
	, tt.ManCity
	, tt.ManState
	, tt.ManZipCode
	, tt.ManPlanetAbbrv
	, tt.ManEmail
	, sm.ScheduledDate
	, r.RepairID
HAVING (t.SerialNumber = @SerialNumber) AND (r.RepairID IS NULL)