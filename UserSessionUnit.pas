unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes,
  usrIW_dm, IWAppForm, IWApplication;

type
  TIWUserSession = class(TIWUserSessionBase)
  private
    { Private declarations }
  public
    { Public declarations }
    LoggedIn : boolean; // User logged in or not
    LastVisitedForm : TIWAppFormClass; // This is interesting for the Login form only

    UserID, UserPassword, UserDisplayName,
    UserLastName, UserFirstName, UserEMail : string;
    UserAccessRights : TStringList;
    ThisProgram : string;
    UserSessionID : integer;

    SQLMemoField: TStringList;

    WhereAmI :  string;
    dmUser : TdmUser;
    procedure NeedLogin;
    procedure AfterLogin;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses usr_uLogin, usr_uRegister;

{$R *.dfm}

constructor TIWUserSession.Create(AOwner: TComponent);
var
  f : integer;
  LTime : TDateTime;
begin
  inherited Create(AOwner);
  // This name should be unique per server / session
  // We use the memory address of the UserSession object as a UserSessionID.
  UserSessionID := integer(@Self);
  LTime := Time;
  LoggedIn := FALSE;
  dmUser := TdmUser.Create(Self);
  UserAccessRights := TStringList.Create;
  dmUser.sqlcWebUser.Connected := true;
  SQLMemoField := TStringList.Create;
end;

destructor TIWUserSession.Destroy;
begin
  FreeAndNil(UserAccessRights);
  FreeAndNil(SQLMemoField);
  inherited Destroy;
end;

procedure TIWUserSession.AfterLogin;
begin
  LoggedIn := TRUE;
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

end.