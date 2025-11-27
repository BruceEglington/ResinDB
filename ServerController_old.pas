unit ServerController_old;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm,
  HTTPApp,
  IWApplication, IWAppForm,
  IWGlobal,
  Windows,
  // For OnNewSession Event
  IniFiles,
  IW.Common.AppInfo,
  IW.Browser.Browser,
  midaslib,
  usrIW_dm,
  resin_dm,
  resin_constants;

type
  TIWServerController = class(TIWServerControllerBase)
    procedure IWServerControllerBaseNewSession(aSession: TIWApplication);
    procedure IWServerControllerBaseGetMainForm(var vMainForm: TIWBaseForm);
  private
    procedure GetIniFile;
  public
  end;

  // This is a class which you can add variables to that are specific to the user. Add variables
  // to this class instead of creating global variables. This object can references by using:
  //   UserSession
  // So if a variable named UserName of type string is added, it can be referenced by using:
  //   UserSession.UserName
  // Such variables are similar to globals in a normal application, however these variables are
  // specific to each user.
  //
  // See the IntraWeb Manual for more details.
  TUserSession = class(TComponent)
  public
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    UserID, UserPassword, UserDisplayName,
    UserLastName, UserFirstName, UserEMail : widestring;
    UserAccessRights : TStringList;
    ThisProgram : string;
    CanView : boolean;
    CanModify : boolean;
    CanInsert : boolean;
    CanDelete : boolean;
    IsDeveloper : boolean;
    CanValidate : boolean;
    CanViewPlus : boolean;
    CanModifyPlus : boolean;
    CanExport : boolean;
    CanExportGraphValues : boolean;
    UserSessionID : integer;
    ThisLoginTime : TDateTime;
    NumUserRightsItems : integer;

    RecordChosen : string;
    ParameterChosen: string;
    UnitSender : string;
    ShowDebugButtons : boolean;
    DelayConnections : boolean;

    NumRecordsPerPage : integer;

    IncludeResinValues : boolean;
    ResinValues : TStringList;
    IncludeReagent1Values : boolean;
    Reagent1Values : TStringList;
    IncludeReagent2Values: Boolean;
    Reagent2Values: TStringList;
    IncludeIonValues: Boolean;
    IonValues: TStringList;
    IncludeReferenceValues: Boolean;
    ReferenceValues: TStringList;
    OrderByValue: string;
    SQLMemoField: TStringList;
    ReferenceStartFrom: string;
    ReferenceEndWith: string;
    GraphType: string;

    tmpStrList : TStringList;
    SeriesTitle1, SeriesTitle2,
    SeriesTitle3, SeriesTitle4,
    SeriesTitle5 : string;
    StartAtX, EndAtX,
    StartAtY, EndAtY  : double;

    WhereAmI :  string;
    DoMemCheck : boolean;

    dmUser : TdmUser;
    dmR : TdmR;

    procedure NeedLogin(AForm : TIWAppFormClass);
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetCookies;
    procedure GetCookies;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure GetStringValues(AString: String; AKey: String; AValueList: TStringList);
  end;

// Procs
  function UserSession: TUserSession;
  function IWServerController: TIWServerController;

implementation
{$R *.dfm}

uses
  System.IOUtils,
  IWInit, XMLDoc, XMLIntf, resin_umain,
  usr_uDBInterface, usr_uLogin, usr_uRegister, usr_constants;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

function UserSession: TUserSession;
begin
  Result := TUserSession(WebApplication.Data);
end;

procedure TIWServerController.GetIniFile;
var
  AppIni   : TIniFile;
  tmpStr   : string;
  iCode    : integer;
  DebugButtons,
  DebugDelayConnections,
  URLBase,
  DBMonitor,
  DriverName,
  LibraryName, VendorLib, GetDriverFunc,
  IniFileName,
  IniFilePath,
  CommonFilePath,
  UserControlPath,
  ResinDBPath,
  DBUserName, DBPassword,DBSpecific,DBSQLDialectStr,DBCharSet,
  DataPath   : string;
  PublicPath : string;
begin
  // --------------------------------------------------------------------------------
  //
  // uses GetPublicPath i.e. based on INI file in the PrgramData folder of subfolders
  //
  // --------------------------------------------------------------------------------
  URLBase := '/';
  DBMonitor := 'Active';
  UserSession.ShowDebugButtons := false;
  UserSession.DelayConnections := false;
  UserControlPath := 'c:\Data\Firebird\UserControl2025v30_utf8.fdb';
  ResinDBPath := 'c:\Data\Firebird\ResinDB2025v30_utf8.fdb';
  DriverName := 'DevartFirebird';
  LibraryName := 'dbexpida41.dll';
  VendorLib := 'c:\exe32\fbclient.dll';
  GetDriverFunc := 'getSQLDriverFirebird';
  DBUserName := 'SYSDBA';
  DBPassword := 'Zbxc456~';
  DBSQLDialectStr := '3';
  DBCharSet := 'UTF8';
  PublicPath := TPath.GetPublicPath;
  //PublicPath := TPath.GetHomePath;  //changed to HomePath to see if this is cause of program not working on Thera2
  CommonFilePath := IncludeTrailingPathDelimiter(PublicPath) + 'EggSoft\';
  IniFilePath := CommonFilePath;
  IniFilename := IniFilePath + 'resindb.ini';
  AppIni := TIniFile.Create(IniFilename);
  try
    URLBase := AppIni.ReadString('URLBase','URLBase','/resindb');
    if (URLBase = '/') then URLBase := '';
    UserControlPath := AppIni.ReadString('Paths','UserControl path','c:\Data\Firebird\UserControl2025v30_UTF8.fdb');
    ResinDBPath := AppIni.ReadString('Paths','ResinDB path','c:\Data\Firebird\ResinDB2025v30_UTF8.fdb');
    LibraryName := AppIni.ReadString('Parameters','LibraryName','dbexpida41.dll');
    VendorLib := AppIni.ReadString('Parameters','VendorLib','c:\exe32\fbclient.dll');
    GetDriverFunc := AppIni.ReadString('Parameters','GetDriverFunc','getSQLDriverFirebird');
    DriverName := AppIni.ReadString('Parameters','DriverName','DevartFirebird');
    DBUserName := AppIni.ReadString('Parameters','User_Name','SYSDBA');
    DBPassword := AppIni.ReadString('Parameters','Password','Zbxc456~');
    DBSQLDialectStr := AppIni.ReadString('Parameters','SQLDialect','3');
    DBCharSet := AppIni.ReadString('Parameters','Charset','UTF8');
    DBMonitor := AppIni.ReadString('Monitor','DBMonitor','active');
    DebugButtons := AppIni.ReadString('Debug','Buttons','Active');
    DebugDelayConnections := AppIni.ReadString('Debug','DelayConnections','true');
    if (DebugButtons = 'Active') then UserSession.ShowDebugButtons := true;
    if (DebugDelayConnections = 'true') then UserSession.DelayConnections := true;

    FromEmailAddress := AppIni.ReadString('Email','FromEmailAddress','aht820@usask.ca');
    FromName := AppIni.ReadString('Email','FromName','EggSoft developer and database administrator');
    HostName := AppIni.ReadString('Email','HostName','smtp.office365.com');
    HostPort := AppIni.ReadString('Email','HostPort','587');
    EmailUserID := AppIni.ReadString('Email','EmailUserID','aht820@usask.ca');
    EmailPassword := AppIni.ReadString('Email','EmailPassword','nuC7Sy3Af4bu');
    URLonTerminate := AppIni.ReadString('URL','URLonTerminate','http://sil.usask.ca');
    FromEmailAddress := Trim(FromEmailAddress);
    FromName := Trim(FromName);
    HostName := Trim(HostName);
    HostPort := Trim(HostPort);
    EmailUserID := Trim(EmailUserID);
    EmailPassword := Trim(EmailPassword);
    URLonTerminate := Trim(URLonTerminate);
  //define connection parameters for UserControl connection
  dmUser.sqlcWebUser.Connected := false;
  dmUser.sqlcWebUser.Params.Clear;
  dmUser.sqlcWebUser.DriverName := DriverName;
  dmUser.sqlcWebUser.LibraryName := LibraryName;
  dmUser.sqlcWebUser.VendorLib := VendorLib;
  dmUser.sqlcWebUser.GetDriverFunc := GetDriverFunc;
  dmUser.sqlcWebUser.Params.Append('DriverName='+DriverName);
  dmUser.sqlcWebUser.Params.Append('Database='+UserControlPath);
  dmUser.sqlcWebUser.Params.Append('User_Name='+DBUserName);
  dmUser.sqlcWebUser.Params.Append('Password='+DBPassword);
  dmUser.sqlcWebUser.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmUser.sqlcWebUser.Params.Append('Charset='+DBCharSet);
  dmUser.sqlcWebUser.Params.Append('LocaleCode=0000');
  dmUser.sqlcWebUser.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmUser.sqlcWebUser.Params.Append('WaitOnLocks=True');
  dmUser.sqlcWebUser.Params.Append('UseUnicode=true');
  //define connection parameters for StratDB connection
  dmR.sqlcResinDB.Connected := false;
  dmR.sqlcResinDB.Params.Clear;
  dmR.sqlcResinDB.LibraryName := LibraryName;
  dmR.sqlcResinDB.VendorLib := VendorLib;
  dmR.sqlcResinDB.GetDriverFunc := GetDriverFunc;
  dmR.sqlcResinDB.Params.Append('DriverName='+DriverName);
  dmR.sqlcResinDB.Params.Append('Database='+ResinDBPath);
  dmR.sqlcResinDB.Params.Append('User_Name='+DBUserName);
  dmR.sqlcResinDB.Params.Append('Password='+DBPassword);
  dmR.sqlcResinDB.Params.Append('SQLDialect='+DBSQLDialectStr);
  dmR.sqlcResinDB.Params.Append('Charset='+DBCharSet);
  dmR.sqlcResinDB.Params.Append('LocaleCode=0000');
  dmR.sqlcResinDB.Params.Append('DevartFirebird TransIsolation=ReadCommitted');
  dmR.sqlcResinDB.Params.Append('WaitOnLocks=True');
  dmR.sqlcResinDB.Params.Append('UseUnicode=true');
  if (DBMonitor = 'Active') then
  begin
    dmUser.SQLMonitor1.Active := true;
    dmR.SQLMonitor1.Active := true;
  end else
  begin
    dmUser.SQLMonitor1.Active := false;
    dmR.SQLMonitor1.Active := false;
  end;
  finally
    AppIni.Free;
  end;
  //dmUser.SetDeveloperData('GetIniFile');
  //dmUser.SetDeveloperData('IniFile = '+IniFileName);
  //dmUser.SetDeveloperData('URLBase = '+URLBase);
  //dmUser.SetDeveloperData('UserControlPath = '+UserControlPath);
  //dmUser.SetDeveloperData('StratDBPath = '+StratDBPath);
  //dmUser.SetDeveloperData('DateViewPath = '+DateViewPath);
end;

constructor TUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  dmR := TdmR.Create(Self);
  dmUser.sqlcWebUser.Connected := false;
  dmR.sqlcResinDB.Connected := false;
  UserAccessRights := TStringList.Create;

  ResinValues := TStringList.Create;
  Reagent1Values := TStringList.Create;
  Reagent2Values := TStringList.Create;
  IonValues := TStringList.Create;
  tmpStrList := TStringList.Create;
  SQLMemoField := TStringList.Create;
end;

destructor TUserSession.Destroy;
begin
  FreeAndNil(ResinValues);
  FreeAndNil(Reagent1Values);
  FreeAndNil(Reagent2Values);
  FreeAndNil(IonValues);
  FreeAndNil(UserAccessRights);
  FreeAndNil(tmpStrList);
  FreeAndNil(SQLMemoField);
  inherited Destroy;
end;

procedure TUserSession.AfterLogin;
begin
  //UserSession.DoMemCheck := false;
  //if UserSession.DoMemCheck then MemChk;
  UserSession.ThisProgram := 'ResinDB';
  UserSession.WhereAmI := 'AfterLogin';
  UserSession.NumRecordsPerPage := 50;
  LoggedIn := TRUE;
  IncrementNumUses(UserSession.ThisProgram);
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;
  UserSession.CanValidate := false;
  UserSession.CanExport := false;
  UserSession.CanViewPlus := false;
  UserSession.CanModifyPlus := false;
  CheckRights(UserSession.ThisProgram,UserSession.UserID,UserSession.UserPassword,
              ValueForCanView,
              ValueForCanModify,ValueForCanInsert,ValueForCanDelete,
              ValueForCanValidate,ValueForCanExport,ValueForCanViewPlus,
              ValueForCanModifyPlus,ValueForIsDeveloper);
  UserSession.NumUserRightsItems := 0;
  {
  UserSession.CanModify := false;
  UserSession.CanInsert := false;
  UserSession.CanDelete := false;
  UserSession.IsDeveloper := false;
  UserSession.CanValidate := false;
  UserSession.CanModify := CheckRights(ValueForCanModify);
  UserSession.CanInsert := CheckRights(ValueForCanInsert);
  UserSession.CanDelete := CheckRights(ValueForCanDelete);
  UserSession.IsDeveloper := CheckRights(ValueForIsDeveloper);
  UserSession.CanValidate := CheckRights(ValueForCanValidate);
  }
  {
  UserSession.ResinValues.Add('AG50W08');
  UserSession.Reagent1Values.Add('HCl');
  UserSession.IonValues.Add('Ba2');
  UserSession.IonValues.Add('Ca2');
  UserSession.IonValues.Add('Fe3');
  UserSession.IonValues.Add('Sr2');
  UserSession.IonValues.Add('Rb1');
  }
  UserSession.GraphType := gtResinKD;

  UserSession.GetCookies;

  TIWAppForm(WebApplication.ActiveForm).Release;
  if ( LastVisitedForm.ClassNameIs(TISFLogin.ClassName) or
       LastVisitedForm.ClassNameIs(TISFRegister.ClassName) )  then
    TISFMain.Create(WebApplication).Show
  else
    LastVisitedForm.Create(WebApplication).Show;
end;

procedure TUserSession.NeedLogin(AForm: TIWAppFormClass);
begin
  if LoggedIn then begin
  end;
  LoggedIn := false;
  LastVisitedForm := AForm;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLogin.Create(WebApplication).Show;
end;

procedure TIWServerController.IWServerControllerBaseGetMainForm(
  var vMainForm: TIWBaseForm);
begin
  vMainForm := TISFMain.Create(WebApplication);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  aSession: TIWApplication);
begin
  ASession.Data := TUserSession.Create(nil);  //note this is a TUserSession
                                              //NOT to be confused with TIWUserSession
  GetIniFile;
end;

procedure TUserSession.SetCookies;
var
  tmpString : string;
  i : integer;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    AStringList.Clear;
    if UserSession.IncludeResinValues then
    begin
      AStringList.Add('IncludeResinValues='+IntToStr(UserSession.ResinValues.Count));
      for i := 1 to UserSession.ResinValues.Count do
      begin
        AStringList.Add('ResinValues='+UserSession.ResinValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeReagent1Values then
    begin
      AStringList.Add('IncludeReagent1Values='+IntToStr(UserSession.Reagent1Values.Count));
      for i := 1 to UserSession.Reagent1Values.Count do
      begin
        AStringList.Add('Reagent1Values='+UserSession.Reagent1Values.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeReagent2Values then
    begin
      AStringList.Add('IncludeReagent2Values='+IntToStr(UserSession.Reagent2Values.Count));
      for i := 1 to UserSession.Reagent2Values.Count do
      begin
        AStringList.Add('Reagent2Values='+UserSession.Reagent2Values.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeIonValues then
    begin
      AStringList.Add('IncludeIonValues='+IntToStr(UserSession.IonValues.Count));
      for i := 1 to UserSession.IonValues.Count do
      begin
        AStringList.Add('IonValues='+UserSession.IonValues.Strings[i-1]);
      end;
    end;
    if UserSession.IncludeReferenceValues then
    begin
      AStringList.Add('IncludeReferenceValues='+IntToStr(UserSession.ReferenceValues.Count));
      for i := 1 to UserSession.ReferenceValues.Count do
      begin
        AStringList.Add('ReferenceValues='+UserSession.ReferenceValues.Strings[i-1]);
      end;
    end;
    {
    if UserSession.CanInsert then
    begin
      AStringList.Add('NewContinentID='+UserSession.NewContinentID);
      AStringList.Add('NewAreaID='+UserSession.NewAreaID);
      AStringList.Add('NewUnitID='+UserSession.NewUnitID);
      AStringList.Add('NewLithologyID='+UserSession.NewLithologyID);
      AStringList.Add('NewMaterialID='+UserSession.NewMaterialID);
      AStringList.Add('NewIsotopeSystemID='+UserSession.NewIsotopeSystemID);
      AStringList.Add('NewApproachID='+UserSession.NewApproachID);
      AStringList.Add('NewTechniqueID='+UserSession.NewTechniqueID);
      AStringList.Add('NewInterpretationID='+UserSession.NewInterpretationID);
      AStringList.Add('NewRatingNum='+UserSession.NewRatingNum);
      AStringList.Add('NewMethodID='+UserSession.NewMethodID);
      AStringList.Add('NewAgeUnit='+UserSession.NewAgeUnit);
      AStringList.Add('NewReferenceID='+UserSession.NewReferenceID);
    end;
    }
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      dmUser.cdsCookieInfo.Edit;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end else
    begin
      dmUser.cdsCookieInfo.Append;
      dmUser.cdsCookieInfoUSERID.AsString := UserSession.UserID;
      dmUser.cdsCookieInfoSOFTWAREID.AsString := UserSession.ThisProgram;
      dmUser.cdsCookieInfoLASTUSED.AsDateTime := Now;
      dmUser.cdsCookieInfoCOOKIEINFO.AsString := AStringList.Text;
      dmUser.cdsCookieInfo.Post;
    end;
    dmUser.cdsCookieInfo.ApplyUpdates(0);
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetCookies;
var
  tmpString : string;
  i, tmpi, iCode : integer;
  tmpStringValues : TStringList;
  AStringList : TStringList;
begin
  AStringList := TStringList.Create;
  try
    dmUser.qCookieInfo.Close;
    dmUser.qCookieInfo.ParamByName('USERID').AsString := UserSession.UserID;
    dmUser.qCookieInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsCookieInfo.Close;
    dmUser.cdsCookieInfo.Open;
    if (dmUser.cdsCookieInfo.RecordCount > 0) then
    begin
      AStringList.Text := dmUser.cdsCookieInfoCOOKIEINFO.AsString;
    end;
    Val(AStringList.Values['IncludeResinValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeResinValues := true;
      UserSession.GetStringsValues(AStringList,'ResinValues',UserSession.ResinValues);
    end;
    Val(AStringList.Values['IncludeReagent1Values'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReagent1Values := true;
      UserSession.GetStringsValues(AStringList,'Reagent1Values',UserSession.Reagent1Values);
    end;
    Val(AStringList.Values['IncludeReagent2Values'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReagent2Values := true;
      UserSession.GetStringsValues(AStringList,'Reagent2Values',UserSession.Reagent2Values);
    end;
    Val(AStringList.Values['IncludeIonValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeIonValues := true;
      UserSession.GetStringsValues(AStringList,'IonValues',UserSession.IonValues);
    end;
    Val(AStringList.Values['IncludeReferenceValues'],tmpi,iCode);
    if (iCode > 0) then tmpi := 0;
    if (tmpi > 0) then
    begin
      UserSession.IncludeReferenceValues := true;
      UserSession.GetStringsValues(AStringList,'ReferenceValues',UserSession.ReferenceValues);
    end;
    {
    if UserSession.CanInsert then
    begin
      UserSession.NewContinentID := AStringList.Values['NewContinentID'];
      UserSession.NewAreaID := AStringList.Values['NewAreaID'];
      UserSession.NewUnitID := AStringList.Values['NewUnitID'];
      UserSession.NewLithologyID := AStringList.Values['NewLithologyID'];
      UserSession.NewMaterialID := AStringList.Values['NewMaterialID'];
      UserSession.NewIsotopeSystemID := AStringList.Values['NewIsotopeSystemID'];
      UserSession.NewApproachID := AStringList.Values['NewApproachID'];
      UserSession.NewTechniqueID := AStringList.Values['NewTechniqueID'];
      UserSession.NewInterpretationID := AStringList.Values['NewInterpretationID'];
      UserSession.NewRatingNum := AStringList.Values['NewRatingNum'];
      UserSession.NewMethodID := AStringList.Values['NewMethodID'];
      UserSession.NewAgeUnit := AStringList.Values['NewAgeUnit'];
      UserSession.NewReferenceID := AStringList.Values['NewReferenceID'];
    end;
    }
  finally
    AStringList.Free;
  end;
end;

procedure TUserSession.GetStringsValues(AStrings: TStrings;
                           AKey: String; AValueList: TStringList);
{from routine published by Bob Swart}
var
  FieldValue: String;
  i, match: Integer;
begin
  AKey := AKey + '=';
  for i:=0 to Pred(AStrings.Count) do
  begin
    FieldValue := AStrings.Strings[i];
    if Pos(AKey, FieldValue) = 1 then { exact match }
    begin
      match := Pos('=', FieldValue);
      if match > 0 then
        AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match))
    end;
  end;
end;

procedure TUserSession.GetStringValues(AString: String;
                           AKey: String; AValueList: TStringList);
var
  FieldValue: String;
  i, match: Integer;
  match2 : integer;
begin
  FieldValue := AString;
  match := 0;
  match2 := Pos(',', FieldValue);
  repeat
    match2 := Pos(',', FieldValue);
    if (match2 > 0) then
    begin
      AValueList.Add(Copy(FieldValue, match+1, match2-match+1));
      FieldValue := Copy(FieldValue,match2+1, Length(FieldValue)-match+1);
    end else
    begin
      AValueList.Add(Copy(FieldValue, match+1, Length(FieldValue)-match+1));
      match2 := 0;
    end;
  until (match2 = 0);
end;

initialization
  TIWServerController.SetServerControllerClass;

end.

