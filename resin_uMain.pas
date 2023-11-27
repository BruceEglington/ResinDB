{
  ISFMain main user window

  This is the first page the user sees when accessing this application.
}

unit resin_uMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompButton, Forms,
  IWCompRectangle, IWCompLabel, IWDBStdCtrls,
  IWCompText,
  IWCompMemo, IWCompCheckbox, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, resin_frProductTree, resin_frTopBar,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion, IWHTML40Container;

type
  TISFMain = class(TIWAppForm)
    lblWelcome: TIWLabel;
    TopBar: TISFTopBar;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBLabel1: TIWDBLabel;
    IWDBMemo1: TIWDBMemo;
    IWRegion1: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    LeftTree: TISFProductTree;
    iwlNumUses: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure LeftTreeiwlDefineQueryClick(Sender: TObject);
    procedure LeftTreeiwlGraphResultsClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
  public
  protected
    procedure LoadWelcomeMessage;
  end;

type
  TISFMainClass = class of TISFMain;

implementation
{$R *.dfm}

uses
  ServerController, usrIW_dm, IWHTMLControls, IWColor, Graphics,
  IWBaseForm, jpeg, resin_dm, resin_constants;

procedure TISFMain.IWAppFormCreate(Sender: TObject);
begin
  UserSession.ThisProgram := 'ResinDB';
  LoadWelcomeMessage;
end;

procedure TISFMain.LoadWelcomeMessage;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmUser.qProgress.Close;
  dmUser.qProgress.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.qProgress.ParamByName('PROGRESSID').AsInteger := 0;
  dmUser.cdsProgress.Close;
  dmUser.cdsProgress.Open;
end;

procedure TISFMain.IWAppFormRender(Sender: TObject);
begin
  LeftTree.iwregPageLinks.Visible := UserSession.LoggedIn;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.IsDeveloper then
  begin
    dmUser.qNumTimesUsed.Close;
    dmUser.qNumTimesUsed.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsNumTimesUsed.Close;
    dmUser.cdsNumTimesUsed.Open;
    iwlNumUses.Caption := 'This program has been used '+dmUser.cdsNumTimesUsedNUMTIMESUSED.AsString+' times';
    dmUser.cdsNumTimesUsed.Close;
  end else
  begin
    iwlNumUses.Caption := '';
  end;
end;

procedure TISFMain.LeftTreeiwlDefineQueryClick(Sender: TObject);
begin
  LeftTree.iwlDefineQueryClick(Sender);
end;

procedure TISFMain.LeftTreeiwlGraphResultsClick(Sender: TObject);
begin
  LeftTree.iwlGraphResultsClick(Sender);

end;

procedure TISFMain.IWAppFormDestroy(Sender: TObject);
begin
  dmUser.cdsProgress.Close;
end;

initialization
  TISFMain.SetAsMainForm;
end.
