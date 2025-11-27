program Project1;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStart,
  Unit_mn in 'Unit_mn.pas' {IWForm_mn: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  usr_constants in '..\..\WebUserIW\usr_constants.pas',
  usr_cookies in '..\..\WebUserIW\usr_cookies.pas',
  usr_insufficientright in '..\..\WebUserIW\usr_insufficientright.pas' {ISFInsufficientRights: TIWAppForm},
  usr_uChangeDetails in '..\..\WebUserIW\usr_uChangeDetails.pas' {ISFChangeUserDetails: TIWAppForm},
  usr_uDBInterface in '..\..\WebUserIW\usr_uDBInterface.pas',
  usr_uLogin in '..\..\WebUserIW\usr_uLogin.pas' {ISFLogin: TIWAppForm},
  usr_uRegister in '..\..\WebUserIW\usr_uRegister.pas' {ISFRegister: TIWAppForm},
  usrIW_dm in '..\..\WebUserIW\usrIW_dm.pas' {dmUser: TDataModule},
  DB_List_Combo in '..\..\Eglington Delphi common code items\DB_List_Combo.pas',
  Resin_dm in 'Resin_dm.pas' {dmR: TDataModule},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
