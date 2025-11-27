unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, usrIW_dm, Resin_dm;

type
  TIWUserSession = class(TIWUserSessionBase)
  private
    { Private declarations }
  public
    { Public declarations }
    LoggedIn : boolean; // User logged in or not
    //LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only
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

    //procedure NeedLogin(AForm : TIWAppFormClass);
   // procedure AfterLogin;
    //constructor Create(AOwner: TComponent); override;
    //destructor Destroy; override;
    //procedure SetCookies;
    //procedure GetCookies;
    procedure GetStringsValues(AStrings: TStrings; AKey: String; AValueList: TStringList);
    procedure GetStringValues(AString: String; AKey: String; AValueList: TStringList);
  end;



implementation

{$R *.dfm}

constructor TIWUserSession.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  UserSessionID := integer(@Self);
  LoggedIn := FALSE;
  //dmUser := TdmUser.Create(Self);
  //dmR := TdmR.Create(Self);
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

procedure TIWUserSession.GetStringsValues(AStrings: TStrings;
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

procedure TIWUserSession.GetStringValues(AString: String;
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



end.