program ResinDB;

uses
  IWRtlFix,
  IWStart,
  Forms,
  IWMain,
  resin_frTopBar in 'resin_frTopBar.pas' {ISFTopBar: TFrame},
  resin_frProductTree in 'resin_frProductTree.pas' {ISFProductTree: TFrame},
  Resin_dm in 'Resin_dm.pas' {dmR: TDataModule},
  resin_frGrid in 'resin_frGrid.pas' {ISFGrid: TIWAppForm},
  resin_constants in 'resin_constants.pas',
  resin_chartcurve in 'resin_chartcurve.pas' {IWChartKD: TIWAppForm},
  resin_definequery2 in 'resin_definequery2.pas' {ISFDefineQuery2: TIWAppForm},
  usrIW_dm in '..\WebUserIW\usrIW_dm.pas' {dmUser: TDataModule},
  usr_insufficientright in '..\WebUserIW\usr_insufficientright.pas' {ISFInsufficientRights: TIWAppForm},
  usr_uChangeDetails in '..\WebUserIW\usr_uChangeDetails.pas' {ISFChangeUserDetails: TIWAppForm},
  usr_uDBInterface in '..\WebUserIW\usr_uDBInterface.pas',
  usr_uLogin in '..\WebUserIW\usr_uLogin.pas' {ISFLogin: TIWAppForm},
  usr_uRegister in '..\WebUserIW\usr_uRegister.pas' {ISFRegister: TIWAppForm},
  usr_uForgotten in '..\WebUserIW\usr_uForgotten.pas' {ISFForgotten: TIWAppForm},
  usr_uRenew in '..\WebUserIW\usr_uRenew.pas' {ISFRenew: TIWAppForm},
  IWCompTeeChart in '..\TeeChart__for_IntraWeb\IWCompTeeChart.pas',
  usr_cookies in '..\WebUserIW\usr_cookies.pas',
  usr_constants in '..\WebUserIW\usr_constants.pas',
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  resin_uMain in 'resin_uMain.pas' {ISFMain: TIWAppForm},
  Allsorts in '..\Eglington Delphi common code items\Allsorts.pas',
  DB_List_Combo in '..\Eglington Delphi common code items\DB_List_Combo.pas';

{$R *.res}

begin
  TIWStart.Execute(True);
  //Application.Initialize;
  //Application.Title := 'ResinDB';
  //Application.CreateForm(TformIWMain, formIWMain);
  //Application.Run;
end.

