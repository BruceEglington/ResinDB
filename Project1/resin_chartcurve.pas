unit resin_chartcurve;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, TeEngine, Series,
  Controls, TeeProcs, Chart, IWCompTeeChart,
  IWHTMLControls, IWCompEdit, IWCompListbox, IWCompLabel, IWVCLBaseControl,
  IWBaseControl, IWControl, IWCompCheckbox, Graphics, IWHTMLTag,
  IWCompButton, IWBaseHTMLControl, TeeURL, TeeSeriesTextEd, ErrorBar,
  Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  DBClient, VclTee.TeeGDIPlus, Vcl.ExtCtrls, IWCompExtCtrls;

type
  TIWChartKD = class(TIWAppForm)
    IWChart1: TIWChart;
    Chart1: TChart;
    IWCheckBox3: TIWCheckBox;
    IWCheckBox4: TIWCheckBox;
    IWLabel1: TIWLabel;
    iwbClose: TIWButton;
    iwbExportGraphValues: TIWButton;
    Series1: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iweYMinimum: TIWEdit;
    iweXMinimum: TIWEdit;
    iweXMaximum: TIWEdit;
    iweYMaximum: TIWEdit;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    iwbChangeAxisScales: TIWButton;
    iwcbAutomaticScaling: TIWCheckBox;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWCheckBox3Click(Sender: TObject);
    procedure IWCheckBox4Click(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbChangeAxisScalesClick(Sender: TObject);
    procedure iwcbAutomaticScalingClick(Sender: TObject);
    procedure iwbExportGraphValuesClick(Sender: TObject);
  private
    procedure CreateChart;
    procedure GraphKDByMolarity(GraphType : string);
  public
  end;

implementation

uses IWForm, ServerController, jpeg, resin_constants,
  resin_dm, DB, resin_frGrid;

{$R *.dfm}


procedure TIWChartKD.IWAppFormCreate(Sender: TObject);
begin
  dmR.AllocateMolarityKdData;
  iwbExportGraphValues.Visible := UserSession.CanExportGraphValues;
  CreateChart;
  if ((UserSession.GraphType = gtResinKD)) then
    GraphKDByMolarity(UserSession.GraphType);
end;

procedure TIWChartKD.CreateChart;
begin
  Chart1.Title.Text.Clear;
  Chart1.View3D:=false;
end;

procedure TIWChartKD.IWCheckBox3Click(Sender: TObject);
begin
  Chart1.Legend.Visible:=IWCheckBox3.Checked;
end;

procedure TIWChartKD.IWCheckBox4Click(Sender: TObject);
begin
  Chart1.Gradient.Visible:=IWCheckBox4.Checked;

  if IWCheckBox4.Checked then
     Chart1.BevelOuter:=bvRaised
  else
     Chart1.BevelOuter:=bvNone;

  Chart1.Color:=clWhite;
end;

procedure TIWChartKD.iwbCloseClick(Sender: TObject);
begin
  dmR.cdsTempDataKD.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFGrid.Create(WebApplication).Show;
end;


procedure TIWChartKD.iwbChangeAxisScalesClick(Sender: TObject);
begin
  Chart1.LeftAxis.Automatic := true;
  Chart1.BottomAxis.Automatic := true;
  try
    Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
    Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
    Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
    Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    iwcbAutomaticScaling.Checked := false;
    Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
    Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
    UserSession.StartAtX := StrToFloat(iweXMinimum.Text);
    UserSession.EndAtX := StrToFloat(iweXMaximum.Text);
    UserSession.StartAtY := StrToFloat(iweYMinimum.Text);
    UserSession.EndAtY := StrToFloat(iweYMaximum.Text);
  except
  end;
end;

procedure TIWChartKD.iwcbAutomaticScalingClick(
  Sender: TObject);
begin
  if not iwcbAutomaticScaling.Checked then
  begin
    try
      Chart1.LeftAxis.Minimum := StrToFloat(iweYMinimum.Text);
      Chart1.LeftAxis.Maximum := StrToFloat(iweYMaximum.Text);
      Chart1.BottomAxis.Minimum := StrToFloat(iweXMinimum.Text);
      Chart1.BottomAxis.Maximum := StrToFloat(iweXMaximum.Text);
    except
    end;
  end;
  Chart1.LeftAxis.Automatic := iwcbAutomaticScaling.Checked;
  Chart1.BottomAxis.Automatic := iwcbAutomaticScaling.Checked;
end;

procedure TIWChartKD.GraphKDByMolarity(GraphType : string);
var
  i : integer;
  NumGroupsToUse : integer;
  tmpStr : string;
begin
    dmR.cdsTempDataKD.IndexFieldNames := 'IonID';
    if (UserSession.StartAtX < 0.0) then UserSession.StartAtX := 0.01;
    if (UserSession.EndAtX <= UserSession.StartAtX) then UserSession.EndAtX := UserSession.StartAtX + 1.0;
    {
    UserSession.StartAtX := 100.0*(Trunc(UserSession.StartAtX) div 100);
    UserSession.EndAtX := 100.0*(Trunc(UserSession.EndAtX) div 100 + 1);
    }
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
    dmR.cdsResins.Open;
    tmpStr := dmR.cdsResins.Lookup('RESINID',UserSession.ResinValues.Strings[0],'RESINNAME');
    if (tmpStr = '') then tmpStr := UserSession.ResinValues.Strings[0];
    Chart1.Title.Text.Text := UserSession.GraphType+'s for '+tmpStr+' using '+UserSession.Reagent1Values.Strings[0];
    for i := 1 to MaxSeries do
    begin
      Chart1.Series[i-1].Clear;
      if (GraphType = gtResinKD) then
      begin
        case i of
          1 : begin
            Series1.LinePen.Hide;
            Series1.Pointer.Visible := false;
          end;
          2 : begin
            Series2.LinePen.Hide;
            Series2.Pointer.Visible := false;
          end;
          3 : begin
            Series3.LinePen.Hide;
            Series3.Pointer.Visible := false;
          end;
          4 : begin
            Series4.LinePen.Hide;
            Series4.Pointer.Visible := false;
          end;
          5 : begin
            Series5.LinePen.Hide;
            Series5.Pointer.Visible := false;
          end;
        end;
        Chart1.Series[i-1].ShowInLegend := false;
      end;
    end;
    NumGroupsToUse := MaxSeries;
    if (UserSession.IonValues.Count < NumGroupsToUse) then NumGroupsToUse := UserSession.IonValues.Count;
    for i := 1 to NumGroupsToUse do
    begin
      Chart1.Series[i-1].Clear;
      if (GraphType = gtResinKD) then
      begin
        Chart1.Series[i-1].ShowInLegend := true;
        case i of
          1 : begin
            Chart1.Series[i-1].Title := UserSession.IonValues.Strings[i-1]+'+';
            Series1.LinePen.Show;
            Series1.Pointer.Visible := false;
          end;
          2 : begin
            Chart1.Series[i-1].Title := UserSession.IonValues.Strings[i-1]+'+';
            Series2.LinePen.Show;
            Series2.Pointer.Visible := false;
          end;
          3 : begin
            Chart1.Series[i-1].Title := UserSession.IonValues.Strings[i-1]+'+';
            Series3.LinePen.Show;
            Series3.Pointer.Visible := false;
          end;
          4 : begin
            Chart1.Series[i-1].Title := UserSession.IonValues.Strings[i-1]+'+';
            Series4.LinePen.Show;
            Series4.Pointer.Visible := false;
          end;
          5 : begin
            Chart1.Series[i-1].Title := UserSession.IonValues.Strings[i-1]+'+';
            Series5.LinePen.Show;
            Series5.Pointer.Visible := false;
          end;
        end;
      end;
    end;
    dmR.cdsTempDataKD.First;
    {Plot Interpretation graphs}
    for i := 1 to NumGroupsToUse do
    begin
      dmR.cdsTempDataKD.Filtered := false;
      dmR.cdsTempDataKD.First;
      dmR.cdsTempDataKD.Filter := 'IONID ='+''''+UserSession.IonValues.Strings[i-1]+'''';
      dmR.cdsTempDataKD.Filtered := true;
      dmR.cdsTempDataKD.First;
      case i of
        1 : UserSession.SeriesTitle1 := dmR.cdsTempDataKDIonName.AsString;
        2 : UserSession.SeriesTitle2 := dmR.cdsTempDataKDIonName.AsString;
        3 : UserSession.SeriesTitle3 := dmR.cdsTempDataKDIonName.AsString;
        4 : UserSession.SeriesTitle4 := dmR.cdsTempDataKDIonName.AsString;
        5 : UserSession.SeriesTitle5 := dmR.cdsTempDataKDIonName.AsString;
      end;
      if (dmR.cdsTempDataKDIonName.AsString <> '') then Chart1.Series[i-1].Title := dmR.cdsTempDataKDIonName.AsString;
      {VtChCum}
      if (GraphType = gtResinKD) then
      begin
        dmR.cdsTempDataKD.First;
        repeat
          Chart1.Series[i-1].AddXY(dmR.cdsTempDataKDMolarity.AsFloat,dmR.cdsTempDataKDKD.AsFloat);
          dmR.cdsTempDataKD.Next;
        until dmR.cdsTempDataKD.EOF;
      end;
    end;
    dmR.cdsTempDataKD.First;
    dmR.cdsTempDataKD.Filtered := false;
    if (GraphType = gtResinKD) then
    begin
      Chart1.BottomAxis.Automatic := true;
      Chart1.LeftAxis.Automatic := true;
      iweXMinimum.Text := FormatFloat('####0.0',UserSession.StartAtX);
      iweXMaximum.Text := FormatFloat('####0.0',UserSession.EndAtX);
      iweYMinimum.Text := FormatFloat('###0.00',UserSession.StartAtY);
      iweYMaximum.Text := FormatFloat('###0.00',UserSession.EndAtY);
    end;
    Chart1.BottomAxis.Automatic := true;
    Chart1.LeftAxis.Automatic := true;
end;

procedure TIWChartKD.iwbExportGraphValuesClick(Sender: TObject);
var
  tmpPath : string;
  tmpFileName : string;
begin
  tmpPath := WebApplication.UserCacheDir; // by putting the file in the cache folder, it will
                                         // automatically be deleted when the session terminates
  tmpFileName := 'ChartData.xml';
  try
    dmR.cdsTempDataKD.SaveToFile(tmpPath+tmpFileName,dfXML);
    WebApplication.SendFile(tmpPath+tmpFileName,false, '', tmpFileName);
  except
  end;
end;

end.
