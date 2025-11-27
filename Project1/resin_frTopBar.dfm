object ISFTopBar: TISFTopBar
  Left = 0
  Top = 0
  Width = 792
  Height = 69
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
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
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 792
    Height = 69
    HorzScrollBar.Visible = False
    VertScrollBar.Visible = False
    RenderInvisibleControls = True
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    ZIndex = -1
    DesignSize = (
      792
      69)
    object rectBlackTop: TIWRectangle
      Left = 1
      Top = 47
      Width = 134
      Height = 22
      Font.Color = clWebBLACK
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      BorderOptions.Width = 0
      FriendlyName = 'rectBlackTop'
      Color = clWebKHAKI
      Alignment = taLeftJustify
      VAlign = vaMiddle
    end
    object rectRedTop: TIWRectangle
      Left = 133
      Top = 47
      Width = 659
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Font.Color = clWebBLACK
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      BorderOptions.Width = 0
      FriendlyName = 'rectRedTop'
      Color = clWebLIGHTGOLDENRODYELLOW
      Alignment = taLeftJustify
      VAlign = vaBottom
    end
    object lnkSignIn: TIWLink
      Left = 532
      Top = 16
      Width = 53
      Height = 17
      RenderSize = False
      StyleRenderOptions.RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clWebBLUE
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      HasTabOrder = True
      DoSubmitValidation = False
      FriendlyName = 'lnkSignIn'
      OnClick = SignIn
      TabOrder = 0
      RawText = False
      Caption = 'Log In'
    end
    object IWRectangleTitle: TIWRectangle
      Left = 1
      Top = 4
      Width = 517
      Height = 39
      Text = '  Ion exchange resin database'
      Font.Color = clWebDIMGRAY
      Font.FontName = 'Arial'
      Font.Size = 16
      Font.Style = [fsBold]
      BorderOptions.Width = 0
      FriendlyName = 'IWRectangleTitle'
      Color = clWebLIGHTGOLDENRODYELLOW
      Alignment = taLeftJustify
      VAlign = vaMiddle
    end
    object lblWelcome: TIWLabel
      Left = 146
      Top = 50
      Width = 4
      Height = 16
      Font.Color = clWebGOLDENROD
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = [fsBold]
      HasTabOrder = False
      FriendlyName = 'lblWelcome'
      Caption = ' '
    end
    object iwlSignOut: TIWLink
      Left = 608
      Top = 16
      Width = 53
      Height = 17
      RenderSize = False
      StyleRenderOptions.RenderSize = False
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clWebBLUE
      Font.FontName = 'Arial'
      Font.Size = 10
      Font.Style = []
      HasTabOrder = True
      DoSubmitValidation = False
      FriendlyName = 'iwlSignOut'
      OnClick = iwlSignOutClick
      TabOrder = 1
      RawText = False
      Caption = 'Log Out'
    end
  end
end
