object ISFDefineQuery2: TISFDefineQuery2
  Left = 0
  Top = 0
  Width = 775
  Height = 708
  VertScrollBar.Position = 24
  RenderInvisibleControls = True
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'Define query'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignSize = (
    775
    708)
  DesignLeft = 2
  DesignTop = 2
  object iwbSubmitQuery: TIWButton
    Left = 210
    Top = 74
    Width = 125
    Height = 25
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 1
    OnClick = iwbSubmitQueryClick
  end
  object iwcbResins: TIWCheckBox
    Left = 106
    Top = 130
    Width = 205
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Resins'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 2
    Checked = False
    FriendlyName = 'iwcbResins'
  end
  object iwlResins: TIWListbox
    Left = 108
    Top = 152
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 3
    FriendlyName = 'iwlResins'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbIons: TIWCheckBox
    Left = 106
    Top = 448
    Width = 187
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Ions'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 4
    Checked = False
    FriendlyName = 'iwcbIons'
  end
  object iwlIons: TIWListbox
    Left = 108
    Top = 470
    Width = 229
    Height = 238
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 5
    FriendlyName = 'iwlIons'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbReagent1: TIWCheckBox
    Left = 106
    Top = 286
    Width = 221
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Reagent 1'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 7
    Checked = False
    FriendlyName = 'iwcbReagent1'
  end
  object iwlReagent1: TIWListbox
    Left = 108
    Top = 308
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 8
    FriendlyName = 'iwlReagent1'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object iwcbReagent2: TIWCheckBox
    Left = 384
    Top = 286
    Width = 225
    Height = 21
    Cursor = crAuto
    Caption = 'Include selection from Reagent 2'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = [fsBold]
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 9
    Checked = False
    FriendlyName = 'iwcbReagent2'
  end
  object iwlReagent2: TIWListbox
    Left = 386
    Top = 308
    Width = 229
    Height = 121
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    RequireSelection = False
    TabOrder = 10
    FriendlyName = 'iwlReagent2'
    Items.Strings = (
      'four=4'
      'one=1'
      'three=3'
      'two=2')
    Sorted = True
    MultiSelect = True
    NoSelectionText = '-- No Selection --'
  end
  object IWText1: TIWText
    Left = 439
    Top = 56
    Width = 295
    Height = 161
    BGColor = clNone
    ConvertSpaces = True
    Font.Color = clWebDARKSLATEGRAY
    Font.FontName = 'Arial'
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWText1'
    Lines.Strings = (
      'Select parameters which define the records '
      'you require. '
      ''
      'Multiple selections may be made in most list '
      'boxes. '
      ''
      'A more restricted range in data will improve '
      'performance and provide faster response '
      'times to your queries.')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  object rectLeft: TIWRectangle
    Left = 0
    Top = 45
    Width = 83
    Height = 663
    Align = alLeft
    ZIndex = 1
    Font.Color = clWebBLACK
    Font.Size = 10
    Font.Style = []
    BorderOptions.Width = 0
    FriendlyName = 'rectLeft'
    Color = clWebLIGHTGOLDENRODYELLOW
    Alignment = taLeftJustify
    VAlign = vaMiddle
  end
  object IWButton1: TIWButton
    Left = 464
    Top = 612
    Width = 125
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Submit Query'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'iwbSubmitQuery'
    TabOrder = 0
    OnClick = iwbSubmitQueryClick
  end
  inline TopBar: TISFTopBar
    Left = 0
    Top = -24
    Width = 775
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
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -24
    ExplicitWidth = 775
    inherited IWFrameRegion: TIWRegion
      Width = 775
      TabOrder = 6
      ExplicitWidth = 775
      DesignSize = (
        775
        69)
      inherited rectRedTop: TIWRectangle
        Width = 625
        ExplicitWidth = 625
      end
      inherited lnkSignIn: TIWLink
        Left = 599
        ExplicitLeft = 599
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 513
        ExplicitWidth = 513
      end
      inherited iwlSignOut: TIWLink
        Left = 678
        ExplicitLeft = 678
      end
    end
  end
end
