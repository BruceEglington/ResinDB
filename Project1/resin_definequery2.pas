unit resin_definequery2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, resin_frTopBar;

type
  TISFDefineQuery2 = class(TIWAppForm)
    TopBar: TISFTopBar;
    iwbSubmitQuery: TIWButton;
    iwcbResins: TIWCheckBox;
    iwlResins: TIWListbox;
    iwcbIons: TIWCheckBox;
    iwlIons: TIWListbox;
    iwcbReagent1: TIWCheckBox;
    iwlReagent1: TIWListbox;
    iwcbReagent2: TIWCheckBox;
    iwlReagent2: TIWListbox;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    IWButton1: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
  public
  end;

implementation

uses ServerController, resin_frGrid, resin_constants,
  Resin_dm, DB_List_Combo;

{$R *.dfm}


procedure TISFDefineQuery2.IWAppFormCreate(Sender: TObject);
begin
  iwcbResins.Checked := UserSession.IncludeResinValues;
  iwcbReagent1.Checked := UserSession.IncludeReagent1Values;
  iwcbReagent2.Checked := UserSession.IncludeReagent2Values;
  iwcbIons.Checked := UserSession.IncludeIonValues;
  UpdateListBoxValues(iwlResins,dmR.cdsResins,'ResinName','ResinID',UserSession.ResinValues);
  UpdateListBoxValues(iwlReagent1,dmR.cdsReagents,'ReagentName','ReagentID',UserSession.Reagent1Values);
  UpdateListBoxValues(iwlReagent2,dmR.cdsReagents,'ReagentName','ReagentID',UserSession.Reagent2Values);
  UpdateListBoxValues(iwlIons,dmR.cdsIons,'IonID','IonID',UserSession.IonValues);
end;

procedure TISFDefineQuery2.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.IncludeResinValues := iwcbResins.Checked;
  UserSession.IncludeReagent1Values := iwcbReagent1.Checked;
  UserSession.IncludeReagent2Values := iwcbReagent2.Checked;
  UserSession.IncludeIonValues := iwcbIons.Checked;
  GetListBoxValues(iwlResins,dmR.cdsResins,'ResinName','ResinID',UserSession.ResinValues);
  GetListBoxValues(iwlReagent1,dmR.cdsReagents,'ReagentName','ReagentID',UserSession.Reagent1Values);
  GetListBoxValues(iwlReagent2,dmR.cdsReagents,'ReagentName','ReagentID',UserSession.Reagent2Values);
  GetListBoxValues(iwlIons,dmR.cdsIons,'IonID','IonID',UserSession.IonValues);
  if ((UserSession.IncludeResinValues) and (UserSession.ResinValues.Count = 0)) then UserSession.IncludeResinValues := false;
  if ((UserSession.IncludeReagent1Values) and (UserSession.Reagent1Values.Count = 0)) then UserSession.IncludeReagent1Values := false;
  if ((UserSession.IncludeReagent2Values) and (UserSession.Reagent2Values.Count = 0)) then UserSession.IncludeReagent2Values := false;
  if ((UserSession.IncludeIonValues) and (UserSession.IonValues.Count = 0)) then UserSession.IncludeIonValues := false;
  dmR.SubmitQuery;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFGrid.Create(WebApplication).Show
end;

procedure TISFDefineQuery2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

end.
