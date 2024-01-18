unit resin_details;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  IWBaseHTMLControl, resin_frProductTree, resin_frTopBar;

type
  TISFDetails = class(TIWAppForm)
    TopBar: TISFTopBar;
    LeftTree: TISFProductTree;
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWLabel7: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWDBEdit9: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWLabel13: TIWLabel;
    IWDBEdit13: TIWDBEdit;
    IWDBEdit14: TIWDBEdit;
    IWLabel15: TIWLabel;
    IWDBEdit15: TIWDBEdit;
    IWLabel16: TIWLabel;
    IWDBEdit16: TIWDBEdit;
    IWLabel17: TIWLabel;
    IWDBEdit17: TIWDBEdit;
    IWLabel18: TIWLabel;
    IWLabel19: TIWLabel;
    IWLabel14: TIWLabel;
    IWDBEdit19: TIWDBEdit;
    IWLabel20: TIWLabel;
    IWDBEdit20: TIWDBEdit;
    IWLabel21: TIWLabel;
    IWDBEdit21: TIWDBEdit;
    IWLabel22: TIWLabel;
    IWDBEdit22: TIWDBEdit;
    IWLabel23: TIWLabel;
    IWDBEdit23: TIWDBEdit;
    iwDBgReference: TIWDBGrid;
    iwDBgValidation: TIWDBGrid;
    IWLabel24: TIWLabel;
    iwDBgSample: TIWDBGrid;
    IWLabel25: TIWLabel;
    IWLabel26: TIWLabel;
    iwDBgProvince: TIWDBGrid;
    iwDBgTerrane: TIWDBGrid;
    IWLabel27: TIWLabel;
    iwDBgChemicalType: TIWDBGrid;
    iwDBgOrogenicPeriod: TIWDBGrid;
    IWLabel28: TIWLabel;
    IWDBEdit18: TIWDBEdit;
    IWLabel29: TIWLabel;
    IWDBEdit24: TIWDBEdit;
    IWLabel30: TIWLabel;
    IWDBEdit25: TIWDBEdit;
    IWLabel31: TIWLabel;
    IWDBEdit26: TIWDBEdit;
    IWLabel32: TIWLabel;
    IWDBEdit27: TIWDBEdit;
    IWLabel33: TIWLabel;
    IWDBEdit28: TIWDBEdit;
    IWDBEdit29: TIWDBEdit;
    IWLabel34: TIWLabel;
    IWLabel35: TIWLabel;
    IWDBEdit30: TIWDBEdit;
    IWLabel36: TIWLabel;
    IWDBEdit31: TIWDBEdit;
    IWLabel37: TIWLabel;
    IWDBEdit32: TIWDBEdit;
    IWLabel38: TIWLabel;
    IWDBEdit33: TIWDBEdit;
    IWLabel39: TIWLabel;
    IWDBEdit34: TIWDBEdit;
    IWLabel40: TIWLabel;
    IWDBEdit35: TIWDBEdit;
    IWLabel41: TIWLabel;
    IWDBEdit36: TIWDBEdit;
    IWLabel42: TIWLabel;
    IWDBEdit37: TIWDBEdit;
    IWLabel43: TIWLabel;
    IWDBEdit38: TIWDBEdit;
    IWLabel44: TIWLabel;
    IWDBEdit39: TIWDBEdit;
    IWLabel45: TIWLabel;
    IWDBEdit40: TIWDBEdit;
    IWDBEdit41: TIWDBEdit;
    IWLabel46: TIWLabel;
    IWDBEdit42: TIWDBEdit;
    IWLabel47: TIWLabel;
    IWLabel48: TIWLabel;
    iwDBgLaboratory: TIWDBGrid;
    IWLabel49: TIWLabel;
    iwDBmComments: TIWDBMemo;
    iwbQueryValidationStatus: TIWButton;
    IWLabel50: TIWLabel;
    IWDBEdit43: TIWDBEdit;
    IWLabel52: TIWLabel;
    IWDBEdit45: TIWDBEdit;
    IWLabel53: TIWLabel;
    IWDBEdit46: TIWDBEdit;
    IWLabel51: TIWLabel;
    IWDBEdit44: TIWDBEdit;
    IWLabel54: TIWLabel;
    IWDBEdit47: TIWDBEdit;
    IWLabel55: TIWLabel;
    IWDBEdit48: TIWDBEdit;
    IWLabel56: TIWLabel;
    IWDBEdit49: TIWDBEdit;
    IWLabel57: TIWLabel;
    IWDBEdit50: TIWDBEdit;
    IWLabel59: TIWLabel;
    IWLabel60: TIWLabel;
    IWDBEdit53: TIWDBEdit;
    IWDBEdit54: TIWDBEdit;
    IWLabel61: TIWLabel;
    IWDBEdit51: TIWDBEdit;
    IWLabel58: TIWLabel;
    iwDBgGrouping: TIWDBGrid;
    IWLabel62: TIWLabel;
    IWLabel63: TIWLabel;
    iwDBgBoundary: TIWDBGrid;
    IWLabel64: TIWLabel;
    iwDBgImage: TIWDBGrid;
    iwDBgWhoFor: TIWDBGrid;
    iwbDetailsEdit: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWLabel65: TIWLabel;
    IWDBEdit52: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    IWLabel68: TIWLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, resin_dm, resin_frGrid;




procedure TISFDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDetailsEdit.Visible := UserSession.CanModify;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFDetails.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFGrid.Create(WebApplication).Show
end;

procedure TISFDetails.iwbDetailsEditClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  {
  TISFDetailsEdit.Create(WebApplication).Show
  }
end;

procedure TISFDetails.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

end.
