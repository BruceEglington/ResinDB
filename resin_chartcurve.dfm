object IWChartKD: TIWChartKD
  Left = 0
  Top = 0
  Width = 770
  Height = 586
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Title = 'ResinDB'
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = False
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object iwbChangeAxisScales: TIWButton
    Left = 370
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Change'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbChangeAxisScales'
    TabOrder = 4
    OnClick = iwbChangeAxisScalesClick
  end
  object iwbClose: TIWButton
    Left = 8
    Top = 6
    Width = 75
    Height = 21
    Caption = 'Close'
    Color = clWebLIGHTGREEN
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbClose'
    TabOrder = 9
    OnClick = iwbCloseClick
  end
  object iwbExportGraphValues: TIWButton
    Left = 8
    Top = 28
    Width = 75
    Height = 21
    Caption = 'Export'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iwbExportGraphValues'
    TabOrder = 8
    OnClick = iwbExportGraphValuesClick
  end
  object iwcbAutomaticScaling: TIWCheckBox
    Left = 370
    Top = 28
    Width = 145
    Height = 21
    Cursor = crAuto
    Caption = 'Automatic scale'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 5
    OnClick = iwcbAutomaticScalingClick
    Checked = True
    FriendlyName = 'iwcbAutomaticScaling'
  end
  object IWCheckBox3: TIWCheckBox
    Left = 590
    Top = 6
    Width = 145
    Height = 21
    Cursor = crAuto
    Caption = 'Show Legend'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 6
    OnClick = IWCheckBox3Click
    Checked = True
    FriendlyName = 'IWCheckBox1'
  end
  object IWCheckBox4: TIWCheckBox
    Left = 590
    Top = 26
    Width = 145
    Height = 21
    Cursor = crAuto
    Caption = 'Show background'
    Editable = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    SubmitOnAsyncEvent = True
    Style = stNormal
    TabOrder = 7
    OnClick = IWCheckBox4Click
    Checked = True
    FriendlyName = 'IWCheckBox1'
  end
  object iweXMaximum: TIWEdit
    Left = 284
    Top = 28
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit2'
    SubmitOnAsyncEvent = True
    TabOrder = 3
  end
  object iweXMinimum: TIWEdit
    Left = 170
    Top = 28
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweXMinimum'
    SubmitOnAsyncEvent = True
    TabOrder = 2
  end
  object iweYMaximum: TIWEdit
    Left = 284
    Top = 4
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object iweYMinimum: TIWEdit
    Left = 170
    Top = 4
    Width = 69
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    FriendlyName = 'iweYMinimum'
    SubmitOnAsyncEvent = True
  end
  object IWLabel3: TIWLabel
    Left = 104
    Top = 8
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'Y axis min.'
  end
  object IWLabel4: TIWLabel
    Left = 104
    Top = 32
    Width = 64
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'X axis min.'
  end
  object IWLabel5: TIWLabel
    Left = 250
    Top = 8
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel3'
    Caption = 'max.'
  end
  object IWLabel6: TIWLabel
    Left = 250
    Top = 32
    Width = 28
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel4'
    Caption = 'max.'
  end
  object IWChart1: TIWChart
    Left = 7
    Top = 60
    Width = 750
    Height = 497
    BorderOptions.Width = 0
    UseSize = True
    Chart = Chart1
  end
  object IWLabel1: TIWLabel
    Left = 8
    Top = 565
    Width = 199
    Height = 15
    Font.Color = clNone
    Font.FontName = 'Arial'
    Font.Size = 9
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'ResinDB ion exchange database'
  end
  object Chart1: TChart
    Left = 7
    Top = 60
    Width = 748
    Height = 497
    Foot.Alignment = taLeftJustify
    Foot.Font.Color = clGray
    Foot.Font.Style = [fsBold]
    Foot.Text.Strings = (
      '     Saskatchewan Isotope Laboratory'
      '(c) Dr Bruce Eglington (2004-2022)')
    Gradient.EndColor = 12615680
    Gradient.MidColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    Legend.Brush.Gradient.Visible = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Font.Height = -15
    Legend.Font.Style = [fsBold]
    Legend.Font.Shadow.Color = clWhite
    Legend.Font.Shadow.HorizSize = 1
    Legend.Font.Shadow.VertSize = 1
    Legend.LegendStyle = lsSeries
    SubFoot.Alignment = taRightJustify
    SubFoot.CustomPosition = True
    SubFoot.Font.Color = clGray
    SubFoot.Font.Style = [fsBold, fsItalic]
    SubFoot.Left = 414
    SubFoot.Text.Strings = (
      'Saskatchewan Isotope Laboratory')
    SubFoot.Top = 450
    SubFoot.Visible = False
    Title.Brush.Gradient.Direction = gdLeftRight
    Title.Brush.Gradient.EndColor = clGray
    Title.Brush.Gradient.Visible = True
    Title.Font.Height = -21
    Title.Text.Strings = (
      'TChart')
    BottomAxis.LabelsMultiLine = True
    BottomAxis.Title.Caption = 'Molarity'
    BottomAxis.Title.Font.Height = -12
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.Logarithmic = True
    LeftAxis.Title.Caption = 'K (D)'
    LeftAxis.Title.Font.Height = -12
    LeftAxis.Title.Font.Style = [fsBold]
    View3D = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      27
      15
      27)
    ColorPaletteIndex = 0
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      Brush.BackColor = clDefault
      LinePen.Color = clRed
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        011900000000000000000000000000000000005940000000000000F83F000000
        0000C06240000000000000004000000000000069400000000000000440000000
        0000406F4000000000000008400000000000C072400000000000000C40000000
        0000406F40000000000000104000000000000069400000000000001C40000000
        0000C06240000000000000204000000000000059400000000000002240000000
        0000004940000000000000244000000000000058400000000000002640000000
        000080604000000000000028400000000000E06B400000000000002A40000000
        0000E064400000000000002C400000000000E06B400000000000002E40000000
        0000A07040000000000000304000000000000075400000000000003140000000
        0000E0744000000000000032400000000000B07B400000000000003340000000
        0000888040000000000000344000000000007082400000000000003540000000
        0000D88240000000000000364000000000005085400000000000003740000000
        0000C8884000000000000038400000000000188940}
    end
    object Series3: TLineSeries
      HoverElement = [heCurrent]
      SeriesColor = clBlue
      Title = 'Series2'
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDiamond
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000707F400000000000A079400000000000407840000000
        000070784000000000004075400000000000D07A400000000000A07540000000
        00001075400000000000D071400000000000006A400000000000E06840000000
        0000E069400000000000806B4000000000002061400000000000805440000000
        000000204000000000000054400000000000002A400000000000405340000000
        0000A0604000000000000053400000000000805B400000000000C05240000000
        000000F03F0000000000002640}
    end
    object Series2: TLineSeries
      HoverElement = [heCurrent]
      Title = 'Series3'
      Brush.BackColor = clDefault
      LinePen.Color = clGreen
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psTriangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000C06F4000000000000075400000000000707840000000
        0000C077400000000000C075400000000000507B400000000000007E40000000
        0000707F40000000000040794000000000007079400000000000707440000000
        0000F07640000000000000714000000000003077400000000000F07840000000
        00006077400000000000B07A4000000000008075400000000000A06E40000000
        00006070400000000000F0744000000000002074400000000000B07240000000
        00006075400000000000607040}
    end
    object Series4: TLineSeries
      HoverElement = [heCurrent]
      Brush.BackColor = clDefault
      LinePen.Color = clYellow
      LinePen.Width = 3
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        0019000000000000000048884000000000008888400000000000488B40000000
        0000188D400000000000788C400000000000B889400000000000808A40000000
        0000B089400000000000C0894000000000000888400000000000C08640000000
        0000708840000000000058854000000000003084400000000000988140000000
        0000907F400000000000507C400000000000A076400000000000807240000000
        0000206F4000000000002070400000000000C063400000000000406D40000000
        00006067400000000000A06940}
    end
    object Series5: TLineSeries
      HoverElement = [heCurrent]
      SeriesColor = clFuchsia
      Brush.BackColor = clDefault
      LinePen.Color = clFuchsia
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psDownTriangle
      Pointer.VertSize = 3
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000D07F4000000000004881400000000000008240000000
        00005880400000000000E080400000000000407C400000000000F07C40000000
        0000507B400000000000D074400000000000C06F400000000000C07040000000
        0000607540000000000080754000000000006073400000000000E06A40000000
        0000206440000000000080614000000000008063400000000000406B40000000
        0000C0594000000000000056400000000000005B400000000000004740000000
        00008056400000000000003340}
    end
  end
end
