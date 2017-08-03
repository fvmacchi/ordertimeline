SELECT DISTINCT WORKKIND_CODICE, PRIOWORK
	FROM ITEMS_VIEW it
  INNER JOIN ORDINIVENDITA_VIEW AS ord
  -- inner join ORDINI as ord
    on it.ID_ORDINI=ord.ID_ORDINI
  -- where shipping status is "to be delivered"
  WHERE ((NOT ord.AVANZ=2)
    AND (NOT ISNULL(ord.RIFCLI,'')='CANCELLED')
    AND (NOT ISNULL(ord.RIFCLI,'')='CANCELED')
    AND (NOT ISNULL(ord.COMMESSA_CLI,'')='CANCELLED')
    AND (NOT ISNULL(ord.COMMESSA_CLI,'')='CANCELED'))
	order by PRIOWORK

