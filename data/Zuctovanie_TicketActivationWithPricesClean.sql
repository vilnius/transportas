
SELECT	  
	    od.[Prikaz] as LineCode
	  , kas.[CisloKasy] as ObcSNR
      --, zuc.[KasaID] as ValidatorSNR
      , zuc.[SNR] as CardSNR  
	  , tr.[Cena] as [Price]
	  , t.[Nazov] as Product 
      --, zuc.[CTL] as ProductID
      , zuc.[DCas] as DateAndTime
  FROM      [Listky61].[dbo].[sck_Zuctovanie] zuc
  LEFT JOIN [Listky61].[dbo].[kas_Listky] lis on lis.ListokID = zuc.ListokID
  LEFT JOIN [Listky61].[dbo].[kas_Odpocet] od on od.OdpocetID = zuc.OdpocetID
  LEFT JOIN [Listky61].[dbo].[kas_Kasa] kas on kas.KasaID = od.KasaID
  LEFT JOIN [Firma61].[dbo].[cpo_Tarify] t on t.PodtypListka = zuc.CTL
  LEFT JOIN [Firma61].[dbo].[cpo_Tarifa_Riadok] tr on tr.TarifaID = t.TarifaID
  WHERE 1 = 1
  and zuc.[DCas] between '2015-10-05' and '2015-10-06'
  and GetDate() between t.[PlatnostEditOd] and t.[PlatnostEditDo]
  and zuc.[Vklad] <> 1
  and kas.[CisloKasy] is not null
  and od.[Prikaz] > 0
  and t.[MenaId] = 14
  Order by od.[Prikaz], zuc.[DCas]
