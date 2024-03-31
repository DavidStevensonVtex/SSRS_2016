USE Galactic ;
GO

SELECT r.RepairID
	, t.TransportNumber
	, tt.Description AS TypeOfTransport
	, rwdl.RepairWorkDoneID
	, wd.Description AS TypeOfWork
	, rc.Description AS RepairCause
FROM Repair r 
	INNER JOIN RepairCause rc
		ON r.CauseCode = rc.CauseCode
	INNER JOIN Transport t
		ON r.TransportNumber = t.TransportNumber 
	INNER JOIN TransportType tt
		ON t.TransportTypeID = tt.TransportTypeID
	INNER JOIN RepairWorkDoneLink rwdl
		ON r.RepairID = rwdl.RepairID
	INNER JOIN WorkDone wd
		ON rwdl.WorkDoneCode = wd.WorkDoneCode
ORDER BY RepairCause, TypeOfWork ;