
DECLARE @ITEMSDATA TABLE (
           POSPZ int,
           EXCEED int,
           CODMAT varchar(32),
           SAGOMA varchar(8),
           DIMXPZ FLOAT,
           DIMYPZ FLOAT,
           ID_UM int,
           MOLATURA FLOAT,
           TIPOROTAZ varchar(2),
           NRETICH int,
           NOTES varchar(32),
           PZSTD varchar(1),
           TESTOFISSO varchar(8),
           DISTLISTELLO FLOAT,
           NOTE1 varchar(64),
           NOTE2 varchar(64),
           NOTE3 varchar(64),
           NOTE4 varchar(64),
           NOTE5 varchar(64),
           NOTE6 varchar(64),
           NOTE7 varchar(64),
           NOTE8 varchar(64),
           NOTE9 varchar(64),
           NOTE10 varchar(64),
           SAGNOTES varchar(32),
           DIMXPZR FLOAT,
           DIMYPZR FLOAT,
           NOTE11 varchar(64),
           NOTE12 varchar(64),
           NOTE13 varchar(64),
           NOTE14 varchar(64),
           NOTE15 varchar(64),
           NOTE16 varchar(64),
           NOTE17 varchar(64),
           NOTE18 varchar(64),
           NOTE19 varchar(64),
           NOTE20 varchar(64),
           MX1 FLOAT,
           MX2 FLOAT,
           MY1 FLOAT,
           MY2 FLOAT,
           ID_ORDINI int,
           MASTLABS int,
           AREA FLOAT,
           PERIMETRO FLOAT,
           AREATOT FLOAT,
           PERIMETROTOT FLOAT,
           TIPOVETRO int,
           STATO int,
           DESCR_MAT_COMP varchar(128),
           ID_PZ int,
           DELETED varchar(1),
           ID_LOTTI int,
           ORDINE varchar(12),
           RIFCLI varchar(50),
           ID_PERSONE int,
           DATAINS datetime,
           DATAORD datetime,
           DATACONS datetime,
           ORDINI_STATO int,
           PREV varchar(1),
           DEF varchar(1),
           INTERNAL varchar(1),
           CLIENTE varchar(12),
           LOTTI_CODICE varchar(16),
           RACK varchar(16),
           ORDRACK varchar(16),
           LAVQTAPZ int,
           LAVQTADONE int,
           LAVQTATODO int,
           RACKSORT int,
           ID_DETT int,
           ID_COMMESSE int,
           ID_ITEMS int,
           ID_DBASEORDINI int,
           ID_ORDDETT int,
           ID_ORDMAST int,
           ID_MAGAZ int,
           CODCOM varchar(16),
           DESCMAT varchar(50),
           SPESMAT FLOAT,
           COLORE varchar(2),
           WORKKIND_CODICE varchar(32),
           WORKDESC varchar(50),
           PRIOWORK int,
           ID_WORKKIND int,
           RIGA int,
           QTAPZ int,
           PRIOPZ int,
           PREFEPZ int,
           ID_LAVORAZIONI int,
           QTADONE int,
           ID_WORKS int,
           DIMENSIONE_X FLOAT,
           DIMENSIONE_Y FLOAT,
           DIMENSIONE_Z FLOAT,
           QUADRATURA FLOAT,
           RACKGROUP varchar(8),
           FORO int,
           PROGR int,
           RACKNO int,
           DELIVERY_RACK varchar(16),
           DELIVERY_RACKSORT int,
           BATCH_RACKSORT int,
           NUMTOTBARRE ftUMQta,
           LENTOTBARRE FLOAT,
           WORKS_POSPZ int,
           CheckLav int,
           ZONE_CODICE varchar(4),
           FLAGS_PROD int,
           isrect int,
           PRODUCTION_TYPE int,
           EWPOSPZ int,
           WORKS_QTAPZ int,
           ID_TIPILAVORAZIONE int,
           URGENCY int,
           ID_TIPICAUDOC int,
           DELIVERY_STOP int,
           ELAB int,
           SEQX int,
           X int,
           Y int,
           ROTANGLE float,
           EXTERNAL_ID_ITEMS int,
           CAVALLETTO varchar(6),
           TIPORACK int,
           COLORESPECIALE int,
           ID_RACKS int,
           ID_RWKITS int,
           RACKCDL int,
           RIF varchar(10),
           DESCR1 varchar(255),
           COMMESSA_CLI varchar(255),
           DESCR_ANAGRAFICA varchar(255),
           rn int)
	DECLARE @ELAB INT
	
	INSERT INTO @ITEMSDATA
	SELECT
	it.POSPZ, it.EXCEED, it.CODMAT, it.SAGOMA, it.DIMXPZ, it.DIMYPZ, it.ID_UM, it.MOLATURA, it.TIPOROTAZ, it.NRETICH, it.NOTES, it.PZSTD, 
	it.TESTOFISSO, it.DISTLISTELLO, it.NOTE1, it.NOTE2,it.NOTE3, it.NOTE4, it.NOTE5, it.NOTE6, it.NOTE7, it.NOTE8, it.NOTE9, it.NOTE10, 
	it.SAGNOTES, it.DIMXPZR, it.DIMYPZR, it.NOTE11, it.NOTE12, it.NOTE13, it.NOTE14, it.NOTE15, it.NOTE16, it.NOTE17, 
    it.NOTE18, it.NOTE19, it.NOTE20, it.MX1, it.MX2, it.MY1, it.MY2, it.ID_ORDINI, it.MASTLABS, it.AREA, it.PERIMETRO, it.AREATOT, 
    it.PERIMETROTOT, it.TIPOVETRO, it.STATO, it.DESCR_MAT_COMP, 
    it.ID_PZ, it.DELETED, it.ID_LOTTI, it.ORDINE, it.RIFCLI, it.ID_PERSONE, it.DATAINS, it.DATAORD, ord.DATACONS, it.ORDINI_STATO, 
    it.PREV, it.DEF, it.INTERNAL, it.CLIENTE, it.LOTTI_CODICE, 
    it.RACK, it.ORDRACK, it.LAVQTAPZ, it.LAVQTADONE, it.LAVQTATODO, it.RACKSORT, it.ID_DETT, it.ID_COMMESSE, it.ID_ITEMS, it.ID_DBASEORDINI, 
    it.ID_ORDDETT, it.ID_ORDMAST, 
    it.ID_MAGAZ, it.CODCOM, it.DESCMAT, it.SPESMAT, it.COLORE, it.WORKKIND_CODICE, it.WORKDESC, it.PRIOWORK, it.ID_WORKKIND, it.RIGA, it.QTAPZ, 
    it.PRIOPZ, it.PREFEPZ, 
    it.ID_LAVORAZIONI, it.QTADONE, it.ID_WORKS, it.DIMENSIONE_X, it.DIMENSIONE_Y, it.DIMENSIONE_Z, it.QUADRATURA, it.RACKGROUP, it.FORO, it.PROGR, it.RACKNO, 
    it.DELIVERY_RACK, it.DELIVERY_RACKSORT, it.BATCH_RACKSORT, it.NUMTOTBARRE, it.LENTOTBARRE, it.WORKS_POSPZ, it.CheckLav, it.ZONE_CODICE, it.FLAGS_PROD, it.isrect, 
    it.PRODUCTION_TYPE, it.EWPOSPZ, it.WORKS_QTAPZ, it.ID_TIPILAVORAZIONE, it.URGENCY, it.ID_TIPICAUDOC, it.DELIVERY_STOP, it.ELAB, it.SEQX, it.X, it.Y, it.ROTANGLE, 
    it.EXTERNAL_ID_ITEMS, it.CAVALLETTO, it.TIPORACK, it.COLORESPECIALE, it.ID_RACKS, it.ID_RWKITS, it.RACKCDL, ord.RIF, ord.DESCR1,
    ord.COMMESSA_CLI, ordit.DESCR_ANAGRAFICA,
    rn = ROW_NUMBER() OVER (PARTITION BY ord.RIF,ordit.DESCR_ANAGRAFICA ORDER BY ord.DATACONS
    )
	FROM ITEMS_VIEW it
  <%=!broadSearch?'INNER':'RIGHT'%> JOIN ORDINIVENDITA_VIEW AS ord
  -- inner join ORDINI as ord
    on it.ID_ORDINI=ord.ID_ORDINI
  RIGHT JOIN ORDITEMS_VENDITA_VIEW AS ordit
    on ord.ID_ORDINI=ordit.ID_ORDINI
  -- where shipping status is "to be delivered"
  WHERE ((NOT ord.AVANZ=2)
    AND (NOT ord.RIFCLI='CANCELLED')
    AND (NOT ord.RIFCLI='CANCELED')
    AND (NOT ord.COMMESSA_CLI='CANCELLED')
    AND (NOT ord.COMMESSA_CLI='CANCELED'))
    <% if(searchString) { %>
    AND (ord.RIF LIKE '%<%=searchString%>%'
      OR ord.DESCR1 LIKE '%<%=searchString%>%'
      OR ord.COMMESSA_CLI LIKE '%<%=searchString%>%'
      OR ordit.DESCR_ANAGRAFICA LIKE '%<%=searchString%>%'
    )
    <% } %>
	order by ord.DATACONS
	
	-- DECLARE L CURSOR LOCAL FOR
	-- SELECT DISTINCT ELAB FROM @ITEMSDATA where ELAB > 0
  -- 
	-- OPEN L
	-- FETCH NEXT FROM L INTO @ELAB
	-- WHILE @@FETCH_STATUS=0
	-- BEGIN
	-- 	INSERT INTO @ITEMSDATA (SEQX, ELAB) VALUES (0,@ELAB)
	-- 	FETCH NEXT FROM L INTO @ELAB	
	-- END
	-- CLOSE L
	-- DEALLOCATE L

	-- Select * from @ITEMSDATA order by ELAB,SEQX, POSPZ
  SELECT * FROM @ITEMSDATA WHERE rn=1 ORDER BY DATACONS


