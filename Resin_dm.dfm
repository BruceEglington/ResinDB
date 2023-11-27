object dmR: TdmR
  OldCreateOrder = False
  Height = 561
  Width = 676
  object sqlcResinDB: TSQLConnection
    DriverName = 'DevartFirebird'
    LoginPrompt = False
    Params.Strings = (
      'VendorLibOsx=libfbclient.dylib'
      'GetDriverFunc=getSQLDriverFirebird'
      'LibraryName=dbexpida41.dll'
      'VendorLib=c:\exe32\fbclient.dll'
      'DataBase=bromo2.usask.ca:s:/data/firebird/resindb2021v30.fdb'
      'User_Name=sysdba'
      'Password=V0lcano3^'
      'SQLDialect=3'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'DevartFirebird TransIsolation=ReadCommitted'
      'ProductName=DevartFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver260.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartInterBaseMetaDataCommandFactory,' +
        'DbxDevartInterBaseDriver260.bpl'
      'DriverUnit=DbxDevartInterBase')
    Left = 32
    Top = 14
  end
  object Query1: TSQLQuery
    ObjectView = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select COLKDS.REAGENT1, COLKDS.REAGENT2, COLKDS.RESINID,'
      '  COLKDS.ELEMENT, COLKDS.VALENCE,'
      '  COLKDS.MOLARITY1, COLKDS.MOLARITY2, COLKDS.KD,'
      '  RESINS.RESINNAME, RESINS.RESIN, RESINS.XLINK,'
      '  REAGENTS.REAGENTNAME,'
      '  IONS.IONID'
      'from COLKDS, RESINS, REAGENTS, IONS, ELEMENTS'
      'where COLKDS.RESINID=RESINS.RESINID'
      'and COLKDS.REAGENT1=REAGENTS.REAGENTID'
      'and COLKDS.ELEMENT=IONS.ELEMENT'
      'and COLKDS.VALENCE=IONS.VALENCE'
      'and ELEMENTS.ELEMENT=IONS.ELEMENT')
    SQLConnection = sqlcResinDB
    Left = 124
    Top = 14
    object Query1REAGENT1: TStringField
      FieldName = 'REAGENT1'
      Required = True
      Size = 10
    end
    object Query1REAGENT2: TStringField
      FieldName = 'REAGENT2'
      Required = True
      Size = 10
    end
    object Query1RESINID: TStringField
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object Query1ELEMENT: TStringField
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object Query1VALENCE: TSmallintField
      FieldName = 'VALENCE'
      Required = True
    end
    object Query1MOLARITY1: TFloatField
      FieldName = 'MOLARITY1'
      Required = True
    end
    object Query1MOLARITY2: TFloatField
      FieldName = 'MOLARITY2'
      Required = True
    end
    object Query1KD: TFloatField
      FieldName = 'KD'
    end
    object Query1RESINNAME: TStringField
      FieldName = 'RESINNAME'
    end
    object Query1RESIN: TStringField
      FieldName = 'RESIN'
      Size = 10
    end
    object Query1XLINK: TStringField
      FieldName = 'XLINK'
      FixedChar = True
      Size = 2
    end
    object Query1REAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
    end
    object Query1IONID: TStringField
      FieldName = 'IONID'
      Size = 3
    end
  end
  object dspQuery1: TDataSetProvider
    DataSet = Query1
    Left = 154
    Top = 14
  end
  object cdsQuery1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuery1'
    Left = 182
    Top = 14
    object cdsQuery1REAGENT1: TStringField
      DisplayLabel = 'Reagent 1'
      FieldName = 'REAGENT1'
      Required = True
      Size = 10
    end
    object cdsQuery1REAGENT2: TStringField
      DisplayLabel = 'Reagent 2'
      FieldName = 'REAGENT2'
      Required = True
      Size = 10
    end
    object cdsQuery1RESINID: TStringField
      DisplayLabel = 'Resin ID'
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object cdsQuery1ELEMENT: TStringField
      DisplayLabel = 'Element'
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object cdsQuery1VALENCE: TSmallintField
      DisplayLabel = 'Valence'
      FieldName = 'VALENCE'
      Required = True
    end
    object cdsQuery1MOLARITY1: TFloatField
      DisplayLabel = 'Molarity 1'
      FieldName = 'MOLARITY1'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsQuery1MOLARITY2: TFloatField
      DisplayLabel = 'Molarity 2'
      FieldName = 'MOLARITY2'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsQuery1KD: TFloatField
      DisplayLabel = 'K(D)'
      FieldName = 'KD'
      DisplayFormat = '####0.0'
    end
    object cdsQuery1RESINNAME: TStringField
      FieldName = 'RESINNAME'
      ProviderFlags = []
    end
    object cdsQuery1RESIN: TStringField
      FieldName = 'RESIN'
      ProviderFlags = []
      Size = 10
    end
    object cdsQuery1XLINK: TStringField
      FieldName = 'XLINK'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cdsQuery1REAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
      ProviderFlags = []
    end
    object cdsQuery1IONID: TStringField
      FieldName = 'IONID'
      Size = 3
    end
  end
  object dsQuery1: TDataSource
    DataSet = cdsQuery1
    Left = 210
    Top = 14
  end
  object qProgress: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ProgressID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select * from Progress'
      'where Progress.ProgressID=:ProgressID')
    SQLConnection = sqlcResinDB
    Left = 394
    Top = 16
    object qProgressPROGRESSID: TIntegerField
      FieldName = 'PROGRESSID'
      Required = True
    end
    object qProgressPROGRESSDATE: TSQLTimeStampField
      FieldName = 'PROGRESSDATE'
    end
    object qProgressPROGRESSDETAILS: TMemoField
      FieldName = 'PROGRESSDETAILS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspProgress: TDataSetProvider
    DataSet = qProgress
    Left = 422
    Top = 16
  end
  object cdsProgress: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProgress'
    Left = 450
    Top = 16
    object cdsProgressPROGRESSID: TIntegerField
      DisplayLabel = 'Progress ID'
      FieldName = 'PROGRESSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProgressPROGRESSDATE: TSQLTimeStampField
      DisplayLabel = 'Date'
      FieldName = 'PROGRESSDATE'
    end
    object cdsProgressPROGRESSDETAILS: TMemoField
      DisplayLabel = 'Details'
      FieldName = 'PROGRESSDETAILS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsProgress: TDataSource
    DataSet = cdsProgress
    Left = 478
    Top = 16
  end
  object qReagents: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Reagents')
    SQLConnection = sqlcResinDB
    Left = 26
    Top = 94
    object qReagentsREAGENTID: TStringField
      FieldName = 'REAGENTID'
      Required = True
      Size = 10
    end
    object qReagentsREAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
    end
  end
  object qResins: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Resins')
    SQLConnection = sqlcResinDB
    Left = 24
    Top = 158
    object qResinsRESINID: TStringField
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object qResinsRESINNAME: TStringField
      FieldName = 'RESINNAME'
    end
    object qResinsRESIN: TStringField
      FieldName = 'RESIN'
      Size = 10
    end
    object qResinsXLINK: TStringField
      FieldName = 'XLINK'
      FixedChar = True
      Size = 2
    end
  end
  object qElements: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Elements')
    SQLConnection = sqlcResinDB
    Left = 22
    Top = 216
    object qElementsELEMENT: TStringField
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
  end
  object qIons: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from Ions')
    SQLConnection = sqlcResinDB
    Left = 24
    Top = 276
    object qIonsELEMENT: TStringField
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object qIonsVALENCE: TSmallintField
      FieldName = 'VALENCE'
      Required = True
    end
    object qIonsIONID: TStringField
      FieldName = 'IONID'
      Size = 3
    end
  end
  object qReferences: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ReferenceList.ReferenceID '
      'from ReferenceList')
    SQLConnection = sqlcResinDB
    Left = 20
    Top = 336
    object qReferencesREFERENCEID: TStringField
      FieldName = 'REFERENCEID'
      Required = True
      Size = 100
    end
  end
  object qRefFull: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ReferenceID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select * from ReferenceList'
      'where ReferenceList.ReferenceID=:ReferenceID')
    SQLConnection = sqlcResinDB
    Left = 22
    Top = 392
    object qRefFullREFERENCEID: TStringField
      FieldName = 'REFERENCEID'
      Required = True
      Size = 100
    end
    object qRefFullREFERNCEDETAIL: TMemoField
      FieldName = 'REFERNCEDETAIL'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspReagents: TDataSetProvider
    DataSet = qReagents
    Left = 54
    Top = 94
  end
  object dspResins: TDataSetProvider
    DataSet = qResins
    Left = 52
    Top = 158
  end
  object dspElements: TDataSetProvider
    DataSet = qElements
    Left = 50
    Top = 216
  end
  object dspIons: TDataSetProvider
    DataSet = qIons
    Left = 50
    Top = 276
  end
  object dspReferences: TDataSetProvider
    DataSet = qReferences
    Left = 48
    Top = 336
  end
  object dspRefFull: TDataSetProvider
    DataSet = qRefFull
    Left = 50
    Top = 392
  end
  object cdsReagents: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReagents'
    Left = 82
    Top = 94
    object cdsReagentsREAGENTID: TStringField
      DisplayLabel = 'Reagent ID'
      FieldName = 'REAGENTID'
      Required = True
      Size = 10
    end
    object cdsReagentsREAGENTNAME: TStringField
      DisplayLabel = 'Reagent'
      FieldName = 'REAGENTNAME'
    end
  end
  object cdsResins: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResins'
    Left = 80
    Top = 158
    object cdsResinsRESINID: TStringField
      DisplayLabel = 'Resin ID'
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object cdsResinsRESINNAME: TStringField
      DisplayLabel = 'Resin name'
      FieldName = 'RESINNAME'
    end
    object cdsResinsRESIN: TStringField
      DisplayLabel = 'Resin'
      FieldName = 'RESIN'
      Size = 10
    end
    object cdsResinsXLINK: TStringField
      DisplayLabel = 'Cross linkage'
      FieldName = 'XLINK'
      FixedChar = True
      Size = 2
    end
  end
  object cdsElements: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspElements'
    Left = 78
    Top = 216
    object cdsElementsELEMENT: TStringField
      DisplayLabel = 'Element'
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
  end
  object cdsIons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIons'
    Left = 78
    Top = 276
    object cdsIonsELEMENT: TStringField
      DisplayLabel = 'Element'
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object cdsIonsVALENCE: TSmallintField
      DisplayLabel = 'Valence'
      FieldName = 'VALENCE'
      Required = True
    end
    object cdsIonsIONID: TStringField
      DisplayLabel = 'Ion ID'
      FieldName = 'IONID'
      Size = 3
    end
  end
  object cdsReferences: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReferences'
    Left = 76
    Top = 336
    object cdsReferencesREFERENCEID: TStringField
      DisplayLabel = 'Reference ID'
      FieldName = 'REFERENCEID'
      Required = True
      Size = 100
    end
  end
  object cdsRefFull: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRefFull'
    Left = 78
    Top = 392
    object cdsRefFullREFERENCEID: TStringField
      DisplayLabel = 'Reference ID'
      FieldName = 'REFERENCEID'
      Required = True
      Size = 100
    end
    object cdsRefFullREFERNCEDETAIL: TMemoField
      DisplayLabel = 'Full details'
      FieldName = 'REFERNCEDETAIL'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsReagents: TDataSource
    DataSet = cdsReagents
    Left = 110
    Top = 94
  end
  object dsResins: TDataSource
    DataSet = cdsResins
    Left = 108
    Top = 158
  end
  object dsElements: TDataSource
    DataSet = cdsElements
    Left = 106
    Top = 216
  end
  object dsIons: TDataSource
    DataSet = cdsIons
    Left = 106
    Top = 276
  end
  object dsReferences: TDataSource
    DataSet = cdsReferences
    Left = 104
    Top = 336
  end
  object dsRefFull: TDataSource
    DataSet = cdsRefFull
    Left = 106
    Top = 392
  end
  object cdsTempDataKD: TClientDataSet
    PersistDataPacket.Data = {
      7C0000009619E0BD0100000018000000050000000000030000007C0005496F6E
      4944010049000000010005574944544802000200030007456C656D656E740100
      4900000001000557494454480200020002000756616C656E6365040001000000
      0000084D6F6C61726974790800040000000000024B4408000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IonID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Element'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Valence'
        DataType = ftInteger
      end
      item
        Name = 'Molarity'
        DataType = ftFloat
      end
      item
        Name = 'KD'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 302
    Top = 100
    object cdsTempDataKDIonID: TStringField
      FieldName = 'IonID'
      Size = 3
    end
    object cdsTempDataKDElement: TStringField
      FieldName = 'Element'
      Size = 2
    end
    object cdsTempDataKDValence: TIntegerField
      FieldName = 'Valence'
    end
    object cdsTempDataKDMolarity: TFloatField
      FieldName = 'Molarity'
      DisplayFormat = '#0.00'
    end
    object cdsTempDataKDKD: TFloatField
      FieldName = 'KD'
      DisplayFormat = '####0.0'
    end
    object cdsTempDataKDIonName: TStringField
      FieldKind = fkCalculated
      FieldName = 'IonName'
      Size = 5
      Calculated = True
    end
  end
  object dsTempDataKD: TDataSource
    DataSet = cdsTempDataKD
    Left = 330
    Top = 100
  end
  object Querydm: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select COLKDS.REAGENT1, COLKDS.REAGENT2, COLKDS.RESINID,'
      '  COLKDS.ELEMENT, COLKDS.VALENCE,'
      '  COLKDS.MOLARITY1, COLKDS.MOLARITY2, COLKDS.KD,'
      '  RESINS.RESINNAME, RESINS.RESIN, RESINS.XLINK,'
      '  REAGENTS.REAGENTNAME, IONS.IONID'
      'from COLKDS, RESINS, REAGENTS, IONS, ELEMENTS'
      'where COLKDS.RESINID=RESINS.RESINID'
      'and COLKDS.REAGENT1=REAGENTS.REAGENTID'
      'and COLKDS.ELEMENT=IONS.ELEMENT'
      'and COLKDS.VALENCE=IONS.VALENCE'
      'and ELEMENTS.ELEMENT=IONS.ELEMENT')
    SQLConnection = sqlcResinDB
    Left = 240
    Top = 152
    object QuerydmREAGENT1: TStringField
      FieldName = 'REAGENT1'
      Required = True
      Size = 10
    end
    object QuerydmREAGENT2: TStringField
      FieldName = 'REAGENT2'
      Required = True
      Size = 10
    end
    object QuerydmRESINID: TStringField
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object QuerydmELEMENT: TStringField
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object QuerydmVALENCE: TSmallintField
      FieldName = 'VALENCE'
      Required = True
    end
    object QuerydmMOLARITY1: TFloatField
      FieldName = 'MOLARITY1'
      Required = True
    end
    object QuerydmMOLARITY2: TFloatField
      FieldName = 'MOLARITY2'
      Required = True
    end
    object QuerydmKD: TFloatField
      FieldName = 'KD'
    end
    object QuerydmRESINNAME: TStringField
      FieldName = 'RESINNAME'
    end
    object QuerydmRESIN: TStringField
      FieldName = 'RESIN'
      Size = 10
    end
    object QuerydmXLINK: TStringField
      FieldName = 'XLINK'
      FixedChar = True
      Size = 2
    end
    object QuerydmREAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
    end
    object QuerydmIONID: TStringField
      FieldName = 'IONID'
      Size = 3
    end
  end
  object dspQuerydm: TDataSetProvider
    DataSet = Querydm
    Left = 266
    Top = 152
  end
  object cdsQuerydm: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQuerydm'
    Left = 294
    Top = 152
    object cdsQuerydmREAGENT1: TStringField
      FieldName = 'REAGENT1'
      Required = True
      Size = 10
    end
    object cdsQuerydmREAGENT2: TStringField
      FieldName = 'REAGENT2'
      Required = True
      Size = 10
    end
    object cdsQuerydmRESINID: TStringField
      FieldName = 'RESINID'
      Required = True
      Size = 10
    end
    object cdsQuerydmELEMENT: TStringField
      FieldName = 'ELEMENT'
      Required = True
      Size = 2
    end
    object cdsQuerydmVALENCE: TSmallintField
      FieldName = 'VALENCE'
      Required = True
    end
    object cdsQuerydmMOLARITY1: TFloatField
      FieldName = 'MOLARITY1'
      Required = True
    end
    object cdsQuerydmMOLARITY2: TFloatField
      FieldName = 'MOLARITY2'
      Required = True
    end
    object cdsQuerydmKD: TFloatField
      FieldName = 'KD'
    end
    object cdsQuerydmRESINNAME: TStringField
      FieldName = 'RESINNAME'
    end
    object cdsQuerydmRESIN: TStringField
      FieldName = 'RESIN'
      Size = 10
    end
    object cdsQuerydmXLINK: TStringField
      FieldName = 'XLINK'
      FixedChar = True
      Size = 2
    end
    object cdsQuerydmREAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
    end
    object cdsQuerydmIONID: TStringField
      FieldName = 'IONID'
      Size = 3
    end
  end
  object dsQuerydm: TDataSource
    DataSet = cdsQuerydm
    Left = 322
    Top = 152
  end
  object SQLMonitor1: TSQLMonitor
    SQLConnection = sqlcResinDB
    Left = 88
    Top = 16
  end
end
