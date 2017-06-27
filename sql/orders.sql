SELECT TOP 100 *
	FROM ITEMS_VIEW it
  inner join COMMESSE
    on it.id_commesse=commesse.id_commesse
  inner join ORDMAST
    on it.ID_ORDMAST=ordmast.ID_ORDMAST
  inner join ORDINI
    on ordmast.ID_ORDINI=ordmast.ID_ORDINI
  WHERE ordini.AVANZ=0
	-- order by it.DATACONS