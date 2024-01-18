object ISFMain: TISFMain
  Left = 0
  Top = 0
  Width = 855
  Height = 549
  RenderInvisibleControls = True
  OnRender = IWAppFormRender
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'User Control'
  OnCreate = IWAppFormCreate
  OnDestroy = IWAppFormDestroy
  Background.Filename = 
    'W:\source\IntraWeb6.0\Demos\Win32\Delphi\DieFlyDie\Files\grid_ba' +
    'ckground.gif'
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  StyleSheet.Filename = 'styles.css'
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  inline TopBar: TISFTopBar
    Left = 0
    Top = 0
    Width = 855
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
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 855
    inherited IWFrameRegion: TIWRegion
      Width = 855
      TabOrder = 2
      ExplicitWidth = 855
      DesignSize = (
        855
        69)
      inherited rectRedTop: TIWRectangle
        Width = 722
        ExplicitWidth = 722
      end
      inherited lnkSignIn: TIWLink
        Left = 540
        Font.Size = 9
        ExplicitLeft = 540
      end
      inherited IWRectangleTitle: TIWRectangle
        Width = 513
        ExplicitWidth = 513
      end
      inherited lblWelcome: TIWLabel
        Left = 152
        Width = 3
        Height = 15
        Font.Size = 9
        ExplicitLeft = 152
        ExplicitWidth = 3
        ExplicitHeight = 15
      end
      inherited iwlSignOut: TIWLink
        Font.Size = 9
      end
    end
  end
  object IWRegion1: TIWRegion
    Left = 142
    Top = 69
    Width = 713
    Height = 480
    RenderInvisibleControls = True
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    ZIndex = -1
    object IWDBMemo1: TIWDBMemo
      Left = 10
      Top = 61
      Width = 679
      Height = 320
      StyleRenderOptions.RenderBorder = False
      BGColor = clWebWHITE
      Editable = True
      Font.Color = clNone
      Font.FontName = 'Arial'
      Font.Size = 9
      Font.Style = []
      InvisibleBorder = False
      HorizScrollBar = False
      VertScrollBar = True
      Required = False
      TabOrder = 1
      SubmitOnAsyncEvent = True
      AutoEditable = False
      DataField = 'PROGRESSDETAILS'
      DataSource = dmUser.dsProgress
      FriendlyName = 'IWDBMemo1'
    end
    object IWRegion2: TIWRegion
      Left = 0
      Top = 0
      Width = 713
      Height = 60
      RenderInvisibleControls = True
      TabOrder = 0
      Align = alTop
      BorderOptions.NumericWidth = 0
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      ZIndex = -1
      object lblWelcome: TIWLabel
        Left = 12
        Top = 26
        Width = 211
        Height = 22
        ZIndex = 1
        Font.Color = clWebDARKGOLDENROD
        Font.FontName = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        HasTabOrder = False
        FriendlyName = 'lblWelcome'
        Caption = 'Welcome to ResinDB'
      end
    end
    object IWRegion3: TIWRegion
      Left = 0
      Top = 399
      Width = 713
      Height = 81
      RenderInvisibleControls = True
      TabOrder = 0
      Align = alBottom
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      ZIndex = -1
      object IWLabel3: TIWLabel
        Left = 8
        Top = 34
        Width = 141
        Height = 14
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel3'
        Caption = 'bruce.eglington@usask.ca'
      end
      object IWDBLabel1: TIWDBLabel
        Left = 8
        Top = 18
        Width = 108
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        DataField = 'PROGRESSDATE'
        DataSource = dmUser.dsProgress
        FriendlyName = 'IWDBLabel1'
      end
      object IWLabel1: TIWLabel
        Left = 8
        Top = 1
        Width = 113
        Height = 15
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 9
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Dr Bruce Eglington'
      end
      object iwlNumUses: TIWLabel
        Left = 542
        Top = 57
        Width = 141
        Height = 14
        Alignment = taRightJustify
        Font.Color = clNone
        Font.FontName = 'Arial'
        Font.Size = 8
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'iwlNumUses'
        Caption = 'This program has been used '
      end
    end
  end
  inline LeftTree: TISFProductTree
    Left = 0
    Top = 69
    Width = 142
    Height = 480
    Align = alLeft
    Constraints.MaxWidth = 142
    Constraints.MinWidth = 142
    Color = clNone
    ParentColor = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    ExplicitTop = 69
    ExplicitHeight = 480
    inherited IWFrameRegion: TIWRegion
      Height = 480
      ExplicitHeight = 480
      inherited rectRight: TIWRectangle
        Height = 480
        ExplicitHeight = 480
      end
      inherited iwregPageLinks: TIWRegion
        Height = 346
        ExplicitHeight = 346
      end
    end
  end
end
