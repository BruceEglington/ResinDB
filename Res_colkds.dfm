object ColKd: TColKd
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 254
  Top = 107
  Height = 322
  Width = 298
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      object AdapterFieldGroupElements: TAdapterFieldGroup
        Adapter = dsaElements
        AdapterMode = 'Browse'
        object FldELEMENT: TAdapterDisplayField
          DisplayWidth = 2
          FieldName = 'ELEMENT'
        end
      end
      object AdapterFieldGroupIons: TAdapterFieldGroup
        Adapter = dsaIons
        AdapterMode = 'Browse'
        object FldELEMENT2: TAdapterDisplayField
          DisplayWidth = 2
          FieldName = 'ELEMENT'
        end
        object FldVALENCE: TAdapterDisplayField
          DisplayWidth = 1
          FieldName = 'VALENCE'
        end
      end
      object AdapterFieldGroupReagents: TAdapterFieldGroup
        Adapter = dsaReagents
        AdapterMode = 'Browse'
        object FldREAGENTNAME: TAdapterDisplayField
          DisplayWidth = 20
          FieldName = 'REAGENTNAME'
        end
      end
      object AdapterGrid1: TAdapterGrid
        Adapter = dsaColKds
        AdapterMode = 'Browse'
        object ColREAGENT1: TAdapterDisplayColumn
          FieldName = 'REAGENT1'
        end
        object ColREAGENT2: TAdapterDisplayColumn
          FieldName = 'REAGENT2'
        end
        object ColRESINID: TAdapterDisplayColumn
          FieldName = 'RESINID'
        end
        object ColELEMENT: TAdapterDisplayColumn
          FieldName = 'ELEMENT'
        end
        object ColVALENCE: TAdapterDisplayColumn
          FieldName = 'VALENCE'
        end
        object ColMOLARITY1: TAdapterDisplayColumn
          FieldName = 'MOLARITY1'
        end
        object ColMOLARITY2: TAdapterDisplayColumn
          FieldName = 'MOLARITY2'
        end
        object ColKD: TAdapterDisplayColumn
          FieldName = 'KD'
        end
      end
    end
  end
  object dsaElements: TDataSetAdapter
    DataSet = WebDataModule1.cdsElements
    Left = 152
    Top = 12
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptELEMENT2: TDataSetAdapterField
        DataSetField = 'ELEMENT'
        FieldFlags = [ffInKey, ffInOrigValues]
      end
    end
  end
  object dsaIons: TDataSetAdapter
    DataSet = WebDataModule1.cdsIons
    MasterAdapter = dsaElements
    Left = 156
    Top = 68
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptELEMENT3: TDataSetAdapterField
        DataSetField = 'ELEMENT'
        FieldFlags = [ffInKey, ffInOrigValues]
      end
      object AdaptVALENCE2: TDataSetAdapterField
        DataSetField = 'VALENCE'
      end
    end
  end
  object dsaColKds: TDataSetAdapter
    DataSet = WebDataModule1.cdsColKDs
    PageSize = 10
    MasterAdapter = dsaReagents
    Left = 156
    Top = 172
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptREAGENT1: TDataSetAdapterField
        DataSetField = 'REAGENT1'
        FieldFlags = [ffInKey, ffInOrigValues]
      end
      object AdaptREAGENT2: TDataSetAdapterField
        DataSetField = 'REAGENT2'
      end
      object AdaptRESINID: TDataSetAdapterField
        DataSetField = 'RESINID'
      end
      object AdaptELEMENT: TDataSetAdapterField
        DataSetField = 'ELEMENT'
      end
      object AdaptVALENCE: TDataSetAdapterField
        DataSetField = 'VALENCE'
      end
      object AdaptMOLARITY1: TDataSetAdapterField
        DataSetField = 'MOLARITY1'
      end
      object AdaptMOLARITY2: TDataSetAdapterField
        DataSetField = 'MOLARITY2'
      end
      object AdaptKD: TDataSetAdapterField
        DataSetField = 'KD'
      end
      object AdaptRESINLOADINGMEQ: TDataSetAdapterField
        DataSetField = 'RESINLOADINGMEQ'
      end
      object AdaptCOMMENT: TDataSetAdapterMemoField
        DataSetField = 'COMMENT'
      end
      object AdaptREFERENCE: TDataSetAdapterMemoField
        DataSetField = 'REFERENCE'
      end
    end
  end
  object dsaReagents: TDataSetAdapter
    DataSet = WebDataModule1.cdsReagents
    Left = 156
    Top = 116
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptREAGENTID: TDataSetAdapterField
        DataSetField = 'REAGENTID'
        FieldFlags = [ffInKey, ffInOrigValues]
      end
      object AdaptREAGENTNAME: TDataSetAdapterField
        DataSetField = 'REAGENTNAME'
      end
    end
  end
end
