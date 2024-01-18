object WebDataModule1: TWebDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 372
  Width = 536
  object IBResin: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Data\Resin\RESIN.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 32
    Top = 12
  end
  object Elements: TIBQuery
    Database = IBResin
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from ELEMENTS')
    Left = 216
    Top = 20
    object ElementsELEMENT: TIBStringField
      FieldName = 'ELEMENT'
      Origin = 'ELEMENTS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBResin
    AutoStopAction = saNone
    Left = 120
    Top = 16
  end
  object Reagents: TIBQuery
    Database = IBResin
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from REAGENTS')
    Left = 220
    Top = 80
    object ReagentsREAGENTID: TIBStringField
      FieldName = 'REAGENTID'
      Origin = 'REAGENTS.REAGENTID'
      Required = True
      Size = 10
    end
    object ReagentsREAGENTNAME: TIBStringField
      FieldName = 'REAGENTNAME'
      Origin = 'REAGENTS.REAGENTNAME'
    end
  end
  object Resins: TIBQuery
    Database = IBResin
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select *  from RESINS')
    Left = 216
    Top = 136
    object ResinsRESINID: TIBStringField
      FieldName = 'RESINID'
      Origin = 'RESINS.RESINID'
      Required = True
      Size = 10
    end
    object ResinsRESINNAME: TIBStringField
      FieldName = 'RESINNAME'
      Origin = 'RESINS.RESINNAME'
    end
    object ResinsRESIN: TIBStringField
      FieldName = 'RESIN'
      Origin = 'RESINS.RESIN'
      Size = 10
    end
    object ResinsXLINK: TIBStringField
      FieldName = 'XLINK'
      Origin = 'RESINS.XLINK'
      FixedChar = True
      Size = 2
    end
  end
  object Ions: TIBQuery
    Database = IBResin
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsElements
    SQL.Strings = (
      'select *  from IONS'
      'where Element = :Element')
    Left = 220
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Element'
        ParamType = ptUnknown
      end>
    object IonsELEMENT: TIBStringField
      FieldName = 'ELEMENT'
      Origin = 'IONS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object IonsVALENCE: TIBStringField
      FieldName = 'VALENCE'
      Origin = 'IONS.VALENCE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object ColKDs: TIBQuery
    Database = IBResin
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsReagents
    SQL.Strings = (
      'select *  from COLKDS'
      'where Reagent1 = :ReagentID')
    Left = 220
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'REAGENTID'
        ParamType = ptUnknown
        Size = 11
      end>
    object ColKDsREAGENT1: TIBStringField
      FieldName = 'REAGENT1'
      Origin = 'COLKDS.REAGENT1'
      Required = True
      Size = 10
    end
    object ColKDsREAGENT2: TIBStringField
      FieldName = 'REAGENT2'
      Origin = 'COLKDS.REAGENT2'
      Required = True
      Size = 10
    end
    object ColKDsRESINID: TIBStringField
      FieldName = 'RESINID'
      Origin = 'COLKDS.RESINID'
      Required = True
      Size = 10
    end
    object ColKDsELEMENT: TIBStringField
      FieldName = 'ELEMENT'
      Origin = 'COLKDS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object ColKDsVALENCE: TIBStringField
      FieldName = 'VALENCE'
      Origin = 'COLKDS.VALENCE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object ColKDsMOLARITY1: TFloatField
      FieldName = 'MOLARITY1'
      Origin = 'COLKDS.MOLARITY1'
      Required = True
    end
    object ColKDsMOLARITY2: TFloatField
      FieldName = 'MOLARITY2'
      Origin = 'COLKDS.MOLARITY2'
      Required = True
    end
    object ColKDsKD: TFloatField
      FieldName = 'KD'
      Origin = 'COLKDS.KD'
    end
    object ColKDsRESINLOADINGMEQ: TFloatField
      FieldName = 'RESINLOADINGMEQ'
      Origin = 'COLKDS.RESINLOADINGMEQ'
    end
    object ColKDsCOMMENT: TMemoField
      FieldName = 'COMMENT'
      Origin = 'COLKDS.COMMENT'
      BlobType = ftMemo
      Size = 8
    end
    object ColKDsREFERENCE: TMemoField
      FieldName = 'REFERENCE'
      Origin = 'COLKDS.REFERENCE'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsReagents: TDataSource
    DataSet = Reagents
    Left = 288
    Top = 84
  end
  object dsElements: TDataSource
    DataSet = Elements
    Left = 288
    Top = 20
  end
  object dspElements: TDataSetProvider
    DataSet = Elements
    Constraints = True
    Left = 360
    Top = 24
  end
  object dspReagents: TDataSetProvider
    DataSet = Reagents
    Constraints = True
    Left = 364
    Top = 84
  end
  object dspResins: TDataSetProvider
    DataSet = Resins
    Constraints = True
    Left = 364
    Top = 140
  end
  object dspIons: TDataSetProvider
    DataSet = Ions
    Constraints = True
    Left = 376
    Top = 192
  end
  object dspColKDs: TDataSetProvider
    DataSet = ColKDs
    Constraints = True
    Left = 380
    Top = 244
  end
  object cdsElements: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspElements'
    Left = 428
    Top = 24
    object cdsElementsELEMENT: TStringField
      FieldName = 'ELEMENT'
      Origin = 'ELEMENTS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object cdsReagents: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReagents'
    Left = 440
    Top = 80
    object cdsReagentsREAGENTID: TStringField
      FieldName = 'REAGENTID'
      Origin = 'REAGENTS.REAGENTID'
      Required = True
      Size = 10
    end
    object cdsReagentsREAGENTNAME: TStringField
      FieldName = 'REAGENTNAME'
      Origin = 'REAGENTS.REAGENTNAME'
    end
  end
  object cdsResins: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspResins'
    Left = 444
    Top = 144
    object cdsResinsRESINID: TStringField
      FieldName = 'RESINID'
      Origin = 'RESINS.RESINID'
      Required = True
      Size = 10
    end
    object cdsResinsRESINNAME: TStringField
      FieldName = 'RESINNAME'
      Origin = 'RESINS.RESINNAME'
    end
    object cdsResinsRESIN: TStringField
      FieldName = 'RESIN'
      Origin = 'RESINS.RESIN'
      Size = 10
    end
    object cdsResinsXLINK: TStringField
      FieldName = 'XLINK'
      Origin = 'RESINS.XLINK'
      FixedChar = True
      Size = 2
    end
  end
  object cdsIons: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIons'
    Left = 444
    Top = 192
    object cdsIonsELEMENT: TStringField
      FieldName = 'ELEMENT'
      Origin = 'IONS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsIonsVALENCE: TStringField
      FieldName = 'VALENCE'
      Origin = 'IONS.VALENCE'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsColKDs: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspcolKDs'
    Left = 444
    Top = 244
    object cdsColKDsREAGENT1: TStringField
      FieldName = 'REAGENT1'
      Origin = 'COLKDS.REAGENT1'
      Required = True
      Size = 10
    end
    object cdsColKDsREAGENT2: TStringField
      FieldName = 'REAGENT2'
      Origin = 'COLKDS.REAGENT2'
      Required = True
      Size = 10
    end
    object cdsColKDsRESINID: TStringField
      FieldName = 'RESINID'
      Origin = 'COLKDS.RESINID'
      Required = True
      Size = 10
    end
    object cdsColKDsELEMENT: TStringField
      FieldName = 'ELEMENT'
      Origin = 'COLKDS.ELEMENT'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsColKDsVALENCE: TStringField
      FieldName = 'VALENCE'
      Origin = 'COLKDS.VALENCE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsColKDsMOLARITY1: TFloatField
      FieldName = 'MOLARITY1'
      Origin = 'COLKDS.MOLARITY1'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsColKDsMOLARITY2: TFloatField
      FieldName = 'MOLARITY2'
      Origin = 'COLKDS.MOLARITY2'
      Required = True
      DisplayFormat = '#0.00'
    end
    object cdsColKDsKD: TFloatField
      FieldName = 'KD'
      Origin = 'COLKDS.KD'
      DisplayFormat = '#####0.000'
    end
    object cdsColKDsRESINLOADINGMEQ: TFloatField
      FieldName = 'RESINLOADINGMEQ'
      Origin = 'COLKDS.RESINLOADINGMEQ'
      DisplayFormat = '##0.00'
    end
    object cdsColKDsCOMMENT: TMemoField
      FieldName = 'COMMENT'
      Origin = 'COLKDS.COMMENT'
      BlobType = ftMemo
      Size = 8
    end
    object cdsColKDsREFERENCE: TMemoField
      FieldName = 'REFERENCE'
      Origin = 'COLKDS.REFERENCE'
      BlobType = ftMemo
      Size = 8
    end
  end
  object dsIons: TDataSource
    DataSet = Ions
    Left = 296
    Top = 196
  end
end
