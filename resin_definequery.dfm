object ISFDefineQuery: TISFDefineQuery
  Left = 0
  Top = 0
  Width = 849
  Height = 486
  VertScrollBar.Position = 33
  ConnectionMode = cmAny
  Title = 'Define query'
  SupportedBrowsers = [brIE, brOpera, brNetscape6]
  OnCreate = IWAppFormCreate
  OnRender = IWAppFormRender
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  UpdateMode = umAll
  DesignLeft = 113
  DesignTop = 114
  object iwcbContinents: TIWCheckBox
    Left = 162
    Top = 73
    Width = 231
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Continents'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 0
    Checked = False
    FriendlyName = 'iwcbContinents'
  end
  object iwbNextStageOfQuery: TIWButton
    Left = 186
    Top = 461
    Width = 293
    Height = 25
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    Caption = 'Proceed to next stage of query definition'
    DoSubmitValidation = True
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbNextStageOfQuery'
    ScriptEvents = <>
    TabOrder = 1
    OnClick = iwbNextStageOfQueryClick
  end
  object iwlContinents: TIWListbox
    Left = 164
    Top = 95
    Width = 349
    Height = 147
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 2
    FriendlyName = 'iwlContinents'
    ItemIndex = -1
    Items.Strings = (
      'one=1'
      'two=2'
      'three=3'
      'four=4')
    MultiSelect = True
    Sorted = False
  end
  object iwcbAreas: TIWCheckBox
    Left = 162
    Top = 259
    Width = 231
    Height = 21
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    Caption = 'Include selection from Areas'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = [fsBold]
    ScriptEvents = <>
    DoSubmitValidation = True
    Style = stNormal
    TabOrder = 3
    Checked = False
    FriendlyName = 'iwcbAreas'
  end
  object iwlAreas: TIWListbox
    Left = 164
    Top = 281
    Width = 347
    Height = 145
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    FocusColor = clNone
    AutoHideOnMenuActivation = False
    ItemsHaveValues = False
    NoSelectionText = '-- No Selection --'
    Required = False
    RequireSelection = False
    ScriptEvents = <>
    UseSize = False
    DoSubmitValidation = True
    Editable = True
    TabOrder = 4
    FriendlyName = 'iwlAreas'
    ItemIndex = -1
    Items.Strings = (
      'one=1'
      'two=2'
      'three=3'
      'four=4')
    MultiSelect = True
    Sorted = False
  end
  object IWText1: TIWText
    Left = 542
    Top = 53
    Width = 295
    Height = 161
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = False
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Select the Continents and Areas from which '
      'you wish to obtain data. Note that the values '
      'selected here will influence subsequent lists '
      'used to furher refine search conditions and '
      'will also influence the final query.'
      ''
      'Multiple Continents and Areas may be selected. '
      ''
      'A more restricted range in data will improve '
      'performance and provide faster response times '
      'to your queries.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 36
    Width = 83
    Height = 450
    Cursor = crAuto
    Align = alLeft
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1
    RenderSize = True
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Color = clNone
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLAVENDER
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = -33
    Width = 849
    Height = 69
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    Align = alTop
    Constraints.MaxHeight = 69
    Constraints.MinHeight = 69
    Constraints.MinWidth = 600
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    inherited IWFrameRegion: TIWRegion
      Width = 849
      DesignSize = (
        849
        69)
      inherited rectRedTop: TIWRectangle
        Width = 704
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 513
        Text = '    DateView International Geochronology Database'
      end
    end
  end
end
