unit resin_definequery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, resin_frTopBar;

type
  TISFDefineQuery = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwcbContinents: TIWCheckBox;
    iwbNextStageOfQuery: TIWButton;
    iwlContinents: TIWListbox;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  public
  end;

implementation

uses resin_dm, ServerController, resin_frGrid;

{$R *.dfm}


procedure TISFDefineQuery.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwcbContinents.Checked := UserSession.IncludeContinentValues;
  iwcbAreas.Checked := UserSession.IncludeAreaValues;
  {
  dmDV.UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  dmDV.UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  }
end;

procedure TISFDefineQuery.iwbNextStageOfQueryClick(Sender: TObject);
begin
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  {
  dmDV.GetListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  dmDV.getListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
  dmDV.SubmitContAreaQuery;
  }
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  {
  TISFDefineQuery2.Create(WebApplication).Show
  }
end;

procedure TISFDefineQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    iwcbContinents.Checked := UserSession.IncludeContinentValues;
    iwcbAreas.Checked := UserSession.IncludeAreaValues;
    {
    dmDV.UpdateListBoxValues(iwlContinents,dmDV.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
    dmDV.UpdateListBoxValues(iwlAreas,dmDV.cdsCountries,'Country','CountryAbr',UserSession.AreaValues);
    }
  end;
end;

end.
