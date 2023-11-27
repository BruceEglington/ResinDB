unit resin_frProductTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompLabel,
  IWHTMLControls, IWHTMLTag, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, IWCompExtCtrls, IWHTML40Container;

type
  TISFProductTree = class(TFrame)
    IWFrameRegion: TIWRegion;
    rectRight: TIWRectangle;
    iwregPageLinks: TIWRegion;
    iwlDefineQuery: TIWLink;
    iwlMainPage: TIWLink;
    iwlGraphResults: TIWLink;
    IWImage1: TIWImage;
    procedure iwlDefineQueryClick(Sender: TObject);
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlGraphResultsClick(Sender: TObject);
  protected
    procedure DoClick(Sender : TObject);
  public
    procedure LoadTree;
  end;

implementation
{$R *.dfm}

uses
  IWColor, IWAppForm, IWForm, IWInit,
//  uDocumentation,
  ServerController, IWApplication, resin_uMain, resin_definequery2,
  resin_chartcurve;

{ TISFProductTree }

procedure TISFProductTree.DoClick(Sender: TObject);
begin
  if Sender is TIWLink then begin
    {
    UserSession.CurrentCategoryID := TIWLink(Sender).Tag;
    TIWAppForm(WebApplication.ActiveForm).Release;
    }
    {
    TISFDisplayCategory.Create(WebApplication).Show;
    }
  end;
end;

procedure TISFProductTree.LoadTree;
begin
  {
  Left := -1;
  for i := ControlCount - 1 downto 1 do begin
    if Controls[i] is TIWControl then begin
      TIWControl(Controls[i]).Free;
    end;
  end;

  LTop := 160;
  }
  (*
  with dmFly.qrCategories do begin
     Close;
{     SQL.Text := 'SELECT ID, Name FROM Categories';}
     Open;
     while not EOF do begin
        LLink := TIWLink.Create(Self);
        LLink.Parent := Self.IWFrameRegion;
        with LLink do begin
           Caption := FieldByName('Name').AsString;
           Tag := FieldByName('ID').AsInteger;
           Name := Format('CategoryLink%d', [Tag]);
           Left := 10;
           Top := LTop;
           OnClick := DoClick;
           Font.FontName := 'Verdana';
           Font.Color := clWebGOLDENROD;
           Font.Size := 10;
           Font.Style := [fsBold];
           Font.CSSStyle := 'body';

           LTop := LTop + Height + 2;
        end;
        Next;
     end;
     Close;
  end;
  *)
end;

procedure TISFProductTree.iwlDefineQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDefineQuery2.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlMainPageClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFProductTree.iwlGraphResultsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if (UserSession.IonValues.Count > 0) then
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TIWChartKD.Create(WebApplication).Show;
    end else
    begin
      WebApplication.ShowMessage('At least one ion must be specified in order to generate a graph');
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.
